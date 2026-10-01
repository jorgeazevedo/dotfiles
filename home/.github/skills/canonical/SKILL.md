---
name: canonical
description: Align with implementation with canonical reference
disable-model-invocation: true
argument-hint: The name of file or files to align
---
Rewrite the changes applied to the specified file(s) in this branch so that it converges on the canonical, documented form of this kind of change, and our ownership shrinks to only what is genuinely specific to us.

1. First, find the authoritative reference for what this change should look like — the official documentation, the library or framework's own readme, or the specification. Use @see comments to cite the exact web source you're working from so that a reviewer can follow the URL and idependetly verify the work. If several exist, prefer the one shipped with the version we actually depend on.
2. Attempt to make the change word for word identical to the reference. In case of conflict the project's own lint and formatting rules should win.
3. Stay inside the artefact as much as possible. You may change things outside it — dependencies, build config, infrastructure, tests, snapshots — only where they are *required* for the canonical form to work. Configuration elsewhere that is merely redundant is out of scope: leave it, and list it for me instead. Explicit configuration at a boundary between two systems is not redundancy, even when the two defaults happen to agree.
4. For anything that remains and still differs from the reference, prove to yourself it's genuinely forced by our environment. If it is, keep it and add a single short comment stating why it deviates. If you can't justify it, remove it.
5. When you're done, every line should be either identical to the reference or an annotated deviation. Walk the file top to bottom and tell me which category each part falls into.
6. Verify the behaviour is unchanged first by building and testing it, then proposing to the user a way to test it for real. Once you get sign off, execute your verification and report what you observed.
7. Finally, where the reference left something genuinely optional and you had to pick — which options to omit, which variant of the reference to follow, anything you transcribed that reads oddly in our context — list those choices at the end and ask me to sign off on them rather than settling them silently.

Don't preserve our existing structure out of deference to it. Assume anything bespoke is accidental until you've shown otherwise.