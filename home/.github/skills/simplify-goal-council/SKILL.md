---
name: simplify-goal-council
description: Use subagents to propose a simpler way of achieving our goals
disable-model-invocation: true
---
Step back and think really hard:
- What is the goal of the change?

Spawn an Opus 4.8 subagent and a GPT-5.5 subagent with the following prompt:

```
The goal of this change is <goal as answered above>
Step back and think really hard:
- How can we make this simpler and dumber while still achieving our goals?
- How can we achieve our goals using a shorter diff that makes it easier to review and introduces less risk?
```