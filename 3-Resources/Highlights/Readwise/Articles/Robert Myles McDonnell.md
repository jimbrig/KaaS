# Robert Myles McDonnell

## Metadata

* Author: *robertmylesmcdonnell.com*
* Full Title: Robert Myles McDonnell
* Category: #Type/Highlight/Article
* URL: http://robertmylesmcdonnell.com

## Highlights

* This post details how I use Gatsby.js to blog about R stuff. My site is deployed by Netlify, which builds it after any merges into the master branch repo on GitHub. I use a little tool I wrote called writeMDX to help me out.
* The workflow is quite simple: write something -> commit, upload to GiHub -> Netlify builds and deploys. This post is about when that 'write something' part is about R and written in RMarkdown.
* If you're an R user and you have a blog, there's a fair chance you use blogdown. I used to, it's very handy. (I'm not suggesting ditching blogdown btw, I think it's fantastic. If that works for you, great.) What if you want to continue to write about R, use RMarkdown etc., but build your site using something like Gatsby?
* For a data scientist, that's quite interesting -- it's like a SQL query to get all the MDX files, count them, extract some fields and an excerpt. Pretty cool, eh
* However, there are some other benefits. First of all, I use VS Code to work on any non-RMarkdown stuff for the site. VS Code for R is not great in my opinion, at least it doesn't compare to RStudio. But for JavaScript, it's fantastic.
* Secondly, since there is such a ginormous JS/web developer community, there are lots of little tools to help with developing sites. For example, I use Merge Schedule to automatically merge Pull Requests into the master branch of my site (although not particularly a JS-specific tool). This allows me to schedule blog posts, as I simply create a branch, write whatever I'm going to post, and push to the branch on GitHub. Using schedule /<YEAR>-<MONTH>-<DAY> in the PR description schedules it for merging. I've only been using this for a short while, but it's working well. This helps me to blog when I'm feeling productive and not have to do it when I'm not, so I hope to have a more regular blog schedule now, in terms of when the post appear on the site. Another one is Dependabot, which updates my JS packages for me. (While I'm here, using NPM has highlighted the amazingness of CRAN -- often I've been left with something breaking because of a package -- that doesn't happen often with R. Goooo CRAN! 🥳)
* Thirdly, I use MDX for a flavour of Markdown that allows you to embed React components in the Markdown. This is quite similar to how you can run R code in RMarkdown. Where this gets useful is when you create a D3 chart as a React component. It can then be used whenever you like in your MDX-Markdown posts, by importing it at the top of the post, under the YAML header. I've written about this before, it's a nice way to do such things.
* my workflow is quite simple:
  I open up a new RMarkdown document in RStudio;
  I write whatever I'm going to write;
  I use writeMDX to write the .Rmd file to .mdx format;
  I take the .mdx file and put it in the directory I'm using for blog posts and Gatsby renders it as part of the site.
* ## What's writeMDX? It's just a little helper I wrote to take RMarkdown and change it to MDX. If you have an RMarkdown document with the following YAML header:
  
  ## title: "MDXtest"
  author: "Robert McDonnell"
  date: "2/29/2020"
  output: html_document
  featuredImage: "image/png.png"
  
  ## writeMDX will change it to:
  
  ## title: "MDXtest
  date: "2020-02-29"
  featuredImage: "images/some_image.png"

* There are a couple of things that need to be done differently. For equations, RMarkdown has lovely simple syntax: simply put your equation between $ or $$ and RMarkdown takes care of it. With MDX, I do the following. First, import these components from react-katex:
  import { InlineMath, BlockMath } from "react-katex"
  InlineMath is like RMarkdown's $ and BlockMath is like $$. Then you just use it as you would use any other React component:
  <BlockMath math="y_{ij} = \beta_j\bf{x_i} - \alpha_j" />
  Which gives:
  y\_{ij} = \beta_j\bf{x_i} - \alpha_jyij​=βj​xi​−αj
* There are a couple of things that need to be done differently. For equations, RMarkdown has lovely simple syntax: simply put your equation between $ or $$ and RMarkdown takes care of it. With MDX, I do the following. First, import these components from react-katex:
  import { InlineMath, BlockMath } from "react-katex"
  InlineMath is like RMarkdown's $ and BlockMath is like $$. Then you just use it as you would use any other React component:
  <BlockMath math="y_{ij} = \beta_j\bf{x_i} - \alpha_j" />
  Which gives:
  y\_{ij} = \beta_j\bf{x_i} - \alpha_jyij​=βj​xi​−αj
* Like I mentioned above, you might need to change the paths to any images, depending on your setup. Images created from code chunks have a specific way of being in organised in RMarkdown. I source images in blog posts from a subfolder named, surprisingly, images/. So if I make something with ggplot2 in a code chunk, this will need to go into images/ so the .mdx will find it.
  So that's how you can use Gatsby for writing about R-related stuff if you're interested. I haven't written about the actual Gatsby/React/JS side of things and how it was for a data scientist to learn all that, but I might do that in the future.
