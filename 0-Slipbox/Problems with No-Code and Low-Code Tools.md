# Problems with No-Code and Low-Code Tools

*Source: [The Good, Bad, And Ugly Of Low-Code](https://www.forbes.com/sites/servicenow/2021/10/29/the-good-bad-and-ugly-of-low-code/?sh=279114807fd0)*

Low-code app development is here—and not everyone is happy about it.

Businesses that transitioned rapidly to working from home saw how fast and affordable it was to digitize their simple manual processes with low-code applications. But behind the scenes, things were not all glitter and gold.

## Concerns with Low-Code Development

**Too simple.** To full-stack engineers who can make anything out of ones and zeroes, a graphical interface is the bird cage that prevents them from soaring through the skies. 

**Lack of normal software development pipelines.** Take an app and ask two developers to work on it. When one pro coder does something that conflicts with another pro coder, there are well-defined, tried-and-true processes to settle these merge conflicts. Some low-code app platforms do not have a process to settle these conflicts — they often just automatically accept the newest version.

**Not scalable enough.** Seasoned developers spend years developing the expertise to create scalability in an application — and now we are being asked to trust in the scalability of a low-code platform? “This works great in your demo describing a two-step process that will benefit the ten users using it, but what if ten thousand users use it at the same time?” I’ve joined enough low-code app demos on Zoom to see these kinds of questions flood the chat.

### The Fundamental Problem

Low-code app development is not the silver bullet that marks the end of full-stack engineering and traditional IT, but it can be the shiny new tool you want everyone to use. Before using [a low-code app platform](https://www.servicenow.com/workflows/creator-workflows.html?campid=63879&cid=sc:brand:all:forbes:q421:ugly_low_code_hybrid_article_1:2925:phdus:discov&utm_medium=sponsoredcontent&utm_source=forbes "https://www.servicenow.com/workflows/creator-workflows.html?campid=63879&cid=sc:brand:all:forbes:q421:ugly_low_code_hybrid_article_1:2925:phdus:discov&utm_medium=sponsoredcontent&utm_source=forbes"), you should know its limits are and the best use case scenarios. To deny the usefulness of these low-code platforms because they are too simple or cannot do everything is openly admitting you didn’t read the documentation.

Low-code tools can potentially spin up a database with a collection form that automatically sends out approval requests and action tasks, all in a fraction of the time it would take for a full-stack engineer to do from scratch. Could more functionalities be added to this if done from scratch? Absolutely. In the end, it’s up to you to determine which solution should be used — while factoring in level of effort, resources available, and timelines.

## Musings

*Source: [Sell me on Alteryx: datascience](https://www.reddit.com/r/datascience/comments/p2cwuk/sell_me_on_alteryx/)*

It's just very slow and cumbersome to run, especially as you get to more complex pipelines. The theory that non-technical analysts can start doing ETLs and other data transformations without SQL/programming code doesn't work that well in-practice IME; at a certain point, you still need to have the same underlying conceptual knowledge which is often the blocker more-so than the programming aspect. Add-in the much slower, non-standardized, tedious interface and it seems best suited to very specific environments/use-cases.

---

Ultimately the big value add of [Alteryx](../3-Resources/Tools/Developer%20Tools/Data%20Stack/Business%20Intelligence/Alteryx.md) is a low/no code approach to building data pipelines and creating business processes (think 'every month we need to grab x financial data from here, do these transformations, and outputting some insights). As you mentioned you can use it with [2-Areas/MOCs/R](../2-Areas/MOCs/R.md) or [2-Areas/MOCs/Python](../2-Areas/MOCs/Python.md), but its unnecessary for a data scientist or software engineer already experienced with creating and managing data pipelines manually (and as pointed out makes the process slower and more cumbersome).

---

Alteryx has certain advantages over Python and R, but the majority of them are also in Knime which is much cheaper. Sounds like GIS is the only real advantage Alteryx has to justify the 5k+/year price tag.

---

For data prep and manipulation, [Alteryx](../3-Resources/Tools/Developer%20Tools/Data%20Stack/Business%20Intelligence/Alteryx.md) is always going to be considerably slower than pure [2-Areas/MOCs/Python](../2-Areas/MOCs/Python.md) or [2-Areas/MOCs/R](../2-Areas/MOCs/R.md). 

There is a bit of overhead it requires to run it also has issues with multi-threading or multi-core, parallel processing. 

As far as speeding things up, make sure to enable the AMP engine in global settings to turn on multi-threading. 

[Caching](Caching.md) the workflow after long running processes is probably the best thing you can do to make things run faster - this just writes the data to a temp file, then starts the workflow by reading from the temp file instead of running everything (similar the [Memoization](Memoization.md)). 

You can also bump up the sort/join memory (controls how much is stored in RAM before it starts writing to temp files) and limit the use of browse tools to help speed things up.

[Alteryx](../3-Resources/Tools/Developer%20Tools/Data%20Stack/Business%20Intelligence/Alteryx.md) shines in a couple specific areas:

1. Up-skilling non technical users: As mentioned, the ease of use for non-technical users. *Alteryx is basically drag and drop SQL with plenty of prompts to help users get to their desired output.* It is great for quickly upskilling people to do basic data analysis. It has a great library of built in data connectors allowing users can read/write to just about any db or filetype their heart desires (in practice, this usually means reading/writing to excel for non-technical users), and the visual nature tends to be a little more approachable than working in an IDE. However, as others have said if this is the sole reason you're considering Alteryx, there are other less expensive options that you might want to look at.
1. GIS analysis: Alteryx was originally designed as a [Geospatial](Geospatial.md) tool, and it shows. Its pretty straightforward to build and manipulate custom geo polygon objects using the spatial tools. If you're a Tableau user, you can export these directly to a hyper file and Tableau will render them as geospatial data (might be the case for other BI tools as well, I haven't tried).
1. Third party data integration: If your org is willing to pony up for the datapack license (~37K a year if I remember correctly), you'll have access to some fantastic resources. If you want to do any sort of continuous demographic appending to your customer data, this can be a much cheaper solution than going through occasional one-off appends. When we were doing this, we saw match rates on FN/LN/Address around 65-75%. You can combine the data license with the geospatial tools to do some pretty incredible things with trade areas. For example, you can pick a series of geographic points, generate a 10 minute peak traffic drivetime radius, then get average consumer income, consumer demand for specific goods and services, consumer psychographics and demographics, and competitors within this specific radius all using a couple tools. In my opinion, this is where Alteryx differentiates itself from other similar platforms.

One final consideration is deployment. If you want to run workflows on a scheduled basis, you're going to need to pay for Alteryx server, which I believe is another 50K. If you don't have server, you'll need to run from the public gallery or locally, which is probably not a great solution if you're doing anything with confidential information or PII.

One last word of warning, Alteryx does tend to have a fairly high pressure sales team and they will try to nickel and dime you for everything. Things outside the core designer license, the data, and maybe server aren't really worth the ridiculously high price tags.

---

### Appendix Related:

* [Actuarial Science](../2-Areas/MOCs/Actuarial%20Science.md)
* [Prophet](../3-Resources/Tools/Modeling/Prophet.md)
* [No-Code and Low-Code](No-Code%20and%20Low-Code.md)

*Backlinks:*

````dataview
list from [[Problems with No-Code and Low-Code Tools]] AND -"Changelog"
````
