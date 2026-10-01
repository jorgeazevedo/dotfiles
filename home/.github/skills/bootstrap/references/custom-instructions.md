---
agent: 'agent'
description: Analyze this repository and create a custom `copilot-instructions.md`. This file will help AI agents understand how to work with this codebase.
---

# Create `${workspaceFolder}/.github/copilot-instructions.md` 

## Analysis Steps

### 1. Identify the Project Type and Build System

Look for common project indicators:
- `package.json` → Node.js/JavaScript/TypeScript (npm, yarn, pnpm)
- `build.sbt` or `*.scala` → Scala (sbt)
- `pom.xml` → Java (Maven)
- `build.gradle` or `build.gradle.kts` → Java/Kotlin (Gradle)
- `Cargo.toml` → Rust (cargo)
- `go.mod` → Go
- `requirements.txt`, `pyproject.toml`, `setup.py` → Python (pip, poetry)
- `Gemfile` → Ruby (bundler)
- `Makefile` → Make-based build

### 2. Inspect CI Configuration

Check `${workspaceFolder}/.github/workflows/` for GitHub Actions workflow files. 
Parse these YAML files to understand the exact commands used in CI, such as:
- Build commands
- Test commands
- Lint commands

**Important**: CI scripts often include packaging, deployment, or artifact creation steps that are NOT needed for local development. You must:
- Read and analyze the contents of any CI scripts (e.g., `script/ci`, `Makefile` targets)
- Extract only the **validation commands** (compile, test, lint, format) and **ignore** steps like packaging, uploading artifacts, or deployment
- List the individual commands that developers should run locally

### 3. Check Package Manager Scripts

If applicable, inspect:
- `package.json` scripts section
- `Makefile` targets
- Build tool configuration files

**Important**: CDK projects often include a `build` script in `package.json`. This is there by mistake and you should always ignore it. What we care about in CDK is `synth`.

### 4. Look for Documentation

Check `README.md` or other docs for:
- Development setup instructions
- Build instructions
- Testing instructions

## Output Format

Create `${workspaceFolder}/.github/copilot-instructions.md` with this exact format:

```markdown
# Context

<Up to two sentences describing the purpose of this codebase and the tech stack used by the code.>

# Bash commands
- <command>: <description>
- <command>: <description>
...

# Workflow
- <workflow step>
- <workflow step>
...
```

### Bash Commands Section

List the essential commands for:
- **Build**: How to compile/build the project
- **Test**: How to run tests (include both full suite and single test if available)
- **Lint**: How to run linters (if available)
- **Typecheck**: How to run type checking (if available)
- **Format**: How to format code (if available)

Only include commands that actually exist in the project. Use the exact commands from CI or package scripts.

**Do NOT include**:
- CI wrapper scripts (like `./script/ci` or `make ci`) - instead, list the individual commands
- Packaging commands (creating .deb, .zip, .jar artifacts)
- Deployment or upload commands
- Docker image building (unless explicitly needed for testing)

### Workflow Section

Describe the recommended workflow for validating code changes:
- What checks to run after making changes
- Order of operations (e.g., format → lint → typecheck → test)
- Tips for efficiency (e.g., running single tests during development)
- Any pre-commit or pre-push requirements

## Important Notes

- Only include commands that are actually available in the project
- Use the exact command syntax from CI workflows or package scripts
- Keep descriptions concise and actionable
- Focus on what an AI agent needs to validate code changes
- Do not include environment setup or installation commands (assume the environment is ready)
