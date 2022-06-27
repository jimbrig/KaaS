---
Date: 2022-06-25
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: instapaper
Link: https://mishacreatrix.com/obsidian-setup-sep-2021
Tags: ["#Type/Highlight/Article"]
Aliases: ["A Walkthrough of My Obsidian Setup", "A Walkthrough of My Obsidian Setup"]
---
# A Walkthrough of My Obsidian Setup

## Metadata
- Author: [[mishacreatrix.com]]
- Full Title: A Walkthrough of My Obsidian Setup
- Category: #Type/Highlight/Article
- Document Tags: [[Liked]] 
- URL: https://mishacreatrix.com/obsidian-setup-sep-2021

## Highlights
- How I Have Setup My Obsidian Vault ([View Highlight](https://instapaper.com/read/1477574049/18704443))
- My primary Obsidian vault sits inside of Google Drive. This allows me to view my notes from anywhere. ([View Highlight](https://instapaper.com/read/1477574049/18704445))
- I keep my Knowledge Vault which I use personally and a Work Vault which I use for work-related material. ([View Highlight](https://instapaper.com/read/1477574049/18704448))
- How I Backup My Obsidian Vault
  As mentioned I have my Vault stored on Google Drive.
  I also sync my vault to a private GitHub repo manually. ([View Highlight](https://instapaper.com/read/1477574049/18704450))
- What Plugins I Use ([View Highlight](https://instapaper.com/read/1477574049/18704451))
- Advanced Tables - Really useful for managing tables. Github URL
  Better Word Count - Shows word count and character count of notes. Github URL
  Cycle Through Panes - Allows you to cycle through panes like browser tabs with CTRL + Tab. Github URL
  Dataview - Is a big part of my current setup, it allows me to add metadata to my notes and query based on that metadata to retrieve relevant notes. Github URL
  Day Planner - I don’t use this much any more as I don’t really plan out my days other than the main 4 or 5 things I plan to do that day. Github URL
  Kanban - I’m just messing around with this plugin at the moment but it works very well so far. Github URL
  Reading Time - Adds estimated reading time to notes. Don’t have too much of a use for this but sometimes it’s nice to know the length of some notes. Github URL ([View Highlight](https://instapaper.com/read/1477574049/18704453))
- Directories ([View Highlight](https://instapaper.com/read/1477574049/18704454))
- Here is my current directory setup:
  00-inbox
  01-life-os
  02-literature
  03-evergreen
  04-resources
  05-content-creation
  06-topics
  07-people
  08-sources
  99-attachments
  99-daily-notes
  99-templates ([View Highlight](https://instapaper.com/read/1477574049/18704456))
- The perfect system doesn’t exist ([View Highlight](https://instapaper.com/read/1477574049/18704459))
- 00-inbox ([View Highlight](https://instapaper.com/read/1477574049/18704466))
- The inbox directory is where all the random uncategorized, unfinished notes live.
  This can include:
  drafts for articles I’m writing (like this one)
  ideas for future articles
  concepts I’d like to learn more about
  whatever random stuff crosses my path throughout the day ([View Highlight](https://instapaper.com/read/1477574049/18704469))
- If you’re familiar with the GTD methodology you’ll recognize this as one of my content inboxes. I use it along with my Bullet Journal and Todoist to capture any stray thoughts or ideas that come into my head ([View Highlight](https://instapaper.com/read/1477574049/18704478))
- I try to review this directory once a week (during my weekly review) to clear it out and move notes to the right location. ([View Highlight](https://instapaper.com/read/1477574049/18704482))
- Sometimes I’ll add a tag #inbox or #towrite to these notes to further categorize them but I’m not sold on the value of this so I don’t always do it. ([View Highlight](https://instapaper.com/read/1477574049/18704484))
    - Note: Is tagging helpful? Probably so
- 01-life-os ([View Highlight](https://instapaper.com/read/1477574049/18704486))
- The Life OS directory is where I keep notes relating to ‘big picture’ items like goals, projects, and weekly reviews. ([View Highlight](https://instapaper.com/read/1477574049/18704488))
- This is where a lot of templates and other fun tricks start to come into play.
  This directory contains the following sub-directories:
  01-years
  02-quarters
  03-goals
  04-projects
  05-weeks ([View Highlight](https://instapaper.com/read/1477574049/18704491))
- 01-years ([View Highlight](https://instapaper.com/read/1477574049/18704493))
- The Years directory contains a note for each year. There’s not a lot in here yet but as I continue with this process I’ll have a lot to show for it over the next number of years. ([View Highlight](https://instapaper.com/read/1477574049/18704496))
- Naming Format
  The naming format for year notes is: Y-2021. Y denotes this is a year note and then the year shows me which year it belongs to. ([View Highlight](https://instapaper.com/read/1477574049/18704517))
- Years Index
  The first note in this directory is years-index which is an index of all my year notes.
  This is generated using the Dataview plugin which queries the metadata/frontmatter of each note like querying a database. ([View Highlight](https://instapaper.com/read/1477574049/18704566))
- years-index Dataview Syntax:
  list
  from "01-life-os/01-years"
  where contains(file.name, "Y")
  sort file.name desc ([View Highlight](https://instapaper.com/read/1477574049/18704567))
- I also like to have a yearly theme so I put that right underneath the title.
  # {{title}}
  Theme: 
  The next 3 sections are lists of my Quarter, Goal, and Project notes. These are all automatically pulled in using the Dataview plugin once again.
  Quarters:
  list
  from "01-life-os/02-quarters"
  where contains(file.name, "2021")
  sort file.name asc
  Goals:
  list
  from "01-life-os/03-goals"
  where theYear = 2021
  sort file.name asc
  Projects:
  list
  from "01-life-os/04-projects"
  where theYear = 2021
  sort file.name asc ([View Highlight](https://instapaper.com/read/1477574049/18704568))
- ## Year End Review
  ### Review Of The Past Year
  - How did my yearly theme help me this year?
  - What went really well this year?
  - What surprised me?
  - What am I most proud of accomplishing?
  - What challenged me?
  - What am I most grateful for?
  - What have I learned this year?
  - My top 5 favorite things from this year
  - Describe this year in 3 words ([View Highlight](https://instapaper.com/read/1477574049/18704569))
- ### Looking Ahead To Next Year
  - What is my yearly theme and why?
  - What am I most looking forward to next year?
  - What am I feeling apprehensive about?
  - What do I want to do differently?
  - What area of y life to I most want to develop?
  - What do I want to accomplish next year?
  - What challenges am I likely to face? ([View Highlight](https://instapaper.com/read/1477574049/18704570))
- ### Taking Action
  - I will make more time for:
  - I will learn about:
  - I will say NO to:
  - I will say YES to: ([View Highlight](https://instapaper.com/read/1477574049/18704571))
- The Quarters directory contains a note for each quarter.
  I try to follow The 12 Week Year process as I have found it helps to keep me on track towards my goals and projects. ([View Highlight](https://instapaper.com/read/1477574049/18704572))
- I use icons at the start of the note to denote the goal’s status:
  ⚪ - To Do
  🟠 - In Progress
  🟢 - Complete
  🔴 - Failed ([View Highlight](https://instapaper.com/read/1477574049/18704573))
- I definitely try to learn from my failures and this is a big part of that process. ([View Highlight](https://instapaper.com/read/1477574049/18704574))
- The Projects directory contains a note for each project I want to work on. ([View Highlight](https://instapaper.com/read/1477574049/18704575))
- I use icons at the start of the note to denote the project’s status:
  ⚪ - To Do
  🟠 - In Progress
  🟢 - Complete
  🔴 - Failed ([View Highlight](https://instapaper.com/read/1477574049/18704576))
    - Note: Kanban plugin instead
- Project Ideas Kanban Board
  I have recently been playing around with the Kanban Board plugin and have found it to be extremely useful.
  So much so that I created a Project Ideas kanban board note. ([View Highlight](https://instapaper.com/read/1477574049/18704577))
- Any time I think of a potential new project idea, it gets a note on the Kanban board. I currently have each note grouped based on the type of project.
  For example:
  Websites - ideas for websites to build
  Notion Files - ideas for Notion files + templates
  Figma Files - ideas for Figma files + templates
  eBooks, PDFs, Guides
  Needs more research - not yet sure what the implementation will look like so needs more thought. ([View Highlight](https://instapaper.com/read/1477574049/18704578))
- The Weeks directory contains a note for each weekly review I do.
  I do my weekly review on Friday afternoons but quite honestly I’ve missed the last couple. ([View Highlight](https://instapaper.com/read/1477574049/18704579))
- ## Get Started
  - Clear Desk space
  - Zero Inboxes
  - Review last week's entry
  - Review daily reflections
  ## Reflections
  ### What Went Well This Week?
  ### What Should I Start Doing?
  ### What Should I Stop Doing?
  ### What Should I Continue Doing?
  ## Work Log ([View Highlight](https://instapaper.com/read/1477574049/18704580))
- ## Planning
  - Review next week's time blocks
  - Add & schedule tasks for the next week
  ## Shut Down
  "I am finished work for today" ([View Highlight](https://instapaper.com/read/1477574049/18704581))
- The Literature directory contains notes for all the content I consume and learn from. This includes articles, books, videos, courses, and even social media posts. ([View Highlight](https://instapaper.com/read/1477574049/18704582))
- I start each note with the content type:
  {a} - article
  {b} - book
  {v} - video
  Then I simply include the name of the book, article, or video. ([View Highlight](https://instapaper.com/read/1477574049/18704583))
- The labels I use depend on the type of content:
  #literature/article - article
  #literature/book - book
  #literature/video - video ([View Highlight](https://instapaper.com/read/1477574049/18704584))
- Article Template
  This is for notes based on the articles I read.
  I clip articles from the web into a Notion DB. You can check out my Notion Library Tour to see how I capture this content.
  Once I’ve read an article and taken rough notes, I create an Article note in Obsidian and refine my notes. ([View Highlight](https://instapaper.com/read/1477574049/18704585))
- # {{title}}
  URL:[Article Link]()
  URL:[Notion Link]()
  Source:
  Tags: #literature/article
  Topics: ([View Highlight](https://instapaper.com/read/1477574049/18704586))
- Video Template
  This is for notes based on videos I watch.
  # {{title}}
  URL:[Video Link]()
  URL:[Notion Link]()
  Channel:
  Tags: #literature/video
  Topics: ([View Highlight](https://instapaper.com/read/1477574049/18704587))
- 03-evergreen
  The Evergreen directory contains all my evergreen notes.
  There are lots of definitions of evergreen notes but for me, these are atomic ideas or concepts that I find useful, I learn something from, and are interesting to me. ([View Highlight](https://instapaper.com/read/1477574049/18704588))
- 04-resources
  The Resources directory is where I store other useful things like code snippets, various lists, and guides.
  This directory contains the following sub-directories:
  01-code-snippets
  02-guides
  03-lists ([View Highlight](https://instapaper.com/read/1477574049/18704589))
- 01-code-snippets
  If I come across useful code snippets I make sure to put them in this directory for later use.
  This includes things I want to try for myself or code snippets that might be useful for work to achieve a specific effect. ([View Highlight](https://instapaper.com/read/1477574049/18704590))
- 02-guides
  In this directory I store any useful guides, walkthroughs or step by step processes I use on a regular basis.
  For example, I have a note on Jekyll which is simply a collection of things I learn about that platform.
  I also have a fun note on how to solve a Rubiks cube from the time I challenged myself to learn how to solve one ([View Highlight](https://instapaper.com/read/1477574049/18704591))
- 03-lists
  As you might have guessed, this directory holds a lot of lists. Nothing too exciting here but very helpful nonetheless.
  Some examples include:
  gift ideas for family and friends
  bookmarks
  mechanical keyboard resources (yup, I’ve gone down that rabbit hole..)
  digital product inspiration ([View Highlight](https://instapaper.com/read/1477574049/18704592))
- 05-content-creation
  The Content Creation directory is where I store everything related to the content I create. This includes articles, social media posts, my newsletter, and the design tips I share. ([View Highlight](https://instapaper.com/read/1477574049/18704593))
- 06-topics
  This directory contains the notes that serve as my Topic anchors.
  These notes are typically blank but serve as a useful way to navigate notes based on topic. ([View Highlight](https://instapaper.com/read/1477574049/18704594))
- Some examples include:
  Agile Development
  Color Theory
  Cognitive Bias
  Design Patterns. ([View Highlight](https://instapaper.com/read/1477574049/18704595))
- 07-people
  This directory contains notes for people, as weird as that sounds.
  Anytime I reference a person in one of my notes I make sure they have their own People note.
  By doing this I can easily see other notes related to that person. This can be useful when you’re looking for a particular quote or piece of insight from a specific person.
  Similar to the Topics section, I don’t have a lot of content in these notes, they are an anchor for all the other notes they’re linked to. ([View Highlight](https://instapaper.com/read/1477574049/18704596))
- People notes are formatted like this @Ali Abdaal. The @ denotes a person. This makes them easy to spot in a note or on a search results page. ([View Highlight](https://instapaper.com/read/1477574049/18704597))
- 08-sources
  The Sources directory contains notes for ‘sources’ i.e. Blogs, Websites, Podcasts.
  Again, these notes serve as an anchor for all of the other notes they are linked to. ([View Highlight](https://instapaper.com/read/1477574049/18704598))
