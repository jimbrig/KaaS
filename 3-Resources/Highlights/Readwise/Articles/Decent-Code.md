# Decent-Code

## Metadata

* Author: 
* Full Title: Decent-Code
* Category: #Type/Highlight/Article
* URL: https://robatwilliams.github.io/decent-code/

## Highlights

* Code review
  Code review is more than a checklist process, but many of the things we look for are simple and there are too many of them to remember. Checklists help us remember, and inform contributors upfront of expectations. This helps reviewers’ time to be better spent on the bigger and less simple things, and reduce contributors’ time spent on revisions.
  Those items that can be automated should be (using tools like ESLint and its plugins, or Checkstyle). Manual detection and correction isn’t reliable, doesn’t scale well, and consumes focus better spent elsewhere.
* Naming things
* One name for each thing, and each name used for only one thing
* Use well-known names from the world, business and technical domains. Doing so maintains a common vocabulary which makes communication more efficient. Avoid overloading such names with different meanings.
* Use names which convey meaning. Meaning is key to being able to understand code. Generic names such as “data” or “value” are less informative
* Avoid letting poor/inconsistent names from other contexts creep in to the code. Such contexts include legacy code, libraries, and other applications we interact with. Establish a boundary within which these naming guidelines are adhered to, and defend it from outside pollution.
* It’s ok for user-facing names to be different. Names shown on the UI/output are often requirements, and appear in their own context. When such names are poor or not appropriate from a code perspective, use a different one where possible.
* Use acronyms and abbreviations sparingly. Code is generally clearer and easier to read without them. Universally accepted ones like id are an exception to this rule, including ones from the business domain.
* Avoid unnecessarily long names. Aim not to be any longer than required to convey meaning. Long names increase the need for statements and method calls to span multiple lines, which makes code less readable. This rule implies avoiding use of a type’s full name as a variable/parameter name where not necessary.
* Avoid over qualifying names. When context for a name has already been established, for example by being within a class or method, it’s not necessary to re-state that context. A task, for example, doesn’t need a taskCompleted.
* Avoid overusing “get” as a method name prefix. Getters return values. Prefer more informative alternatives such as “request”, “fetch”, “find”, “query”, “build”, or “create” where appropriate.
* Strive for distinctive names within the same context. Similar names are easy to mix up, and make code difficult to read.
* Consider qualifying every name when it becomes necessary to qualify one. This often yields greater clarity/distinctiveness than only qualifying one to distinguish it, and makes it more likely that the correct one will be chosen for use in the appropriate places. Example: previousFoo & nextFoo, instead of previousFoo & foo.
* Avoid camelCasing compound words. They are single words in their own right, so don’t require it. Examples: callback, password.
* Avoid doing significant work in constructors. This often limits flexibility around constructing and initialising the class, usually resulting in it being difficult to test.
* Beware of excessive similar conditionals. They can be a sign of a missing or ill-fitting abstraction, or a general a need to improve the design.
* Handle edge cases. Beware only considering the most common scenario. Examples include no data, invalid data, boundary conditions, errors, and null values (where appropriate).
* Avoid running unnecessary code. If the work is done and the return value is ready, then return. Running additional code wastes time, and obscures the intent for those reading it.
* Methods should stand alone, generally. Avoid methods which always require a “companion method” to be called first/afterwards, for example to check preconditions or retrieve a result/error.
* Defaults
  Avoid inappropriate defaulting. Opportunities for using defaults include local/member variables, method arguments, and configuration values. Before creating a default, consider whether it’s helpful, and weigh it against its potential to hide mistakes or be used accidentally and unknowingly.
  Avoid defaulting collections to be empty while data is loading. Doing so removes/hides the distinction between loading states and no-data states, often leading to inappropriate/missing handling.
* Checks
  Avoid unnecessary null checks. There are some things in the technical and business logic domains that we can fairly confidently rely on not to ever be null. Adding explicit checks for them can hide problems, and they bloat the code.
  Avoid inappropriate null/state checks (or those in inappropriate locations) that patch over underlying issues. These are usually checks that skip/branch logic in invalid or edge-case scenarios, done in one place to avoid/conceal a problem that has originated elsewhere. Instead, prefer to address/fix the root cause issue. Also be aware of checks in callers that should be in callees, and vice versa.
  * Tags: *favorite* 
* Handling unhappy path situations
  Fail early and loud, rather than later/quietly. Detect problems at the earliest opportunity, and make them visible, for example by throwing an error. Avoid detecting and then hiding problems silently by skipping some code or using a default value. Examples include initialisation checks, validity checks, method preconditions, and API response status checks. See > fail fast.
* Defensive code vs. strict expectations. Writing defensive code to be accommodating of surrounding problems is an approach that can be used to make applications more robust - working around problems instead of allowing them to cause a failure. A major downside however, is that it makes those problems less visible - in turn making them less likely to be noticed and addressed. It also complicates the code with possibly unnecessary “just in case” handling. For a given area of your application, weigh up the costs and benefits to help decide whether a defensive or strict approach is most appropriate. At a system boundary where an application is interacting with something external outside its control for example, the case for being defensive is more likely to be compelling.
  * Tags: *favorite* 
* Code structure
* General readability and maintainability
* Split up long/big things. This includes files, folders, methods, and templates. Having many lines/files/parts is an indication that something is doing too many things, which makes it difficult to understand, maintain, and adapt. Look for abstractions and responsibilities where a split could be made.
* Avoid drive-by code addition. Think about where new code should go. It can sometimes appear convenient to accomplish a task by adding a few lines/methods here and there to existing methods/classes. Perhaps add a few “flag” parameters to skip some parts of some methods. However, just because somewhere is a convenient place to put something doesn’t mean it should go there - consider if new methods/classes should be created. Further reading: Detecting Refactoring Diligence, by Michael Feathers
* Separation and encapsulation of responsibilities
  Avoid mixing different types of responsibilities in the same class/method. Each one should generally be involved in one kind of responsibility. Avoid mixing data structure manipulation with business logic, or UI behaviour logic with the DOM operations that carry it out, for example.
* Encapsulate application-wide conventions. Repeating even seemingly trivial conventions makes them difficult to identify, apply consistently, and modify. Conventions could be functionality-related (e.g. display of numbers/dates), or code-related (e.g. our pattern for implementing X). Some techniques can be applied in a single place (e.g. serializer configuration), while others are defined in a single place but need to be used/applied by the programmer wherever relevant (e.g. components, utility functions).
  * Tags: *favorite* 
* Ordering
* Think about the order of things, generally. Ordering things (e.g. methods, config files) in a well-thought-out way makes it quicker and easier to find what you’re looking for. This includes determining if it exists at all. It also helps you notice related things you weren’t looking for but should probably be aware of. The best order for most things isn’t by the time in which they were added. Some things need individual judgement, while others are partially/completely well-defined (e.g. alphabetical, lifecycle methods).
* Put important code at the top, and less important code at the bottom. This is known as “newspaper code structure”; start with the important (headline), then read on for further detail in descending order of significance (summary paragraph, full article text). It allows the reader to quickly understand the key things about the file without needing to scan over all of it. Applying this as an example, constructors would go near the top, and helper methods and getters/setters would go at the bottom.
* General programming
* Writing, reading, and working with code
* Code should be easy to follow. After writing a piece of code (and tests for it, if appropriate), consider if it could be refactored to make it clearer. Clear code consumes less mental energy to understand, leaving more spare for better uses.
* Code should be easy to use right, and hard to use wrong. It should guide people down the right path naturally. It should get in the way and make things difficult when someone tries to use it wrongly.
* Code should be easy to change right, and hard to change wrong. It should help people decide what to change, and where to do it. It should resist when someone tries to change it wrongly (break it), and cause test failures.
* Minimise the odd, the unusual, and cleverness. Prefer simplicity and clarity. Write boring code, and write it to help others (and your future self) rather than attempt to impress them.
* Prefer a functional approach to an imperative one. Less mutable state and side-effects make code less error-prone, and easier to reason about.
* Minimise held state. State of any form (e.g. variables, caches) tends to be a source of complexity and problems, so it’s best to keep as little of it around as necessary. Prefer to derive information when needed, to storing it, if constraints allow.
* Help compilers/transpilers and static analysis tools to help you. These tools can detect problems in code before it’s even run, giving a shorter feedback loop. Be aware of the problems your tools can detect, and write code to help them. For example, use annotations such as @Override, use constant variables, avoid unnecessarily initialising variables, avoid subverting the type safety system, and avoid suppressing warnings.
* Data and values
* Create and use data types that model the domain. Avoid using strings for everything just because it’s possible and appears to be convenient. Domain-based data types are key to object oriented programming, provide natural homes for many methods, and provide the compiler with information it can use to detect erroneous usage.
* Include units of measurement/magnitude in domain data types. This empowers the domain model together with the compiler to guard against invalid calculations. This is akin to the use of dimensional analysis of a derived physics equation’s input and output units in order to verify that it was derived correctly. It also removes the need for including the unit (e.g. MWh) in property/variable names.
* Extract constants for magic numbers, generally. There are however some cases where doing so adds noise, such as for zero.
* Methods (general programming)
* Order parameters intuitively. Put the more important parameters nearer the first. Put related ones next to each other. One trick to help with choosing an intuitive order is to construct a sentence describing a call to the method; the parameters often fall naturally into an order within the sentence.
* Order parameters consistently. Where there are overloads, or many methods taking similar parameters, all the methods should take the common parameters first.
* Avoid Boolean parameters. When reading calling code, Boolean parameters make it difficult to know the intent of calls. Consider a two-element enum, a parameters object, or a separate method for each case. Further reading: The Pitfalls of Boolean Trap, by Ariya Hidayat
* Logic
* Base logic on identifiers, not names. Names are not generally guaranteed to be unique, and are prone to change. Identify things using their identifiers to drive logic.
* Functional
* The feature works in the “prod mode” build (if applicable). Development modes, which are often used to improve the developer experience (productivity), make the running application less like what the production version will be. Testing while using such modes can result in undetected problems, and also typically reduces performance.
* Fail fast, and fail proactively. Detect problems at the earliest opportunity, and make them immediately and clearly visible (e.g. log, UI message, application abortion). Avoid allowing the application to continue into undefined states - hoping for the best. The “fast and proactive” strategy makes problems from many facets (e.g. code, configuration, infrastructure) easier to find and diagnose, findable sooner, and helps avoid collateral damage. For example, an application would fail at startup if a database/API connection cannot be established - rather than doing so the first time its API is called. Another example: an application would fail at startup if the configuration (or permutation of user permissions) is invalid - rather than doing so if/when a particular feature is used, falling back to a default value, or continuing execution anyway.
* Error handling
* Either log exceptions, or throw them - not both, generally. Thrown exceptions will be caught at some level; if the lower level thrower can’t handle the exception then it’s likely not best placed to decide that it should be logged, and to do so informatively with context. Widespread log-and-throw also leads to duplicate logging as an exception bubbles up the call hierarchy. An exception to the rule is when that higher level is outside our control (e.g. a framework) - and doesn’t log, logs at an undesirable level, or doesn’t include sufficient detail.
* Control flow
* Information management and capture
* Include relevant and contextual information in exception/log messages. Such information aids diagnosis of problems. Examples include problematic values, state, and identifiers. For custom exceptions, some of this information can be made mandatory in the constructor as opposed to the common practice of accepting a single string message.
* Consider catch-wrap-rethrow to add a more helpful message and/or contextual information. The original thrower may not have had much context or data to construct a particularly useful message. Callers of such throwers can catch such exceptions and wrap them in more informative exceptions before throwing those further.
* Log caught exceptions in full, generally. Logging only a generic message, or only the caught exception’s message, discards potentially useful information - the messages of wrapped cause-exceptions, and the stack trace. At a system boundary (e.g. when exposing an API), it’s usually desirable to omit (or log at a lower level) the detail of client errors (e.g. re
* User interface
* Show appropriate and helpful information to the user. The main body should communicate in non-technical terms what the problem is, the current state of what the user was doing, and a path to rectifying the problem. Technical detail may be included in a revealable area for inclusion on bug reports.
* Logging
* General (logging)
  Bear in mind the purpose of logging. The main ones are: determining if the application is running smoothly, and diagnosing what the problem is if it isn’t running smoothly. Having these in mind helps when deciding if we should log, and if so, what information should be included. There should be some “tickover” INFO logging while the application is in use, to indicate that everything’s fine. When things aren’t fine, there should be WARN and ERROR logging to call attention to that, and detail what the problem is.
* Read logging output to ensure “flow”. It should read coherently, as a story of what’s happening. Try reading it while exercising specific application tasks, and while a load test is underway.
* Content (logging)
* Write clear, concise, and unambiguous messages. Messages which follow these principles are quicker and easier to understand, and help avoid misinterpretation or confusion.
  Include relevant and contextual information. Such information aids diagnosis of problems. Examples include key values, state, and identifiers. For ease of searching and to allow parsing by log viewing tools, consider using a pattern such as key=value | other=value.
  Distinguish values from message text using delimiters. Some types of data can be hard to distinguish from the log message template itself, when they are embedded within the message. Use delimiters such as quotes, braces, or angle brackets to clarify the boundaries where necessary.
  Use mapped diagnostic context (MDC) to distinguish logging from multiple threads. It’s almost impossible to gain an understanding of what’s going on when logging output from multiple concurrent thread is interleaved. Including context information such as user/request IDs in individual log statements is tedious and repetitive. Instead, configure your logger’s pattern to include such information on every line as it does with the timestamp.
* Tests
* Tests are code, too. The items from the other topics in this guide apply. They require code review, and are subject to the same automated and manual quality checks and rules as the main code. Poor test code is less reliable, and can make it difficult to change or refactor the main code.
* Keep test code close to the code they’re testing.
* Single focus and purpose per test. Tests with wide scope are less clear, and make it harder to identify the cause of failures. Aim for failures only related to the case described in the test name, and make assertions as required.
* What to test
* Balance value against cost. Tests require effort to write and maintain. Consider for a given piece of code (however small) if the confidence you gain in its correctness and avoidance of future breakages is worth it against how time consuming and difficult it is to test. This item is not an excuse for antipatterns that make code difficult to test.
  * Tags: *favorite* 
* Include tests for edge cases and unhappy paths. We need to be confident that our code works in all cases, not just the “normal” ones which may occur the vast majority of the time. Examples include errors, timeouts, invalid data, no data, and boundary values.
  * Tags: *favorite* 
* Abstract common setup logic into utility functions. This avoids pretty much all the issues that arise from using hooks. Extract shared setup logic into utility functions, and use them directly and as-needed from individual tests. The functions return objects ready for use in the test, and often accept parameters (data, or options) to allow tailoring the setup for individual tests. The latter makes it easy to see the difference in setup between each test.
* Assertions
* Use strict assertions. These strengthen the test and make it more likely to detect future regressions. Examples include strict equality, and errors/exceptions of specific types with specific messages.
* Files
* Named well and as per conventions. Refer to . Follow project conventions (e.g. suffixes) and casing style.
  In an appropriate folder. Considerations include purpose and functional area.
  Organised by functional separation, rather than by file type. This means by application functional area / module, or component - not by file type (e.g. controllers, styles, DAOs). Structuring this way keeps related code together, which aids discoverability and navigation.
* End files with a line break. This avoids the existing final line being considered as modified in a diff when you add a new line after it later.
  * Tags: *favorite* 
* Use single blank lines judiciously to separate constructs and groups of statements. Blank lines create visual separation between logical parts, making code easier to read. Dense code is harder to read. Examples include after a group of variable declarations, around an if-else statement, around logical parts of a method, and before a return statement.
* Dependencies
* Consider if there’s a real need to use a library/tool. If the task at hand can be done with a few lines of straightforward code, it may not be worth adding a new dependency. Be familiar with the latest platform/SDK and already-present libraries - what you need may already be available.
  * Tags: *favorite* 
* Choose libraries/tools carefully. Consider factors including quality, popularity, documentation, “aliveness”, deprecation, and strength of community. Review alternatives. Depending on the nature of a library, its use may be localised in an area of a project - or widespread and intertwined with application code. The latter ones require particular care.
* Use the latest non-beta versions, generally. These should be stable, include the latest features and bug fixes, likely to receive bug fixes, and have readily-accessible documentation. Newly-released major versions of dependencies that interact closely with others, or have a plugin ecosystem, may be worth deferring until the surrounding landscape catches up and settles down.
* Follow established patterns and idioms for a given dependency. Major libraries, frameworks and tools most often have an established way of using them effectively. This may be a combination of official and community-driven. Familiarising yourself with it will help you get the most out of them and avoid antipatterns. Read more than just the getting-started page.
* Avoid reimplementing library/framework features due to ignorance. Try to be familiar with the “headline features” of what’s already available. It’s impossible to know everything and keep up to date, so you may find the following rules of thumb to quickly consider if something’s likely to already be available: 1) Am I likely to be the first ever person using library-X that needed this feature? 2) If I was writing my own library-X, would I include this feature?
* General (CSS)
* CSS is code, too. The items from the other topics in this guide apply. It requires code review, and is subject to automated and manual quality checks and rules - just like any other application code. Poor CSS is difficult to modify and extend, and can make it difficult to change or refactor the application.
  Keep CSS close to the component code that it styles.
* Rules
* Use semantic class names. Describe the purpose of the rule (e.g. product), not the content of the rule (e.g. redBackground). There are however a small number of exceptions where presentational/utility classes can be useful.
* Features and techniques
* Avoid using text-align to align elements. This is an inherited property, so children of an element that is aligned using it, must counteract the unwanted text alignment by setting their own text-align. Use flexbox to align elements instead.
* Avoid using !important. Adding this to a declaration to force-win a selector specificity contest should be avoided. It breaks out of the normal rules of specificity (being at the declaration level), and cannot be overridden without using yet another !important - tending to result in proliferation of its use.
* Isolation
* Commits
* Document relationships between distant and disconnected parts of the code. It’s quite rare that these can’t be made explicit through code. They are often things that are a certain way because something else far away (could even be in a downstream system) is a certain way - such as dependencies, or matching behaviours. Changing one could break the other in a surprising way, or introduce inconsistency in the user experience.
* Explain the choice of particular “magic values”. These include framework/server settings, timeouts, limits, batch/pool sizes, priorities, cache configuration, and orderings. We’re familiar with extracting such values from our code into constants or configuration, but the reasons behind choosing the actual value is often left out. In some cases, this is after spending significant effort on activities such as load testing in order to choose appropriate values. Documenting these allows future changes to be made with greater confidence.
* Consider whether the code could be improved such that the comment would no longer be necessary. Comments which explain what the code is doing, and sometimes why, can often be rendered unnecessary through improving naming, refactoring (e.g. extracting a function), or introducing explanatory variables.
* Draw attention to the surprising and “gotchas”. If something is unintuitive or caught you out, it may be worth noting to help others. Examples include seemingly illogical business “logic”, and surprising library code behaviour.
* Highlight bug workarounds, linking to an issue report. This allows them to be easily identified and removed at a later date when the underlying bug (e.g. in a library) has been fixed.
* Write clearly, concisely, and unambiguously. Comments which follow these principles are quicker and easier to understand, and help avoid misinterpretation or confusion. The process of writing can often trigger ideas or solutions to problems, in much the same way as merely explaining a problem to someone can help you come up with a solution. Refactoring isn’t only for code; after writing a comment, read it and consider if it could be improved.
  Ensure that comments are in sync and correct with respect to the current version of the code. Outdated or no longer applicable comments can cause confusion.
* Follow the project’s strategy for managing TODO comments. Buildup of such comments in the code often indicates buildup of technical debt and necessary work. These tasks remain invisible to project feature/bug work tracking, leaving them in danger of being overlooked and forgotten - with various consequences. One such strategy is to require all TODOs to reference an issue tracker ticket before a pull request can be merged.
* One logical piece of work per commit. Separate each feature, bug and refactoring from other ones. This makes for a more useful history, and also encourages an organised approach to carrying out work. If you need to fix a bug while working on a feature, consider temporarily putting away your feature changes using a source control feature such as Git’s stash.
* Prefer smaller, more regular commits. Overly large commits are harder to understand and review effectively. Commit larger pieces of work incrementally as you reach small milestones.
* Separate out refactoring where possible. Refactoring tends to be harder (and so less effective) to review, often including many moves and edits of existing code. Mixing it up with feature/bug work in a commit makes it harder still. When a task starts with some up-front non-trivial refactoring, consider making a separate, earlier pull request to get the changes to the main branch earlier. This helps avoid conflicts with other contributors’ ongoing work.
* Remove existing code rendered unused by your changes. The code immediately being removed may have been the only user of other parts of the code. The now-unused code could be in the same file, elsewhere in the codebase, or all the way down the stack from the UI to the database.
* Address or remove relevant existing and new TODO comments. Existing ones may refer to the now-completed work. New ones may be temporary and require removal, or refer to issue tracker tickets for later work.
* Avoid including unrelated and unexplained changes. An extension of the first item. Such changes are often issues, or mistakes made while resolving merge/rebase conflicts.
* Avoid including left-over unused code. Such code is often from experimentation, trying different approaches, or trial-and-error. It may not be having an effect, or even running at all. CSS in particular tends to be quite susceptible to this.
  Avoid accidentally including unwanted files such as personal configuration and log files. Use your source control tool’s ignore-file feature to prevent accidentally including such files. Check in the ignore file. Configuration that needs to be consistent across the team should however be checked in.
  * Tags: *favorite* 
* Strive for small pull requests. Large pull requests are harder to review, resulting in poorer feedback, unnoticed problems, “speed reviewing”, and slow progress towards approval. If you’re unable to split up work items for large features (due to process or politics), consider an incremental technique involving a series of smaller (e.g. 200-400 line) pull requests into a “collector branch” culminating in a single big pull request from that branch to the master/trunk.
* Strive for short-lived pull requests. Any in-progress or in-review work on a branch is not yet part of the master/trunk that others are basing their work on. That can lead to conflicts which are time-consuming and error-prone to resolve. Being open for a long time increases the likelihood that a pull request will be open for an even longer time - as it requires updates after other pull requests are merged ahead of it (possibly involving conflict resolution). Consider setting some general and “SLA-type” ground rules to promote short-lived PRs, for example: review within n hours of being submitted, and review PRs or address feedback before starting new work. Making small pull requests helps keep them short-lived.
* Automate the tedious things. Configure the build to require passing code style and static analysis checks. Such issues are quicker, cheaper, and more consistently detected by tooling than people.
  Set expectations up-front. Make it easy for contributors to submit pull requests that will be approved first time, or at least without requiring major changes. Things that help with this include clear requirements, common understanding of application architecture and programming patterns/practices, and sharing design ideas before implementation starts.
* Complete the pre-submit checklist. Checklists help everyone remember things that need to be done. What needs to be on the pre-submission checklist depends on the team and project, and should evolve over time - for example, what things are always coming up as feedback. To avoid diluting its importance, it shouldn’t be too long or include trivial things. If the repository supports templates for pull request descriptions, create one containing the checklist - otherwise, a bookmarklet to quickly populate the pull request description field can help.
* Think ahead to future work. We want to keep things simple and avoid building things we’ll never need. We can however avoid making life hard for our future selves by being aware of upcoming and medium-term requirements, and bearing them in mind today.
  * Tags: *favorite* 
* UI text
  These items apply to all text regardless of who wrote it; text provided by UX or business stakeholders should be reviewed and any issues resolved with the author.
  Be accurate and unambiguous.
  Avoid contradicting other text or actual application behaviour. Existing text in other areas of the application may need to be updated.
  Use correct spelling and grammar.
  Use consistent capitalisation of terms.
  Use consistent style and tone.
  Use correct tense (current/past). This also applies to log messages.
  Use consistent terminology when referring for example to application features and business concepts.
  Avoid relying on enum member order for UI display order. Logical or alphabetical display order is often different from order of members in code. The order of members is also liable to change, without expectation of any side-effects.
  Use realistic and professional mock data. Realistic data helps detect issues that could occur later using real data. Unprofessional or joke data can cause offence, or give a poor impression of the team - you never know who’s going to see it and what frame of mind they’re going to be in.
* Bug fixes
  Find the cause before attempting a fix. Any fix based on first-glance analysis without knowing or understanding the cause is unlikely to be a good/correct one.
  Are there other occurrences of this bug or similar ones that need fixing? They could be in similar functionality, or in code using similar techniques/patterns that could be prone to similar programming errors.
  Fix the root cause. Fixing symptoms alone, or intermediate causes, is a workaround rather than a complete fix. They often involve adding code to work against something other code is doing.
  Understand why the fix works. A fix which appears to work, but cannot be explained why, may be unreliable or incomplete.
  Add test(s) which don’t pass without the fix. Tests will help prevent regression - the bug being reintroduced through later changes. Choose unit and/or integration tests as appropriate. Validate the test by checking that it fails against the unfixed code.
