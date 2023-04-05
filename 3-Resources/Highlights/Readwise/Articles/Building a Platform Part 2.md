# Building a Platform: Part 2

## Metadata

* Author: *Justin Coulston*
* Full Title: Building a Platform: Part 2
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/cc8998716246

## Highlights

* Architecture represents the significant design decisions that shape a system, where significant is measured by cost of change.
* Architecture is the decisions that you wish you could get right early in a project, but that you are not necessarily more likely to get them right than any other.
* Architecture is a hypothesis, that needs to be proven by implementation and measurement.
* Good Architecture
* Is the significant design decisions with a high cost of change.
* Are the decisions that are hard to get right early on.
* Is proven through implementation and measurement (i.e. using it)
* To build a successful platform, whether it be a business platform, a SaaS product platform, or even a platform as a service, the architecture must remain strong; something that will allow the platform to evolve.
* A module, as defined here is,
* An assembly, or group of assemblies, that form a significant level of functionality, usually built on a core framework, or the platform itself.
* Working with other modules in an integrated fashion is allowed, and in fact encouraged. But this is typically implemented as classes implementing the calling module’s interfaces.
* Distributables (Assemblies / Class Libraries)
* A Distributable is any grouping of classes, or class files, that form a logical grouping and are distributed together.
* Namespaces are unique scopes, or paths, to symbols within a codebase, often used to prevent clashes
* Abstractions
* A mapping, or representation, of a problem onto a new representation. A compression process where the mapping is based on similarities in constituent data.
* Code Contracts
* Code Contracts are formal, or informal, agreements between two entities in a software system, or external actors.
* Contracts can be about anything within a system. We’re talking about agreements, which put a different way, is about requirements. A requirement is an agreement (or contract) that we make with the business to fulfill within the software. We must adhere to the contract; else the success of the product may fail.
* Implementations
* Implementations are defined as one or more fulfilled abstractions, or more generally contracts, within a code system.
* We know implementations as classes, functions, or data. In this series, when we talk about implementations, we will be referring to an implemented interface, in most cases. However, it may mean any contract that must be fulfilled, through the use of modules, libraries, classes, or functions.
* Determining your Architecture Rules
* It may be important to start off by saying that there are NO hard and fast rules about which architecture is right or wrong or even when certain ones should and shouldn’t be used. However, I can say that I am a strong opponent to the “layered-architecture.” Of all the architectures, this is the one that is most misunderstood, and the one I find folks implement in the most annoying of ways.
* Clarification, I’m not actually against the Layered Architecture, just how I’ve seen it implemented incorrectly time and time again. It actually serves a good purpose in some scenarios.
* Layered Architecture
* I don’t necessarily see architecture as layered, or “clean”, or shaped like an onion, or only microservices, or any of the multitude of others. Each of these have great aspects to them. Some are simple to understand, and some provide a clear picture. I think the best way for me to describe my architectural “pattern” is to see things as a graph of modules.
* We should define an architectural pattern at each conceptual level of our platform! But not more than one!
* Source Code Organization (Repositories)
* Separate Repositories (Polyrepos)
* Single Repository (Monorepo)
* For me, I’m probably biased towards monorepos. The advantage of choosing a monorepo is the collaboration. This can be utterly critical for a platform. Platforms are meant to be unified in nature and the best way to do that is to have everyone in the same place.
* There are 3 primary directories at the root:
* docs/ : Holds all documentation related to libraries, products, and general documentation
* eng/ : Holds all details related to engineering including scripts, build, and release pipelines
* src/ : Holds the source code of the platform
* internal/ : Holds internal code, like CLI utilities for the team, Test Applications, etc.
* libraries/ : Holds shared libraries for the platform team which could include cross-cutting distributables for logging, security, etc. It can also hold module specific client libraries to be used by other teams. This is a flat list of libraries
* products/ : Holds the module / product-specific source for a team. All interfaces, libraries, tests, and data definitions are held here.
* src/ : Holds the primary source code
* tests/ : Holds all test-related code for the given product or library
* data/ : Holds any data definitions for the product, like database projects, schemas, OpenAPI, etc.
* Logically group abstractions into a single assembly. Include any models required by the abstractions, but do NOT include implementations.
  Example: Sparcpoint.Inventory.Abstractions or Sparcpoint.Inventory.Assemblies.Abstractions
* By re-use I mean different presentation interfaces (CLI, Web, etc) if done well. It is also easier to manage smaller assemblies than massive ones, even with the best of organization.
* Functions and Data
* Attempt to make as many services as possible work without state. This allows for DI to create a single instance saving on memory. It also makes debugging much easier without having to worry about race conditions.
* Inject abstractions almost entirely (Depend on abstractions not concretions).
* Keep interfaces as small as possible. This provides flexibility when cross-cutting concerns arise.
* Any models that are being used as data transfer objects (DTOs) for JSON serialization, database transfer, or specialized services should be internal to the assembly. Attempt to only rely on public models and avoid mapping logic where possible.
* Use Request objects for repositories and interfaces over separate parameters. They can be treated like overloads by making some properties optional. If quality-of-life improvements are needed, use extension methods (or your language equivalent).
* When the language supports it, use async/await. Generally, saves on performance.
* Avoid public functions on implementations when not defined on the abstraction. Instead use internal scope when required by other classes within the assembly.
* (Obvious) Keep methods reasonably small, less than 80 lines (at most).
* Document your Architecture. There are a million and one ways to document architecture. Figure out what is best for you and the team and put it in your docs/ folder, so folks understand the expectations.
