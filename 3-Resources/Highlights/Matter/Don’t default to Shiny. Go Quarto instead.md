## Metadata
* URL: [https://non-std-dev.netlify.app/posts/overengineering/](https://non-std-dev.netlify.app/posts/overengineering/)
* Author: [[Johnny Breen]]
* Publisher: [[non-std-dev.netlify.app]]
* Published Date: 2022-09-09

## Highlights
* What this meant is that I didn’t just write the validation scripts: I went all in. It was heavy on functional programming. I encapsulated everything (and I mean everything, no matter how small or insignificant) into modular components. I even added a full-blown logging system to this thing. And the brutal truth is… I had built an orbital laser to destroy an ant hill.
* What was so ironic about this whole experience is that it was precisely my manager who had taught me all of these concepts in the first place. Clearly, I had taken his advice a bit too literally. When he came to review my code, he had some unexpectedly stern words of advice for me: less is more. I had to get rid of most of what I had written. I remember him saying words to the effect of, “We aren’t trying to build a rocket to get us to Mars. We’re trying to build a bike to get us around London”.
* And.. to some extent I had done something wrong: I’d over complicated things. I had used esoteric programming paradigms where it wasn’t necessary; I had relied on third-party packages which my team would not have been familiar with; I had tried to encapsulate all components into modules which was complete overkill for a validation script (worse still, some of this encapsulation was just plain wrong: it’s bad practice to put complicated switch() statements into a singular function which makes different decisions based on the input argument i.e. what I had done!)
* Use Quarto or R Markdown I have found, in my personal experience, that a lot of Shiny apps could probably be written into a R Markdown (or Quarto nowadays) document.