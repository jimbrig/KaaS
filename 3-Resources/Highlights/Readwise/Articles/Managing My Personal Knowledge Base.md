# Managing My Personal Knowledge Base

## Metadata

* Author: *Thomas Kainrad*
* Full Title: Managing My Personal Knowledge Base
* Category: #Type/Highlight/Article
* URL: https://tkainrad.dev/posts/managing-my-personal-knowledge-base/

## Highlights

* It is hard to imagine any other field where lifelong learning is more important than in software engineering. Another unique characteristic is the degree to which learning material is available for free on the internet. On top of that, we create various resources ourselves by documenting issues, submitting bug reports, writing notes, creating documentation, and many others. The sum of all these resources can be called a knowledge base. You could argue that every developer has a system to manage their personal knowledge base, whether they know it or not.
  * Tags: *favorite* 
  * Note: Add this to a post written on the importance of knowledge management in software development and programming.
* A good basis is to keep your personal knowledge base strictly technical and to never include data that is related to customers, or people in general.
* Writing a post about my Linux setup has been very rewarding for me. While documenting my configuration, especially my command-line workflows, I identified some shortcomings that I have since eliminated. After writing this article, I can already say that my knowledge management workflows have improved similarly.
* Much of this post comes down to describing my usage of software tools. The stars will be
  Notion
  GitLab
  Workona
  Dropbox
  Albert
  Copying all of my practices will likely not serve you well. I invite you to try out things at your own pace and revisit this post whenever you are looking for new ideas.
* Bookmarking
  Even though everybody loves books, or at least says so, myself included, the reality is that we rely on digital resources most of the time. The challenge is to organize this knowledge efficiently without creating too much overhead.
  * Tags: *favorite* 
* My current setup is a little more complex, but in the end, it does not require more work than keeping bookmarks solely in the browser. I organize my bookmarks in multiple layers, depending on how often I want to access them and how long they should persist.
  Maybe you are thinking of caching now, but fortunately, bookmarking layers are not caching levels. This would be hard to manage because as we all know, there are two hard problems in computer science: cache invalidation, naming things, and off-by-1 errors. In contrast to cache entries, a bookmark is not supposed to move between layers. Instead, it gets inserted at the right place and stays there.
  * Tags: *favorite* 
  * Note: Interesting.. three hard problems in computer science:
    1. Cache Invalidation
    1. Naming Things (and avoiding the temptation to rename without reason).
    1. Off-by-1-Errors (?) - not sure on this one will research.
* Chrome bookmarks are ideal for things that I need often and want to have accessible somewhat independent of context. They are, however, not well suited for keeping extensive bookmark libraries. There is no tagging, it is not possible to add comments, and browsers do not even save a timestamp for when a page was bookmarked. It is further not possible to filter and search Chrome bookmarks using complex queries. In my experience, browser bookmark libraries are hard to manage if they grow beyond a certain size.
  Some examples of well-suited Chrome bookmarks:
  AWS EC2 dashboard
  Google cloud platform console
  Slack workspaces
  GitLab boards
  Content sites, such as Hacker News, InfoQ, and DZone
  * Tags: *favorite* 
* Examples of things that should not be Chrome bookmarks:
  Blog posts to be read later
  Links to Open Source Projects
  Stack Overflow questions
  * Tags: *favorite* 
* Workona
  Workona is a relatively new addition to my toolbox. I have mixed feelings about it, mainly because it can feel a little slow at times. There are some things it does very well though.
* Workona further allows you to add apps and will then collect links and even features for those apps to be quickly accessible. For example, I use it to access my different GitLab and GitHub projects, Slack Workspaces, and sometimes even StackOverflow questions. These entries are automatically created by Workona and therefore I do not see them as bookmarks. It is also possible to access features of these apps directly from Workona, mainly to create new resources, such as GitLab/GitHub projects, Google Docs, DropBox Files and so on. It feels a little bit like Station built directly into the browser.
* Notion
  Finally, we arrive at the layer that is suited for maintaining a large library of bookmarks. For this, and many other use cases, I use Notion. It has become the core of my personal knowledge base.
* The killer feature for me is the database. It is amazingly flexible and is single-handedly able to replace multiple other tools for me. For my bookmark collection, I use a single large database. Adding new items can be done via the Notion Web Clipper. I am a little annoyed that the web clipper doesn’t let me add properties and tags directly, but other than that, it works well. Previously, I used Trello, which was also quite good at keeping bookmarks. However, to limit the number of different tools I use, I replaced it with Notion.
* Things get really exciting once you use relations between different Notion databases. As an example, I have a database of my blog posts that has a relation to my bookmarks. I can now filter my bookmarks by blog posts and quickly see which sources influenced a particular post.
* Native Bookmark Sources
  The last layer does not require any work at all. It only means to be aware of native bookmark sources when trying to find something, and also when thinking about adding new bookmarks. For example, it is quite easy to search through questions you have answered on Stack Overflow. It is also not a problem to go back to your Hacker News posts or search through projects you starred on GitHub. Keeping those things in your own bookmark sources adds redundancy and noise.
  These are some of my most commonly used native bookmark sources:
* Summary
  I am aware that this sounds immensely complicated. However, I stick to my statement that it does not actually require more work than keeping all bookmarks in the browser. You still have to add every bookmark only once. If you internalize your system, you will not have problems searching for bookmarks as it will be quite obvious where a specific resource could be. Admittedly, it does require some maintenance to keep a large bookmark collection in Notion, but it pays off soon and the pay-off accumulates over time.
* Organizing Self-Written Resources
  Having a proper system for external resources is great, but it does not help much if everything you write yourself is a mess. Therefore, it is essential to organize self-written resources.
* Keeping Track of Update Ideas
  You may have noticed that some of my blog posts are quite long. Keeping them up-to-date is a little challenging. Fortunately, I have Notion to assist me with this. I have a database where I add proposals for updating my existing posts. Using a relation, I link these ideas to the respective posts in my posts database:
* Tracking Sources
  To keep track of third-party resources that were helpful in creating a post, I add them to my bookmarks database and link them to my posts database.
  My bookmarks database filtered to show only entries related to this post.
* Taking Notes
  I suppose every software engineer takes notes to some extent, even if they do not have a system and just casually write stuff into text files. There is also a large amount of free and paid software for taking and organizing notes. Some people even like to use physical paper with the BuJo system.
  No matter which method you prefer, you have to think about when, why, and how to take notes.
* When to take Notes
  I thought quite a bit about this question, and previously I did not adhere to any predefined rules regarding this matter. To gain a better understanding of my habits and to decide what worked best in the past, I looked through my notes from the last years that were spread over multiple applications and lots of files. I tried to find common patterns:
* Capturing information from audio sources
  I am a visual learner and prefer written content over audio. However, there are many types of audio sources that everybody encounters:
  Meetings
  Presentations
  Meetups
  Conferences
  Informal Discussions
  Videos
  Podcasts
  Preserving information that is often needed but doesn’t fit in any proper documentation project
  In my case, these are things like the following:
  Command-lines with multiple parameters, complex options, and paths. I keep them in my notes so that I can quickly copy-paste them in the potentially distant future.
  Instructions for tasks that will likely have to be repeated in the future, for example
  setting up a development environment for a specific tech stack
  deploying a project on a specific hosting service.
  Questions
  Sometimes I think of a question that I would like to ask someone specific, who is not available at the moment. The question and its eventual answer are a nice use case for a note.
* On the other hand, it is important to make clear also what should not be a note in this system:
  Project-specific knowledge
  Everything that is directly related to a specific software project, should not be a note in your personal knowledge base. Instead, it should go into whichever system is used to keep track of issues, merge requests, documentation, and so on. This post includes a .
  Information that is needed for a very short time Sometimes I need to take notes during a conversation that I will need only immediately afterward. For this, I just open VSCode and type ahead. Once the information is no longer needed, the file can be deleted completely.
* Why Take Notes
  The obvious answer is to remember things. This does not mean that note-taking should replace your memory. To the contrary, taking notes provides structure and context and therefore helps your brain build up a map of your knowledge. I believe that taking notes increases the amount of data that you can recall from memory.
  Additionally, some things are just very hard to remember, such as complex tech stacks presented at meetups, command-lines with several opaque options, numbers, and so on. Writing these things down can extend your knowledge base significantly. Notes are also very helpful when writing documentation in the future, or for writing blog posts like this one ;-)
* How to Take Notes
  It can be tempting to just type ahead during a talk. Noting down whatever seems interesting at the moment. However, you should meet basic formal requirements and write down some context. Otherwise, you will have trouble extracting useful information from your notes in the future. If you take notes regularly, it is also important to organize them by assigning tags and properties, having a creation date, being able to filter and search through them, and so on. Software can help with these things.
* I strongly recommend organizing all your notes in a single database with appropriate tags, such as meeting, presentation, tc, and question. Similar to the bookmarks database described above, Notion will automatically provide a column with the creation time of the note. If you have frequent meetings with the same people, you can think about adding a Participants column.
* Project-specific Knowledge
  In my experience, it is best to keep project information as closely together as possible. For me, this means that issue tracking, merge requests (i.e. pull requests), documentation and everything else that comes with a software project should live alongside the source code.
* Managing Files
  This one is relatively straightforward. I think the most important thing is to use some form of cloud storage. Personally, I use Dropbox.
  Next, you should think about a proper folder structure. Finally, you should be able to search for your files quickly.
* If you can tick the three boxes
  availability on all devices
  structure
  searchable
  you should be all set.
  * Note: WOW - needed this direction.
* Code Snippets
  Currently, I have two ways of collecting code snippets. I hope I can eventually integrate them somehow.
  VSCode User Snippets
  The first one are VSCode User Snippets. VSCode does many things right and snippet management is one of them. It is very easy to define new snippets and use them by typing a predefined string. Simply press Ctrl-Shift-p and choose Preferences: Configure User Snippets. Then, you can split your snippets into multiple files or just put all of them together in the global-snipptes.code-snippets file. These are some of my snippets for writing blog posts with markdown and Hugo:
* Code Snippets
  Currently, I have two ways of collecting code snippets. I hope I can eventually integrate them somehow.
  VSCode User Snippets
  The first one are VSCode User Snippets. VSCode does many things right and snippet management is one of them. It is very easy to define new snippets and use them by typing a predefined string. Simply press Ctrl-Shift-p and choose Preferences: Configure User Snippets. Then, you can split your snippets into multiple files or just put all of them together in the global-snipptes.code-snippets file. These are some of my snippets for writing blog posts with markdown and Hugo:
* Code Snippets
  Currently, I have two ways of collecting code snippets. I hope I can eventually integrate them somehow.
  VSCode User Snippets
* Notion Snippet database
  The second use case concerns small pieces of code that I have written myself and that I would like to remember. This is not necessarily for productivity reasons, but rather for nostalgia. It is ideal for small algorithms, for example when you manage to substantially increase the performance of something by applying some clever technique.
  I keep those snippets in a Notion database, which works great because I can tag them and add arbitrary properties. A nice benefit of this habit is that it’s not a problem if you don’t do it for a while. Your database will not look messy all of a sudden.
* Shortcut Database
  I believe that typing proficiency is important for a software engineer. It is easier to stay in flow if you can type fast and navigate around your IDE and tools with shortcuts. As my set of tools grew, I realized that I have a hard time to keep track of which shortcuts I am using, which of them work in which application, and whether I can change them so that they work across as many tools as possible.
  Therefore, I started to keep track of some shortcuts I would like to use everywhere. These are things like creating new tabs, creating new windows, opening the respective tool’s search feature and more.
  This database helps me identify overlaps and motivates me to think about which task could fit for a specific key-combination that I use often. For example, I use Ctrl - Shift - T in IDEs to search for type definitions and Ctrl - Shift - R to search for resources in general. Since I have these key combinations memorized for years and can use it very quickly, I want to make use of it wherever possible. Therefore, I try to set up my applications so that some kind of search opens whenever I use one of these combinations. My Notion database makes it easy to see which applications offer search features and which of them I can modify.
  For example, my Browser now forwards Ctrl - Shift - T / R to Workona and allows me to switch/search workspaces or use the general search, respectively.
* This post gave me the idea for https://keycombiner.com.
  It is a web application to track the keyboard shortcuts you use, get better at using them, and to learn new ones. It is in open beta and I would love to hear your feedback!
* Tools Database
  I also have a Notion database to keep track of small web tools that I use. This serves little purpose for things that are used frequently as you will remember them anyway. However, for minor things that are only needed once in a while, such as color palette generators, detecting handwriting as LaTeX symbols, and checking SSL certificates this is quite handy. Usually, you can find these tools via google, but sometimes there are many tools for a task and it is nice to keep track of the ones that work best.
  Screenshot of my software tools database in Notion.
  Again, the important thing here is to not overdo it. There are extensive publicly available lists of such tools. Your list should not be a copy of those but rather a small collection of the things you like and need from time to time.
* Collecting Ideas for new Projects
  Like many software engineers in these golden times, I sometimes think about starting new software projects, maybe even bootstrapping a small business.
  You probably guessed it already, I keep ideas for possible projects in a Notion database. The main benefit is, once again, that it allows me to easily link it with other databases, such as my bookmarks.
* Conclusion
  Similar posts often conclude with warnings that you should be very careful not to spend too much time on organizing and maintaining your knowledge and workflows. In principle, I agree with this sentiment. After all, you want to increase your productivity.
  I do believe, however, that it is worth it to spend some time thinking about your knowledge management system. The most important part about conceptualizing a system is to decide exactly which types of information you want to maintain in your knowledge base. If you get this right you will benefit for the rest of your career. Even if the tools might change in the future, the system will stay.
  Please don’t hesitate to share your own experiences in the comments below. I am sure that my workflows are not perfect, but they might get closer with your tips.
  This post is released together with a new post in my Reading List series, which lists related resources. If you want to dive even deeper into knowledge management concepts, you might want to have a look.
