# Ways of working
- Always use `manage_todo_list` to outline the actions you need to take befora taking them.
- Always validate a github workflow yml after editing it.
- When loading skill files referenced by other skills, use read_file with the absolute path from the skill listing — do not use file_search.
- Always use `mise` and the `.tool-versions` file to manage runtime versions and cli tools. Don't use `mise.toml` or `brew`.
- Always use the `create_file` tool to create scripts
- IMPORTANT: never run scripts inline or use heredocs (e.g. `python3 -c "..."`, `node -e "..."`). Inline scripts and heredocs tend to overflow the command tool, fail to run and leave the terminal in an inconsistent state.
- Never use `/tmp/` prefer placing temporary files in the root of the workspace.
- Avoid `python3 -m json.tool`, use `jq` instead
- Never use `git add -A`, this always leads to commiting more files than you expect
- When asked to open a PR:
  1. Open it as a draft and write a body with 3 sections as per the template below. Write only a single sentence in the first section.
  2. Add an appropriate label to the PR out of the set (
    `fix`, `feature`, `maintenance`, `dependencies`) using `gh pr edit <number> --add-label "<label>"`
  3. After the PR is created with the label, ask the user if they want you to check if the PR passed CI. If so, use `gh pr checks` to verify and fix any build problems.

<PR body template>
## What does this change?

[Single sentence describing the change]

## How has this change been tested?

[Leave empty - to be filled in my user]

## Have we considered potential risks?

[Leave empty - to be filled in my user]
</PR body template>
