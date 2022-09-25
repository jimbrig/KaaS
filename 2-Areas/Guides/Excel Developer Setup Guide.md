---
Date: 2022-09-04
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Guide", "#Status/WIP"]
Alias: "Excel Developer Setup Guide"
---

# Excel Developer Setup Guide

## Overview

To setup a proper development environment for [[Excel]] the following steps should be taken:

1. Download and Install [[Microsoft Office]] 


### Flowchart

```mermaid
flowchart LR
	subgraph install[Installation]
		
		download[Download Office]
		insiders[Join Inisider Program]
		update[Update Office]
		
		download --> insiders --> update
	end
	
	subgraph config[Configure]
	
		enableDev[Enable Developer Tab]
		customizeRibbon[Customize Ribbon]
		personalWB[Create PERSONAL.xlsb]
		addRefs[Add External References]
		addMacros[Add Custom Macros and Modules]
		assignHotKeys[Assign Keyboard Shortcuts]
		document[Document Personal Macros]
		
		enableDev --> customizeRibbon --> personalWB --> addRefs --> addMacros --> assignHotKeys --> document
		
	end
	
	subgraph extras[Install AddIns and Tools]
	
		installAddIns[Install Excel Addins]
		installTools[Install External Tools]
	
		installAddIns --> installTools
		
	end
	
	subgraph backup[Backup with Version Control]
		
		exportVBA[Export VBA Code]
		git[Backup with Git]
		
		exportVBA --> git
		
	end
	
	install --> config --> extras --> backup
	
	
	
```

***

## Appendix: Links and References

- [[2022-09-04]]
- [[2-Areas/Code/Excel/_README|Excel]]
- [[2-Areas/Code/VBA/_README|VBA]]

***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022


