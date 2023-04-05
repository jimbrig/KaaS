# Excel - Formula to get ActiveSheet Name

````vb
MID(CELL("filename",A1),FIND("]",CELL("filename",A1))+1,255)
````

![Pasted image 20220903223534.png](_assets/Pasted%20image%2020220903223534.png)

---

## Appendix: Links

* [Code](../Code.md)
* [Development](../../MOCs/Development.md)

*Backlinks:*

````dataview
list from [[Excel - Formula to get ActiveSheet Name]] AND -"Changelog"
````
