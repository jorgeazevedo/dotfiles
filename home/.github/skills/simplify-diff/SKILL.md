---
name: simplify-diff
description: Reduce the number of lines changed in the current branch
disable-model-invocation: true
---
Run `git diff main --stat` and `git diff main` to understand the full scope of changes in this branch. Ignore any auto-generated files and include uncommitted changes in your analysis.

Your goal is to **minimise the diff** while preserving the intended behaviour.

For every changed line, ask: "Is this change semantically necessary for the feature/fix?" If not, make that line identical to main. This includes unnecessary renames, reformatting, line rewrapping, import reordering, and unrelated refactors. When a necessary change sits inside a block that was also reformatted, preserve the original formatting and only change what is semantically required.

Apply the fixes to the working tree, then run `git diff main --stat` to confirm the diff shrank.