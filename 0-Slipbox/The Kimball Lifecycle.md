# The Kimball Lifecycle

*Source: [The Kimball Lifecycle - Wikipedia](https://en.wikipedia.org/wiki/The_Kimball_Lifecycle)*

## Overview

**The Kimball Lifecycle** is a methodology for developing [data warehouses](Data%20Warehouse.md), and has been developed by [Ralph Kimball](../2-Areas/People/Ralph%20Kimball.md) and a variety of colleagues.

## Project Planning

According to Kimball, this phase is the start of the lifecycle. It is a [planning](https://en.wikipedia.org/wiki/Planning "Planning") phase in which project is a single iteration of the lifecycle while program is the broader coordination of resources. When launching a project/program Kimball suggests following three focus areas:

* Define and Scope project
* Plan project
* [Project management](https://en.wikipedia.org/wiki/Project_management)

## Business Requirements Definition

This phase/milestone of the project is about making the project team understand the [business requirements](https://en.wikipedia.org/wiki/Business_requirements "Business requirements"). Its purpose is to establish a foundation for all the following activities in the lifecycle. Kimball et al. makes it clear that it is important for the project team to talk with the business users and be prepared to focus on listening and to document the interview. An output of this step is the [Enterprise bus matrix](https://en.wikipedia.org/wiki/Enterprise_bus_matrix "Enterprise bus matrix").

## Technology Track

The top track holds two milestones:

1. **Technical Architecture** Design is supposed to create a framework for the DW/BI system. The main focus in this phase is to create a plan for the application architecture, while considering business requirements, technical environment and the planned strategic technical directions.
1. **Product Selection & Installation** use the architecture plan to identify what components are needed to complete the DW/BI project. This phase then selects, installs and tests the products.

## Data Track

**[Dimensional Modeling](Dimensional%20Modeling.md)** is a process in which the business requirements are used to design dimensional models for the system.

**Physical Design** is the phase where the database is designed. It involves the database environment as well as security.

**ETL Design & Development** is the design of some of the heavy procedures in the DW/BI-system ([Extract, Transform, Load](https://en.wikipedia.org/wiki/Extract,_Transform,_Load "Extract, Transform, Load")). Kimball suggests four parts to this process, which are further divided into 4 subsystems:

* Extracting data
* Cleaning and conforming data
* Delivering data for Presentation
* Managing the ETL system

---

## Appendix: Links

* [Ralph Kimball](../2-Areas/People/Ralph%20Kimball.md)
* [Kimball Techniques for Data Warehousing](Kimball%20Techniques%20for%20Data%20Warehousing.md)
