---
name: bootstrap
description: Sets up the project for AI agent development
disable-model-invocation: true
---

# Full Project Setup

This prompt orchestrates a complete project setup for AI agent development. It runs two steps in sequence:

## Overview

1. **Custom instructions** — Analyze the repository and create `${workspaceFolder}/.github/copilot-instructions.md` with build, test, and lint commands
2. **Environment** — Set up the development environment and validate all commands work

## Step 1: Write `${workspaceFolder}/.github/copilot-instructions.md` 

First, follow the instructions in `references/custom-instructions.md`:

- Identify the project type and build system
- Inspect CI configuration (`.github/workflows/`) to find exact commands
- Extract validation commands (build, test, lint, format) — NOT packaging or deployment
- Write `${workspaceFolder}/.github/copilot-instructions.md` 

**Success criteria**: `${workspaceFolder}/.github/copilot-instructions.md` exists with "Bash commands" and "Workflow" sections.

## Step 2: Environment Setup

Then, follow the instructions in `references/environment.md`:

- Determine required tool versions from CI (source of truth)
- Create or update `.tool-versions` for mise
- Fix any inconsistent version references (`.nvmrc`, README, etc.)
- Install tools with `mise install`
- Run each command from `${workspaceFolder}/.github/copilot-instructions.md` and fix any failures
- Ensure all commands pass

**Success criteria**: All commands in `${workspaceFolder}/.github/copilot-instructions.md` execute successfully.

## Final Output

When complete, provide a summary:

1. **AGENTS.md created** — List the commands documented
2. **Tools installed** — List tool versions from `.tool-versions`
3. **Validation results** — Confirm all commands passed (or list what was fixed)

## Notes

- If `${workspaceFolder}/.github/copilot-instructions.md` already exists and looks correct, skip to Step 2
- If `.tool-versions` already exists and matches CI, skip tool installation
- Always run the validation commands even if everything looks set up — this confirms the environment works
