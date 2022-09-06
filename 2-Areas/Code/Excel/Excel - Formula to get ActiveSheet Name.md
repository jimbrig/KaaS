---
Date: 2022-09-03
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Code/Excel", "#Topic/Dev/Excel"]
Alias: ["Excel - Formula to get ActiveSheet Name"]
---

# Excel - Formula to get ActiveSheet Name

```vb
MID(CELL("filename",A1),FIND("]",CELL("filename",A1))+1,255)
```

![[Pasted image 20220903223534.png]]


***

## Appendix: Links

- [[Code]]
- [[Development]]

*Backlinks:*

```dataview
list from [[Excel - Formula to get ActiveSheet Name]] AND -"Changelog"
```