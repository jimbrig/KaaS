# 4 Efficient Workflow | Efficient R Programming

## Metadata

* Author: 
* Full Title: 4 Efficient Workflow | Efficient R Programming
* Category: #Type/Highlight/Article
* URL: https://csgillespie.github.io/efficientR/

## Highlights

* the project will probably transcend the confines of the R world; it must engage with a whole range of other factors. In this context, we define ‘workflow’ as the sum of practices, habits and systems that enable productivity
* For project planning and management, we’ll use the DiagrammeR package. For project reporting, we’ll focus on R Markdown and knitr which are bundled with RStudio
* Top 5 tips for efficient workflow
  Start without writing code but with a clear mind and perhaps a pen and paper. This will ensure you keep your objectives at the forefront of your mind, without getting lost in the technology.
* Make a plan. The size and nature will depend on the project but timelines, resources and ‘chunking’ the work will make you more effective when you start.
* Select the packages you will use for implementing the plan early. Minutes spent researching and selecting from the available options could save hours in the future.
* Document your work at every stage; work can only be effective if it’s communicated clearly and code can only be efficiently understood if it’s commented.
* Make your entire workflow as reproducible as possible. knitr can help with this in the phase of documentation.
* A project planning typology
* Appropriate project management structures and workflow depend on the type of project you are undertaking. The typology below demonstrates the links between project type and project management requirements
* Data analysis. Here you are trying to explore datasets to discover something interesting/answer some questions. The emphasis is on the speed of manipulating your data to generate interesting results. Formality is less important in this type of project. Sometimes this analysis project may only be part of a larger project (the data may have to be created in a lab, for example). How the data analysts interact with the rest of the team may be as important for the project’s success as how they interact with each other
* Package creation. Here you want to create code that can be reused across projects, possibly by people whose use case you don’t know (if you make it publicly available). The emphasis in this case will be on clarity of user interface and documentation, meaning style and code review are important. Robustness and testing are important in this type of project too.
* Reporting and publishing. Here you are writing a report or journal paper or book. The level of formality varies depending upon the audience, but you have additional worries like how much code it takes to arrive at the conclusions, and how much output does the code create.
* Software applications. This could range from a simple Shiny app to R being embedded in the server of a much larger piece of software. Either way, since there is limited opportunity for human interaction, the emphasis is on robust code and gracefully dealing with failure.
