## Metadata
* URL: [https://mitcommlab.mit.edu/broad/commkit/file-structure/](https://mitcommlab.mit.edu/broad/commkit/file-structure/)
* Publisher: [[mitcommlab.mit.edu]]

## Highlights
* A successful file structure organizes your data and code with the goal of repeatability, making it easier for you and your collaborators to revisit, revise and develop your project. File structures are not fixed entities, but rather build a framework that communicates the function and purpose of elements within a project by separating concerns into a hierarchy of folders and using consistent, chronological, and descriptive names.
* Begin with something simple and clear to avoid bogging down at the start, and allow the structure to evolve as needed.
* Consistency matters. Like navigating around the house, it’s nice to know where everything is and that items are placed in a logical order (hopefully your kitchenware isn’t found in your bathroom). The same holds true for coding. Knowing where files are, when to use certain code for certain operations, and how to find associated results, data, and figures can not only streamline productivity, but also allow for consistency (even across multiple projects) and shareability.
* Where you place your files and how you organize your file structure can be seen as an overall map to your coding projects.
* If you’ve ever organized your desk to clean up both physical and mental space, then your coding projects deserve the same consideration.
* The time invested in learning how to organize your code now will help you streamline future projects and add consistency between projects.
* So whether you’re working on small or big projects, setting a standard structure will add consistency among all of your work and decrease the amount of time it takes to boilerplate your code.
* “A foolish consistency is the hobgoblin of little minds.” — Ralph Waldo Emerson (and PEP8 style guides)
* “Premature optimization is the root of all evil (or at least most of it) in programming.” — Donald Ervin Knuth
* Best practices for file structures
* Do not modify your raw data manually, or even better, at all.
* (Don’t give in to the temptation of opening a raw dataset in Excel and changing values.)
* Data manipulation should work like a conveyer belt: it stops at checkpoints.
* E.g., it gets modified/cleaned/analyzed, and then it moves on.
* Code of different quality (scratch work vs. compiled binaries) should be separated.
* Always have collaborators in mind, even if there is a 0% chance of getting collaborators.
* Work towards shareable code.
* Have public awareness.
* Use relative file paths, not absolute paths, to facilitate shareability.
* Consistency (within your project) is key.
* When writing code, it is a good design principle to separate program functionality into distinct sections, where each section addresses a separate concern (e.g. reformatting data to plot a figure).
* Data
* * Data will be acted upon differently at multiple points along your project’s conveyor belt.
* * Separate out its evolution: Small projects get separate files, large projects get separate folders.
* Raw data
* * Often bad names come from data you get from other sources – a collaborator, the Internet.
* Keep these names, but write a script to transform the files into cleaner intermediate files.
* That way, if you get more from the same source, or you share your analysis code with your collaborators, no one needs to manually repeat the work of transforming the data.
* Edited data
* * Filtered or edited data is where you store the intermediate steps as the data is manipulated from a copy of the raw state to its final state.
* * If an intermediate step branches out into several possible processing methods, you may want to use a sub-structure to distinguish how and what data is moving through each branch of the process.
* * You’ll thank yourself for keeping intermediate data organized if you or a collaborator ever decide to study another feature.
* Finalized data
* * The final data is what will be called by the main analysis program, and used to derive the conclusions you wish to learn about.
* As you develop your project, scratch work will sprout up alongside your lab notebook.
* Scratch work is anything you do to transform, manipulate, or inspect (plot, explore, analyze, etc.) the data as it moves from station to station along the conveyor belt.
* Always put everything into scripts to ensure repeatability, even though it may seem quick and easy to do with command line arguments in the moment.
* By source code, we mean the finalized working code that is used to derive the results.
* Whether these scripts are included in the src folder as final working code or distributed in other folders as scratch work is mostly a matter of personal preference, as long as it’s logical to find them later.
* Results: Keep them separate.
* Whatever format your results are (figures, a code/executable, data to be passed onto another project, even a paper draft), keeping them separate allows quick access when you need to evaluate your conclusions.
* Consider using Makefiles.
* Especially for larger projects, Makefiles will aid in tracking revisions in your code and data.
* A unique main folder for the project
* Some form of code
* Some form of data
* A readme document with any important information about the project for yourself or collaborators
* Start by sketching out a base structure.
* Ground zero: make a unique folder for the project.
* Determine the scale of the project.
* Somewhere between quick visualization and long-term collaborative project?
* This will give a hint at how complex the file structure should be.
* Identify the parameters distinguishing data.
* Someone looking at your files should be able to recognize those parameters when looking at both your file structure and filenames.
* Assess the easiest way to access the data.
* Often, this will be set by the most important distinguishing variable between data sets (e.g., chronological, machine/sensor type, experiment, human subject, learning model, etc.).
* Keep things simple and clear to start, so it’s easy to inspect and debug.
* Worry about cleverness and optimizing once you verify things are working.
* Best practices for naming conventions
* Keep names concise.
* There is only one way to format a date: YYYY_MM_DD (e.g.
* Your operating system will automatically sort this style chronologically.
* * Similarly, always pre-pad smaller numbers with zeros in a sequence (e.g. 01, 02,…,10 if instead of 1, 2, 3,…,10).
* As always, be consistent within your project.
* If your group already has an established style, start there, and tailor it to your needs.
* Ordering the ideas: Choosing descriptive vs. chronological depends on what’s most important.
* In general, put the most important thing first, whether in a folder hierarchy or an individual filename.