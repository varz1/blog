---
title: "Making Claude Code your Internship"
date: 2025-09-24T17:55:31+08:00
categories: []
tags: [Coding]
aliases: [/posts/Claude_guide/]
description: ""
---

I was annoyed when the first time trying to use cursor to finish my job. There are some reasons:

1. It was a big project with a lot of abstracted method which AI might not that easy to understand
2. I am not a good trainer

Recently i start to try AI coding again, cause people around me keep talking about how AWESOME it is. So i dove deep into Claude Code's official doc, this time it really surprised me a lot. 

I'll skip getting start part and tell you the most useful part.


### AI is good at uncreative tasks and making wild guesses

Think it about finishing a restful API interface when you are an intern, you read code, copy code, rename variables and it works. If it does not work, you reach out your mentor, it works.

AI tends to making assumptions rather than asking for clarification which is why i failed first time.

So i did this this time when using Claude Code:

I build different prompt for different tasks, trying to figure out how i think when first time finishing it. And this is the prompt. This time AI works excellent. It changes how i work with this kind of repetitive tasks. I got benefit a lot from it and save times for more important jobs.

### some useful tricks of Claude Code

1. [custom commands](https://docs.claude.com/en/docs/claude-code/slash-commands#custom-slash-commands)

I build different prompt for different tasks by custom commands. For example:

for implementing a feature:

```markdown
your principle
1. reading docs before thinking
2. thinking before acting
2. ask me if there is anything unclear or you don't understand

when finish backend restful API
1. understand how best practice works: {location of code}
2. using existing code style

when finish frontend page:
1. xxx
2. xxx

relevant links:
Vue3 doc: https://xxx
LayUi doc: https://xxx
```

2. [/init -- a memory tool](https://docs.claude.com/en/docs/claude-code/memory#claude-md-imports)

Letting AI running it to summarize your project. This helps a lot making AI remembering what have learned. Update it regularly.

