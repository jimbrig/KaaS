# Top 10 Best Practices in Configuration Management

## Metadata

* Author: *cmcrossroads.com*
* Full Title: Top 10 Best Practices in Configuration Management
* Category: #Type/Highlight/Article
* URL: https://www.cmcrossroads.com/article/top-10-best-practices-configuration-management

## Highlights

* Organize Shared Code into Separate Products
  When you're producing software that is shared by different products, issues such as development ownership, timing of releases, etc. are typically difficult to manage because the different products utilizing the shared code have different sets of requirements, and possibly differing processes. Often the shared code starts out as part of one product's
  development but business logic dictates that it be shared in multiple products. 
  The best practice in this situation is to partition the shared code into one (or more) separate products. That product has as its customers, the other product teams. Control of releases, frequency, features, etc. really have to be managed as a full product is
  managed. Different customers will want to move to new releases of the shared product at different times. Some will want the new features, some won't want the risk. The shared code may need to branch into different release streams to support the various customers. ([View Highlight](https://instapaper.com/read/1362928999/14671677))
* Separate Customer Requests from Engineering Problems/Features ([View Highlight](https://instapaper.com/read/1362928999/14671680))
* Customers want to raise problems, ask for new features, or simply specify how
  they believe the tool should operate, without reference to whether it is a feature request or a problem report. Some customers will ask for the same features as other customers, perhaps with a different twist or priority. Customers want to know the status of their requests, many of which can be dealt with directly by the technical support team
  without involving the engineering team. Some are data configuration issues, others non-problems. The customer just wants the majority of requests addressed successfully. 
  The engineering team doesn't care about how many customers report a problem or request a feature - they just want their marching orders: a list of problems to be fixed
  and a list of features to be implemented. Sure they're prioritized based on customer input, but ultimately, this reflects the value of the feature in the product. It's too hard for customers to classify issues as features or problems, and it doesn't really matter anyway - it's input to the product team. But it's critical to distinguish engineering problems from features as they are completely different processes. All this to say, track customer requests separately from engineering problems/features. That is not to say that you should use a separate repository. And of course the engineering records should be
  traced back to the customer requests. ([View Highlight](https://instapaper.com/read/1362928999/14671681))
* Separate Problems/Issues/Defects from Activities/Features/Tasks
  A related best practice that we touched on in the last paragraph is that problem fixing is a completely different process from feature development. One is a fix to the product because it didn't meet the requirements. No new requirement specification. And the specification for the change is the problem report itself. The first step is to ensure reproducibility. The problem has to be investigated for potentially all supported development streams. And so forth. 
  Feature development is completely different. The feature has to be designed and fully specified. New requirements are needed to put the case forward for the feature. User documentation has to be updated. A new set of test cases has to be established. Problems and Features (or more generally activities) are different beasts. Don't try to track them both as "tasks". If you have separate ALM tools to deal with those processes, that's perhaps a different matter. But in a fully integrated system, keep them separate ([View Highlight](https://instapaper.com/read/1362928999/14671682))
* Use Tags and Separate Variant Code into Separate Files
  Avoid the temptation of using parallel branches to manage separate variants. Consider that if you have 3 variant options for language, 3 more for security level and 2 more for packaging, you'll have 18 branches already. Variant management must be addressed in the software engineering realm, not in the CM realm primarily.
  The CM realm should allow you to tag files with the appropriate variant tags, and to
  select files based on one or more specified variant tags. In some cases, the CM tool might go so far as to allow you to tag specific changes as "variant" changes, that can be "automatically" applied to your source code when that variant is selected. 
  But the bigger task of the CM manager is to make sure that the development
  organization understands how to deal with variants. The preference is run-time configuration. Next to that is link/load time configuration (by selecting the files to load or to link together). Then comes compile-time variants, also known as conditional compilation. This is less appealing because you then need different variants of the same object file, making your build task more complex (often the entire build is replicated for each variant to get around this problem). But at all costs avoid the parallel branch approach. ([View Highlight](https://instapaper.com/read/1362928999/14671683))
* Tailor your User Interface Closely to your Process ([View Highlight](https://instapaper.com/read/1362928999/14671688))
* Automate Administration to Remove Human Error ([View Highlight](https://instapaper.com/read/1362928999/14671689))
* Enforce Change Traceability to Features/Problem Reports ([View Highlight](https://instapaper.com/read/1362928999/14671690))
* Best Practices Summary
  So there you have it - the top 10, in fact, the top 20 (or 21).
  1. Use of Change Packages
  1. Stream-based Branching Strategy - do not overload branching
  1. Status flow for all records with Clear In Box Assignments
  1. Data record Owner and Assignee
  1. Continuous integration with automated nightly builds from the CM repository
  1. Dumb numbering
  1. Main branch per release vs Main Trunk
  1. Enforce change traceability to Features/Problem Reports
  1. Automate administration to remove human error
     10.Tailor your user interface closely to your process
  1. Org chart integrated with CM tool
  1. Change control of requirements
  1. Continuous Automation
  1. Warm-standby disaster recovery
  1. Use Live data CRB/CIB meetings
  1. A Problem is not a problem until it's in the CM repository
  1. Use tags and separate variant code into separate files
     18a. Separate Problems/Issues/Defects from Activities/Features/Tasks
     18b. Separate customer requests from Engineering problems/features
  1. Change promotion vs Promotion Branches
  1. Separate products for shared code
     Perhaps these best practice descriptions are more detailed than you expected. 
     Perhaps they don't quite fit into your picture, or you find them too opinionated. Maybe you expected one on how best to do labelling or on how to derive a branching strategy - these would, of course, be incompatible with the best practices that I've mentioned here. Perhaps you have some obvious ones that are missing here - Give me your feedback. I'd love to hear your input. There are many more on the fringes that fall into software engineering, or tool architecture, rather than CM process. What about the order of importance in which I've presented them? That's gotta ruffle some feathers. If not, I'd
     love to hear that too. ([View Highlight](https://instapaper.com/read/1362928999/14671695))
