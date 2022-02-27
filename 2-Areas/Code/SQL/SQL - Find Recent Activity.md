---
Date: 2022-02-16
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/SQL", "#Topic/Dev/Database"]
Alias: ["SQL - Find Recent Activity"]
---

# SQL - Find Recent Activity

*Source: https://wiki.postgresql.org/wiki/Find_recent_activity*

A request seen occasionally is: given a large table representing changes (whether bug comments, stock ticker prices, whatever), return the few most recently active affected objects and their latest few changes.

Obviously if you are tracking the last change time on a per-object basis there are ways to do this quickly, but at the expense of a non-HOT update of the object row for each insert on the changes table. This page shows how to get recent changes efficiently (single-digit milliseconds) from the changes table alone.

This specific example was written for the following requirement: "Given a (large) table prices(stock,price,updated), find the most recent 3 prices for each of the 10 most recently updated stocks". The presence of appropriate indexes (specifically on (updated) and (stock,updated)) is assumed.

This version is suitable for 9.3 onward: 

```SQL
with recursive
  t1 as ( (select stock, array[stock] as seen
             from prices
            order by updated desc limit 1)
          union all
          (select p.stock, t1.seen || p.stock
             from t1,
                  LATERAL (select p1.stock from prices p1
                            where p1.stock <> all (t1.seen)
                            order by p1.updated desc limit 1) as p
            where array_upper(t1.seen,1) < 10) )
select p.*
  from t1,
       LATERAL (select * from prices p2
                 where p2.stock=t1.stock
                 order by updated desc limit 3) p;
```

This is the original version written for 8.4 onward:

```SQL
with recursive
  t1 as ( (select *, array[stock] as seen
             from prices
            order by updated desc limit 1)
          union all 
          (select (p).*, s.seen || (p).stock
             from (select (select p from prices p
                            where p.stock <> all (t.seen)
                            order by p.updated desc limit 1) as p,
                          t1.seen
                     from t1
                    where array_upper(t1.seen,1) < 10 offset 0) s
          )
        ),
  t2 as ( select stock, price, updated, 1 as n
            from t1
          union all
          (select (p).stock, (p).price, (p).updated, s.n+1
             from (select (select p from prices p
                            where p.stock=t2.stock and p.updated < t2.updated
                            order by p.updated desc limit 1) as p,
                          t2.n
                     from t2
                    where t2.n < 3 offset 0) s
          )
        )
select * from t2;
```

The idea here is to make use of recursion to fetch single rows in the most efficient way available, and then stop when the desired number has been reached. The assumption is that the source table is large compared to the number of rows fetched, and also that the number of distinct stocks is also reasonably large compared to the number fetched, or at least that at least 10 different stocks have updates in the most recent small fraction of the table.

The rather ugly sub-query usage turns out to be required to prevent a full scan of the prices table on the final iteration of each recursive branch.

The following variation is for a "return the most recent 5 posts for each topic" query (however in 9.3+ there is a much simpler LATERAL solution without recursion): 

```SQL
with recursive
  rp as (select (p).*, 1 as rcount
           from (select (select p from posts p
                          where p.topic_id=t.topic_id
                          order by p.post_ts desc, p.post_id desc limit 1) as p
                   from topics t offset 0) s
                  where (p).post_id is not null
         union all
         select (p).*, s.rcount + 1
           from (select (select p from posts p
                          where p.topic_id=rp.topic_id
                            and (p.post_ts,p.post_id) < (rp.post_ts,rp.post_id)
                          order by p.post_ts desc, p.post_id desc limit 1) as p,
                        rp.rcount
                   from rp
                  where rp.rcount < 5 offset 0) s
          where (p).post_id is not null)
select * from rp;
```


***

## Appendix: Links

- [[2-Areas/Code/_README|Code]]
- [[SQL]]
- [[Databases]]
- [[PostgreSQL]]
- [[Development]]

*Backlinks:*

```dataview
list from [[SQL - Find Recent Activity]] AND -"Changelog"
```