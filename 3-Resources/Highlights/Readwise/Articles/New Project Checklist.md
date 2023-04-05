# New Project Checklist

## Metadata

* Author: 
* Full Title: New Project Checklist
* Category: #Type/Highlight/Article
* URL: https://amihaiemil.com/2019/05/12/new-project-checklist.html

## Highlights

* Repo Creation
* Licence! Depending on your goals, you might need a different type of licence. At the moment, I am only interested in the “author recognition” and “no liability” clauses. For that, I use the BSD-3 Clause licence everywhere. Be sure to also copy the licence text at the beginning of all the source code files.
  .gitignore: Be sure to ignore all the project’s meta-files like IDE-specific settings, build directories and so on. My projects are all Java so I specify there everything that has to do with Eclipse, Netbeans, IntelliJ, Maven etc.
  README: Write an elegant “readme” from the start. It will help you see the goals more clearly and give you a boost of confidence even if the project is still just in your head!
* CI/CD
  The very next thing I do is set up the CI/CD pipeline. This consists of two products:
  Travis CI: Travis is a well-known product, you probably know about it. After linking the repo via Travis’ UI, I always create the .travis.yml file, specifying exactly what the build commands will look like (example here). Then, Travis will just trigger a build with any new Pull Request (and subsequent commits) always telling me if the new changes are breaking the project or not.
  Rultor: I use rultor in all my projects. Nobody writes in the master branch, ever, and nobody merges any PR manually. Rultor will merge it for us when we tell it to. Before merging it, it will also build the project inside a dedicated Docker container – it acts as a second layer of CI, if you will.
  It also helps me automate the releasing and versioning of all my projects. All my deliverables are published to Maven Central (which is quite a complex process) and this great product makes sure that weight is not on my shoulders! Here are more posts about it, if you are curious.
* Quality Gates
  Besides the manual code-review made for each Pull Request, there are 2 instruments I use for automated quality check:
  Checkstyle: Checkstyle is a static code analyzer. It runs as part of each build via a Maven Plugin (see here) and enforces some rules in the code. They can go from stuff as simple as line length to stuff such as class coupling. All the rules are specified in the checkstyle.xml file present in all my projects.
  Code Coverage: I always check to see if the PR doesn’t decrease the code coverage. Usually, I don’t accept PR’s that are decreasing the coverage. I use Jacoco for generating the coverage report and Coveralls for reading and displaying it as a repo badge. The Coveralls bot will usually comment right in the PR indicating the latest status. It all happens via a Maven plugins as well (see here).
* Turn TODOs Into Actual Tasks
  As you probably know, I like to break my tasks into small chunks (30min each). This is a methodology called Puzzle-Driven-Development of which I made a short analysis a while back. Basically, after I finish part of the task and make sure the codebase works fine, I will leave a TODO in the code, which we call a “puzzle”. This TODO is actually the next task in the project and we should have a new Github Issue opened as soon as it reaches the master branch.
  For this automation, I use 0pdd, a bot that will scan my codebase at each push to master and open/close Github Issue when it finds that a puzzle has been added or removed from the code. See an example here.
