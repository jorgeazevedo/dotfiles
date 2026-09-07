---
name: remove-redundant-cdk-dependencies
description: Removes redundant dependencies
disable-model-invocation: true
---
# Remove Redundant CDK Dependencies

This prompt automates the removal of redundant CDK dependencies from repositories that use `@guardian/cdk`.

## Instructions

### Step 1: Verify Prerequisites

First, check that this repository meets all prerequisites:

1. **Check the current branch is `main`:**
   ```bash
   git branch --show-current
   ```
   If the current branch is not `main`, stop and report that the repository is not on the main branch.

2. **Check if a CDK project exists:**
   Look for a `cdk` directory and a `cdk/package.json` file in the repository. If it doesn't exist, stop and report that this is not a CDK project.

3. **Check for `@guardian/cdk` dependency:**
   Read the `cdk/package.json` file and verify that `@guardian/cdk` is declared as a dependency (in either `dependencies` or `devDependencies`). If not present, stop and report that this project does not use `@guardian/cdk`.

### Step 2: Check for Redundant Dependencies

In the `cdk/package.json` file, check if any of the following packages are declared as dependencies or devDependencies:
- `aws-cdk`
- `aws-cdk-lib`
- `constructs`

If none of these packages are present, stop and report that there are no redundant dependencies to remove.

### Step 3: Remove Redundant Dependencies

If any of the redundant dependencies are found:

1. Navigate to the `cdk` directory
2. Remove the redundant packages using npm:
   ```bash
   npm uninstall aws-cdk aws-cdk-lib constructs
   ```
   Note: Only uninstall the packages that are actually present in the package.json.

### Step 4: Synth and Verify

Synth the application to ensure it still works:

```bash
npm run synth
```

If the build fails, stop and report the error. Do not proceed with committing changes.

### Step 5: Commit Changes

If the build is successful:

1. Create a new branch:
   ```bash
   git checkout -b ja-cp-remove-redundant-dependencies
   ```

2. Stage the changes:
   ```bash
   git add cdk/package.json cdk/package-lock.json
   ```

3. Commit the changes:
   ```bash
   git commit -m "Remove redundant cdk dependencies"
   ```

### Step 6: Push and Create PR

1. Push the branch to origin:
   ```bash
   git push -u origin ja-cp-remove-redundant-dependencies
   ```

2. Create a pull request using the GitHub CLI:
   ```bash
   gh pr create --head ja-cp-remove-redundant-dependencies --base main --title "Remove redundant cdk dependencies" --body "These dependencies are no longer considered necessary, as they brought in as transitive dependencies of the gucdk package."
   ```

## Summary

Report the outcome of the operation:
- If successful, provide the PR URL
- If stopped at any step, explain why the operation was not completed
