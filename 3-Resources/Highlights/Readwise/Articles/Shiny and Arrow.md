---
Date: 2022-07-02
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: feedly
Link: https://www.r-bloggers.com/2022/06/shiny-and-arrow/
Tags: ["#Type/Highlight/Article"]
Aliases: ["Shiny and Arrow", "Shiny and Arrow"]
---
# Shiny and Arrow

## Metadata
- Author: [[RStudio | Open source & professional software for data science teams on RStudio]]
- Full Title: Shiny and Arrow
- Category: #Type/Highlight/Article
- URL: https://www.r-bloggers.com/2022/06/shiny-and-arrow/

## Highlights
- When you think about storing data in flat files, formats like .csv or .txt probably come to mind. However, as your data becomes “big”, transitioning your data to more modern, column-oriented file types (e.g., .parquet) can drastically reduce the size of the file containing your data and increase the speed at which other applications can read that data.
- Interestingly, .parquet files not only store your data, but they also store data about your data (i.e., metadata). Information such as minimum & maximum values are stored for each column, which helps make aggregation blazing fast.
- The Benefits of {arrow}
- The {arrow} package provides major benefits:
  It has the ability to read & write .parquet files (among other file types)
  You can query the data in that file before bringing it into an R data frame, using {dplyr} verbs, which provides for dramatic speed improvements
- The combination of {arrow} and {dplyr} also results in lazy evaluation of your data manipulation statements. This means that your {dplyr} functions build a “recipe” of transformation steps that will only evaluate once you are finally ready to bring the transformed data into memory
- We have learned that the combination of {arrow} + {dplyr} + .parquet gives us all of the memory-saving benefits we would get from querying a database, but with the simplicity of flat files.
