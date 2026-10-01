---
name: scala-steward
description: scala-steward
disable-model-invocation: true
---
# Fix Scala Steward Configuration

## Instructions

Follow these steps to ensure Scala Steward is properly configured:

1. Check if `.scala-steward.conf` exists in the repository root.
2. If it does not exist, create the file.
3. Ensure the file contains the following configuration:

```hocon
updatePullRequests = "always"

pullRequests.frequency = "30 days"

pullRequests.grouping = [
  { name = "non_aws_minor_patch", "title" = "chore(deps): Non-AWS minor and patch version dependency updates", "filter" = [{"version" = "minor"}, {"version" = "patch"}] },
]
```

4. If the file already exists, merge the above settings with existing configuration, preserving any other valid settings.
