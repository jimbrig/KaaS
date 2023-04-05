## Metadata

* URL: [https://www.soa.org/sections/technology/technology-newsletter/2021/october/att-2021-10-loudenback-vanguelov/](https://www.soa.org/sections/technology/technology-newsletter/2021/october/att-2021-10-loudenback-vanguelov/)
* Publisher: *www.soa.org*

## Highlights

* In the 2021 Stack Overflow Survey, Julia was the 5th most loved language. This was ahead of other languages commonly used in actuarial contexts, such as Python (6th), R (28th), C++ (25th), Matlab (36th), or VBA (37th).
* The language itself offers expressiveness, pleasant syntax, and less boilerplate than many alternatives.
* Multiple dispatch is a programming paradigm that is an evolution of object-oriented approaches that's more amenable to a wide range of programming styles, including functional and vectorized approaches. It affords Julia code a high level of composability and is what makes the Julia ecosystem so powerful.
* High performant Julia code, instead of needing libraries written in C/Cython/etc. For lots of problems, especially "toy" problems as you learn a language, the speed of Matlab/Python/R is fast enough. However, in real usage, particularly actuarial problems, you might find that when you need the performance, it's too late.\[1\]
* The language, tooling, and ecosystem is very modern, mature, and powerful. A built-in package manager, packages that work together without needing to know about each other, differentiable programming, meta-programming (macros), first-class GPU/parallel support, and a wide range of packages relevant to actuarial workloads.
* Julia is a high-level language, with syntax that should feel familiar to someone coming from R, Python, or Matlab.
* Julia code is compiled on-the-fly, generating efficient code for the specific data that you are currently working with. This is kind of an in-between of a fully interpreted language (like pure Python or R) and a complied language like C++ which must compile everything in advance.
* Born of a desire to have the niceties of high-level languages with the performance of low-level compiled code, there are many built-in data structures and functions related to numerical computing like that used in finance, insurance, and statistics.
* There are two features we'd like to highlight here, which exemplify powerful features not available in other languages. These might sound a little technical at first, but as Paul Graham describes in his essay, “Beating the Average,” it is hard to see what you might be missing until you get experience with it.
* Multiple Dispatch
* Multiple dispatch is the term for deciding which function to call based on the combination of arguments.
* Meta-programming and Macros
* Meta-programming is essentially the ability to program the language itself, and macros are one of the tools that provide this ability. In the Paul Graham essay mentioned above, macros are an example of the competitive advantage conferred by a more powerful language.
* Note that using macros is quite prevalent when coding in Julia, however writing macros is more advanced usage and beyond the scope of a "getting-started" guide.
* Package Management
* Julia comes with Pkg, a built-in package manager. With it, you can install packages, pin certain versions, recreate environments with the same set of dependencies, and upgrade/remove/develop packages easily. It's one of the things that just works and makes Julia stand out versus alternative languages that don't have a de-facto way of managing or installing packages.
* Related to packages, are environments which are self-contained workspaces for your code. This lets you install only packages that are relevant to the current work. It also lets you “remember” the exact set of packages and versions that you used. In fact, you can share the environment with others, and it will be able to recreate the same environment as when you ran the code. This is accomplished via a Project.toml file, which tracks the direct dependencies you've added, along with details about your project like its version number. The Manifest.toml tracks the entire dependency tree.
* Pluto.jl is a newer tool, which adds reactivity and interactivity. It is also more amenable to version control than Jupyter notebooks because notebooks are saved as plain Julia scripts. Pluto is unique to Julia because of the language's ability to introspect and analyze dependencies in its own code. Pluto also has built-in package/environment management, meaning that Pluto notebooks contains all the code needed to reproduce results (as long as Julia and Pluto are installed).
* The Julia ecosystem favors composability and interoperability, enabled by multiple dispatch. In other words, because it's easy to automatically specialize functionality based on the type of data being used, there's much less need to bundle a lot of features within a single package.
* the Tidyverse in R has a tightly coupled set of packages that works well together but has limitations with some other R packages.
* Julia also has language-level support for documentation, so packages can follow a consistent style of help-text and have the docs be auto-generated into web pages available locally or online.
* Test is a built-in package for performing testsets, while Documenter.jl will build high-quality documentation based on your inline documentation.
