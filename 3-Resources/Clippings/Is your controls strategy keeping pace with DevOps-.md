---
Date: 2022-03-24
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Clipping"]
Alias: "Is your controls strategy keeping pace with DevOps?"
---

# Is your controls strategy keeping pace with DevOps?

*Source: [Is your controls strategy keeping pace with DevOps?](https://www.pwc.com/us/en/tech-effect/cybersecurity/how-devops-impacts-your-business.html)*

## Summary

-   DevOps increases the speed of technology delivery by helping to automate and optimize the way teams work together to build and deploy software projects.
-   But without adequate hardening and controls, DevOps can also introduce new cybersecurity and privacy risks and create other problems that could lead to lost revenue, customer downtime or regulatory penalties.
-   Focusing on controls and compliance doesn’t mean sacrificing DevOps speed, if you adjust your controls strategy and environment.

DevOps is booming. Technology leaders are embracing the approach that combines development and operations teams, automating many of their tasks to help them work faster, more creatively and underscoring their commitment to quality software engineering.

Meanwhile, risk managers, compliance officers, auditors and regulators want to know how, in this fast new world, DevOps teams govern and apply controls to manage privacy and security risks. Without adequate hardening and controls, DevOps can bring disruption and negatively impact the business, such as downtime or accidental changes to pricing data resulting in revenue loss. Another risk? It might cause challenges in maintaining an audit trail over all changes, which could jeopardize audit opinions and bring regulatory penalties.

That’s why it’s so crucial for developers and controls teams to be allies. Fast development and strong controls can go hand-in-hand. Leading companies design and administer controls that operate not at the sluggish pace often associated with oversight, but at the quick and agile speed of DevOps. In these organizations, everyone wins.

## Summary

-   DevOps increases the speed of technology delivery by helping to automate and optimize the way teams work together to build and deploy software projects.
-   But without adequate hardening and controls, DevOps can also introduce new cybersecurity and privacy risks and create other problems that could lead to lost revenue, customer downtime or regulatory penalties.
-   Focusing on controls and compliance doesn’t mean sacrificing DevOps speed, if you adjust your controls strategy and environment.

DevOps is booming. Technology leaders are embracing the approach that combines development and operations teams, automating many of their tasks to help them work faster, more creatively and underscoring their commitment to quality software engineering.

Meanwhile, risk managers, compliance officers, auditors and regulators want to know how, in this fast new world, DevOps teams govern and apply controls to manage privacy and security risks. Without adequate hardening and controls, DevOps can bring disruption and negatively impact the business, such as downtime or accidental changes to pricing data resulting in revenue loss. Another risk? It might cause challenges in maintaining an audit trail over all changes, which could jeopardize audit opinions and bring regulatory penalties.

That’s why it’s so crucial for developers and controls teams to be allies. Fast development and strong controls can go hand-in-hand. Leading companies design and administer controls that operate not at the sluggish pace often associated with oversight, but at the quick and agile speed of DevOps. In these organizations, everyone wins.

## Three signs that you need to update your controls strategy  

DevOps teams seek opportunities to eliminate slow processes. When you see any of these shifts occurring, consider them warning signs to update your controls strategy and environment:

-   **Change approval.** Product teams want to eliminate the manual pre-deployment “change approval” gate (often executed through manual review and approval in a GRC tool, or a scheduled approval meeting). However, this approach would eliminate one of the most common key controls.
-   **Segregation of duties**. DevOps teams have assumed responsibility for both development and operations. But eliminating the segregation of duties could violate existing security and compliance mandates.
-   **Reliance on automated controls.** Teams increasingly or wholly rely on automated quality measures with rules enforced via workflows known as “pull requests,” automated testing and security scanning. But without careful design and hardening, these automated measures aren’t sufficient to fully replace controls based on judgment by professionals.

Every organization differs in its processes, risk appetite, and regulatory and control environments. But if your teams propose any of these changes, it’s time to examine your controls strategy. For speed and security at the same time, get your product, technology and controls teams to work together. But how?

## The answer: Move from controlling every change to controlling the pipeline

Change happens slowly at most organizations, in large part because it’s bogged down with rules like these:

-   Changes must be manually promoted between segregated environments (e.g., development, test, staging, production); each environment being managed by organizationally separated teams. These manual steps can take days and weeks to perform.
-   Requests for promotion between each environment requires a new form to be completed, with multiple approvals (including business functions) gathered by email.
-   No change can be applied to production until after a formal change approval.
-   Formal change approvals can only be granted after an authorized body verifies that all quality measures have been followed.

Getting all these approvals may involve creating documents — often, a separate one for each step — and many meetings. To hasten the process simply and securely, use automation.

#### Change management controls that move at the speed of your business

Traditional control environments used to be based on:

In your environment, we will help you consider the following:

Separate development, test, support, and release management teams established clear segregation of duties.

Automated DevOps pipelines (with no “hard stop” for manual change approval) require all controls to be automated — with no ability to circumvent controls via elevated access.

Manual release management and change approvals ensured a robust review of readiness, approvals, and test evidence before code was promoted to production.

Automated DevOps pipelines (with no “hard stop” for manual change approval) require all controls to be automated — with no ability to circumvent controls via elevated access.

Project and software development toolkits attracted low (or no) regulatory and audit scrutiny.

Each element in a CI/CD pipeline may now be an “in-scope system” requiring its own overlay of governance, security, controls, and change management.

Delineating a subset of systems as “in-scope” for heightened scrutiny (e.g., SOX) meant others could operate with lower scrutiny.

Microservices architectures mean that small changes can affect multiple systems — including some “in-scope”. You will need to carefully decide whether your strategy is to maintain a precise record of “in-scope” versus “out-of-scope”, or decide that all are “in-scope”.

Familiar (lengthy) documentation captured evidence of business, functional, and technical requirements, as well as testing and approvals.

Agile and DevOps-native sources of evidence should be agreed, codified, and made known to teams so the right information is retained and available for audit.

Automating change management lets you shift your vision from the tactical, which focuses on individual approvals to the expansive, which considers and controls the entire change process so that you know it’s always working as it should. To ensure that you’re compliant and reduce your risks, however, you’ll need to make sure that your automation technology as well as the rules, tools and data it uses are reliable. Then, you can proceed with confidence that your results will be reliable, too, and always compliant. In short: you need to shift to continuous compliance.

## The roadmap: 4 ways to get there

#### Catalog your DevOps environment.

First, make a list of all possible tools, process flows, and combinations. Next, document a baseline for each tool’s configuration, rulesets, administration processes, role-based access, etc.

#### Harden your pipeline.

Knowing that compliant changes can follow the pipeline (gathering necessary review, quality checks and approvals) isn’t enough: they have to follow it.

Here are steps you can take to ensure that your DevOps change-approval pipeline is iron-clad:

-   Establish a small number of accepted DevOps pipelines.
-   Restrict role-based access using least-privilege rules.
-   Enforce quality standards (e.g., peer review, code coverage, exit criteria).
-   Ensure those with an ability to check-in code do not have privileges to change the pipeline, logs or any aspect of the control environment.
-   Implement governance and change control measures over every tool, environment and interface along the pipeline.

#### Document and communicate your new DevOps risk and management processes.

-   Be transparent in possible flows and access vectors. It’s important to capture not only the “happy path”, but also how the exception paths are prevented, detected and mitigated.
-   Consider scoping strategies. (For example, are all applications, all microservices, all environments “in-scope” for heightened controls and audit attention?)

#### Implement continuous compliance

Implement a continuous compliance monitoring tool that provides real-time confirmation (and audit trails) that your pipeline is controlled and compliant.

***

## Appendix: Links

- [[JavaScript - Obsidian Web Clipper Bookmarklet|Obsidian Web Clipper Bookmarklet]]
- [[3-Resources/Clippings/_README|Clippings]]
