# Accelerate Pester Test Development • the Lonely Administrator

## Metadata

* Author: *Name*
* Full Title: Accelerate Pester Test Development • the Lonely Administrator
* Category: #Type/Highlight/Article
* URL: https://jdhitsolutions.com/blog/powershell/8754/accelerate-pester-test-development/

## Highlights

* I have a standard set of tests that I like to use for functions in my module. But copying and pasting code snippets is tedious. I know I could create a set of VS Code snippets, but that feels limiting and I’d have to make sure the snippets are available on all systems where I might be running VS Code. Instead, I wrote a PowerShell function to accelerate developing Pester 5.x tests. ([View Highlight](https://instapaper.com/read/1471322434/18360032))
* My function takes a module and extracts all of the public exported functions. For each function, it creates a set of standard Pester assertions. These are the baseline or boilerplate tests that I always want to run for each function. Each function is wrapped in a Describe block. Although, I can opt for a Context block instead. This command will also insert tags. Note that my code for the tag insertion relies on the ternary operator from PowerShell 7. ([View Highlight](https://instapaper.com/read/1471322434/18360033))
