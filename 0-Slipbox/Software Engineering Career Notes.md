# Software Engineering Career Notes

## Software Engineering Culture

*Source: [Software Roles and Titles | Eric Elliott | Medium](https://medium.com/javascript-scene/software-roles-and-titles-e3f0b69c410c#:~:text=1%20Engineering%20Fellow%202%20CEO%203%20CTO%204,14%20Junior%20Software%20Developer%2015%20Intern%20Software%20Developer)*

1. **Skills** over *titles*
1. **Continuous Delivery** over *deadlines*
1. **Support** over *blame*
1. **Collaboration** over *competition*

## Roles in Software Development

* Engineering Fellow
* CEO
* CTO
* CIO/Chief Digital Officer/Chief Innovation Officer
* VP of Engineering/Director of Engineering
* Chief Architect
* Software Architect
* Engineering Project Manager/Engineering Manager
* Technical Lead/Engineering Lead/Team Lead
* Principal Software Engineer
* Senior Software Engineer/Senior Software Developer
* Software Engineer
* Software Developer
* Junior Software Developer
* Intern Software Developer

As well as,

* VP of Product Management/Head of Product
* Product Manager
* VP of Marketing

### Chief Architect

At small organizations, the chief architect could be a technical co-founder with the self-awareness to realize that they won’t want the responsibilities of a CTO as the company grows. Maybe they don’t like to travel, or are simply more interested in software design than conference talks, business development, and sales calls that infiltrate the lives of many CTOs. The chief architect may be responsible for selecting technology stacks, designing collaborations and interfaces between computing systems, assessing compute services offerings (AWS, Azure, ZEIT Now, etc.), and so on. A chief architect may evaluate a wide range of industry offerings and make pre-approved or favored recommendations to work with particular vendors.

As the company matures, the chief architect may also need to work closely with the CTO, and sometimes partner organizations to develop integrations between services. At many companies, the CTO also serves as the chief architect.

### Software Architect

A software architect serves many of the purposes of a chief architect, but is generally responsible for smaller cross-sections of functionality. Architects will often work with the chief architect to implement their slice of the larger architectural vision. Software architects often make tech stack choices for particular applications or features, rather than company-wide decisions.

### Engineering Project Manager/Engineering Manager/Project Manager

An Engineering Project Manager (also called “Engineering Manager” or simply “Project Manager”) is in charge of managing the workflow of an engineering team. Some larger companies have both Engineering Managers and Project Managers. In that case, the Engineering Manager typically acts like the VP of Engineering at the local team scope, while the Project Manager takes on the responsibilities described here.

Project Managers typically interface with both product leaders and an engineering leader such as VP of Engineering, CTO, or a middle manager to cultivate and prune the work backlogs, track the progress of work tickets, detailed progress reports (milestone burn down charts, completed vs open tickets, month/month progress reports, etc.) You can think of them as the analog of a shop manager for a manufacturing assembly line. They watch the work floor and make sure that the assembly line runs smoothly, and work product isn’t piling up on the floor in front of a bottleneck.

The best Project Managers also spend a lot of time classifying issues and bugs in order to analyze metrics like bug density per feature point, what caused the most bugs (design error, spec error, logic error, syntax error, type error, etc.) and so on. Those kinds of metrics can be used to measure the effectiveness of various initiatives, and point out where improvements can be made to the engineering process.

Engineering Managers tend to develop a good understanding of the strengths of various team members, and get good at assigning work tickets to the appropriate responsible parties, although, this should be a collaborative effort, seeking feedback from individual developers on what their career goals are and what they want to focus on, within the bounds of the project scope available.

If there is time pressure or work backlogs piling up, the Project Manager should collaborate with the engineering and product leaders to figure out the root cause and correct the dysfunction as soon as possible.

Wherever possible, the Project Managers should be the only ones directly delegating tasks to individual engineers in order to avoid the multiple bosses problem. Engineers should have a clear idea of who they report directly to, and who’s in charge of delegating to them. If you’re a different kind of engineering leader, and you’re guilty of delegating directly to engineers, it’s probably a good idea to coordinate with the Engineering Manager in charge of the report you’re delegating to and delegate through them so that the work receives correct, coordinated prioritization, and the Engineering Manager is aware of what each engineer is actively working on at any given moment.

At very small organizations, the Engineering Manager is often also the CTO and VP of Engineering (with or without the corresponding titles). If that’s you, don’t worry about the previous paragraph.

A common dysfunction is that the Engineering Manager can begin to think that because product hands off work for engineering to implement, and Engineering Managers work closely with product teams, that the Engineering Manager reports to a Product Manager. In every case I’ve seen that happen, it was a mistake. See “Avoiding Dysfunctions…” below.

### Tech Lead/Team Lead

The Tech Lead or Team Lead is usually the leader of a small number of developers. They are usually senior engineers who act like mentors, examples, and guides for the rest of the team. Usually, engineers report to the project manager or engineering manager, but a tech lead may be responsible for the team’s code quality measures, such as ensuring that adequate code reviews are being conducted, and that the team’s technical standards (such as TDD) are being upheld.

## Engineer Career Progressions

Generally, engineers can take one of two career paths: move into management, or keep coding. Management positions aren’t for everyone. Lots of engineers prefer to stay on the technical path. That progression can take many directions, twists, and turns, but could look something like this:

Intern -> Junior Software Developer -> Software Developer/Engineer -> Senior Software Engineer -> Principal Software Engineer -> Software Architect -> Senior Software Architect -> Chief Architect -> CTO -> Engineering Fellow

Alternatively, for those engineers interested in a people leadership role, a progression might look something like this:

Intern -> Junior Software Developer -> Software Developer/Engineer -> Team Lead/Tech Lead -> Engineering Manager/Project Manager -> Senior Engineering Manager -> Director of Engineering -> VP of Engineering

### Avoiding Dysfunctions in Engineering Leadership

IMO, VP of Engineering, CTO, VP of Product, and VP of Marketing should all report directly to the CEO. Each of them needs to be in charge of their own process. External facing CTOs should not have direct reports (if they do, it usually means they are filling both the CTO and VP of Engineering Roles). Instead, the Engineering leaders report to the VP of Engineering. This is to avoid the two bosses dysfunction, but also because these roles are fundamentally different: one focused on the customer and how the organization fits into the wider world, and the other focused on internal, day-to-day operations. They’re two wildly different skill sets, with sometimes competing priorities.

I’ve seen a lot of dysfunction in engineering leadership because of confusion about which engineering leaders are responsible for what, and it tends to be a recipe for disaster. Whatever is right for your organization, make sure that responsibilities and chain of authority are clear, in order to avoid engineers feeling torn between two or three different “bosses”.

Likewise, in an organization of sufficient size, product and engineering need to be two separately led teams. What I mean by that is that the product managers should own the product roadmap. They should be evangelists for the users, and they should be really plugged into the users, often engaging with them 1:1 and learning about their workflows and pain-points in great depth. They should be experts on what the market needs, and they should be very familiar with the company’s strengths and capabilities to fill those needs.

That said, the VP of Engineering (or whomever is filling that role) needs to be in charge of *delivery, and production pace.* While the product managers should own the roadmap, the engineering managers need to be responsible for taking those roadmap priorities, matching them to the engineering capacity, and reporting on the timing. Product and marketing teams will have strong opinions about *when* something should ship, but only the engineering management has a good gauge of whether or not those delivery timelines are possible given the roadmap requirements. The engineering team needs the authority not simply to push back on timing, but in most cases, to completely own timing, working with the CEO, product, and marketing teams to figure out priorities, understand strategic needs of the company, and then help shape a development cadence that can meet those needs without imposing drop-dead deadlines that ultimately hurt the company’s ability to deliver quality products at a reliable pace.

The best performing teams I’ve ever been involved with subscribed to the no deadlines approach. We build great products without announcing them in advance, and then let the marketing teams promote work that is already done. Alternatively, when you’re working in the public view, transparency is a great solution. Instead of cramming to meet an arbitrary deadline, actively share your progress, with ticket burn-down charts, a clear view of remaining work, progress, pace, and remaining scope, and change over time that can indicate scope creep. When you share detailed information about the progress being made, and share the philosophy that we can’t promise a delivery date, but we can share everything we know about our progress with you, people can see for themselves the work and the pace.

Because of differing, often competing goals, product, marketing and engineering need to be separate roles reporting directly to the CEO where none of them can dictate to each other. If your team feels time pressure to work overtime, or crunch to get some key deliverable out before some drop-dead deadline, it points to a dysfunction here. Either the engineering managers are reporting to the wrong people, or the team lacks a strong engineering leader who understands the futility of software estimates and the need for a collaborative give-and-take between engineering and product in order to ensure the flexibility of shipping scaled-back MVPs to hit delivery targets.

Product should own the continuous discovery process. Engineering should own the continuous delivery process. Marketing should work hand-in-hand with the product team to ensure that product messaging to the wider world is on-point. The whole thing should fit together like a pipeline, creating a smoothly flowing, positive feedback cycle. Like an assembly line, the slowest bottleneck in the process must set the pace for the rest of the process, otherwise, it will lead to an ever-growing backlog that piles up so much that backlog items become obsolete, and backlog management becomes a full-time job.

Product teams who feel like engineering is not keeping pace should focus first on quality of engineering hand-off deliverables. Have we done adequate design review? Has an engineer had a chance to provide constructive feedback before handoff? [80% of software bugs are caused by specification or UX design errors](http://ttendency.cs.ucl.ac.uk/projects/type_study/documents/type_study.pdf), and many of those can be caught before work ever gets handed off to an engineering team. Once you have that process finely tuned, ask yourself if you’ve really explored the product design space thoroughly enough. Did you build one UX and call it done, or did you try multiple variations? Building and testing variations on user workflows is one of the most valuable contributions a product team can make. Do you have a group of trusted users or customers you can run A/B prototype tests with?

One of the biggest dysfunctions of software teams is that the product team is producing sub-par deliverables (sometimes little more than a few rushed, buggy mock-ups), and failing to run any of them by customers or engineers prior to handing them off. That dysfunction causes a pileup of re-work and engineering backlog that often gets blamed on engineering teams.

Make sure that the delegation of responsibilities makes sense, that you’re not putting undue time pressure on engineering, and that you have a great product team engaged in a collaborative product discovery process, working with real users to build the best product.

Engineering managers, I’m not letting you off the hook. If these dysfunctions exist on your team, it’s your responsibility to address them with product, marketing, and business leadership, and spearhead requirements for engineering hand-offs. It’s also your responsibility to protect the productive pace of your team, go to bat for additional resources if your team is being pressured to produce more than your current capacity can handle, to report clearly on the work pacing and backlog, and to demo completed work and ensure that your team is getting due credit for the fine work that is being done.

Don’t place blame, but do demonstrate that your team is doing their very best work.

---

## Appendix: Links

* [Development](../2-Areas/MOCs/Development.md)
* [Software Development](../2-Areas/MOCs/Software%20Development.md)
* [Agile Development](Agile%20Development.md)
* [RDatascience - Career Tips From an Old Timer](../3-Resources/Highlights/Readwise/Articles/RDatascience%20-%20Career%20Tips%20From%20an%20Old%20Timer.md)

*Backlinks:*

````dataview
list from [[Software Engineering Career Notes]] AND -"Changelog"
````
