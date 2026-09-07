---
agent: 'agent'
description: 'Sets up the development environment'
---

# Environment Setup

Your task is to set up the development environment for this repository so that all build, test, and lint commands run successfully.

## Prerequisites

- `mise` CLI is installed and available
- `${workspaceFolder}/.github/copilot-instructions.md` exists (run the bootstrap prompt first if not)

## Step 1: Determine Required Tool Versions from CI

The **source of truth** for tool versions is the GitHub Actions CI configuration.

Check `.github/workflows/` for version specifications:

**Node.js**:
- Look for `actions/setup-node` and check `node-version` or `node-version-file`
- If it references `.nvmrc`, read that file for the version

**Java**:
- Look for `actions/setup-java` or similar (e.g., `guardian/setup-scala`)
- Check for `java-version` parameter
- Common values: `11`, `17`, `21`

**Other tools**:
- Python: `actions/setup-python`
- Go: `actions/setup-go`
- Ruby: `ruby/setup-ruby`

Record the exact versions used in CI.

## Step 2: Create or Update .tool-versions

Create a `.tool-versions` file in the repository root with the major versions used in CI.

Format:
```
java corretto-21
nodejs 20
```

Notes:
- IMPORTANT: Use major versions only
- For Java, prefer using the Amazon Correct JVM `corretto-`
- If CI uses a version file (like `.nvmrc`), read the version from there
- Check for version inconsistencies in `.nvmrc`, `README.md`, `package.json` engines field, etc.
- If any of these differ from CI, update them as well

If `.tool-versions` already exists:
- Compare it against CI configuration
- Update if versions don't match CI
- If it lists a specific minor version (e.g. `20.11.0`), update it to major version only (e.g. `20`)

## Step 3: Install Tools with mise

Run:
```bash
mise install
```

If installation fails (e.g., version not found):
- Check available versions: `mise ls-remote <tool>` 
- Use the closest available version
- Update `.tool-versions` accordingly

Verify installations:
```bash
mise current
```

Ensure the correct versions are active.

## Step 4: Validate All Commands Work

Read `${workspaceFolder}/.github/copilot-instructions.md` and execute each command in the "Bash commands" section.

For each command:
1. Run the command
2. If it **succeeds**, move to the next command
3. If it **fails**, diagnose and fix the issue:

### Common Fixes

**Missing dependencies**:
- Node.js: Run `npm ci` or `npm install`
- Scala/sbt: Dependencies install automatically on first compile
- Python: Run `pip install -r requirements.txt` or `poetry install`
- Go: Dependencies install automatically on first build/test

**Wrong directory**:
- Some commands need to run from a subdirectory (e.g., `cd cdk && npm ci`)

**Missing tools**:
- Check if a tool needs to be added to `.tool-versions`
- Run `mise install` again after updating

**Permission issues**:
- Scripts may need `chmod +x`

**Environment variables**:
- Check if `.env` or similar is required
- Look for `.env.example` to copy

After fixing, re-run the failed command to verify the fix works.

Once all commands from `copilot-instructions.md` run successfully, the environment is set up.

Provide a summary:
- Tools installed (with versions)
- Dependencies installed
- Any fixes applied
- Confirmation that all `copilot-instructions.md` commands pass

## Important Notes

- **CI is the source of truth** for all version decisions
- **Fix problems, don't just report them** - the goal is a working environment
- Run commands sequentially to catch issues early
- If you update any version files, ensure consistency across all references
