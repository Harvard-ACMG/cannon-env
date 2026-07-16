# Security Policy

## Scope

`cannon-env` contains shell configuration files and convenience scripts for customizing a
user's login environment on the FASRC Cannon cluster. It does not run as a service and does
not process external input, so its security surface is limited to things like:

- Scripts executing untrusted input unsafely
- Overly permissive file permissions being set on copied configuration files
- Secrets (API keys, tokens, passwords) accidentally committed to the repository

## Reporting a Vulnerability

If you discover a security issue in one of these scripts or configuration files, please
report it privately rather than opening a public issue, using GitHub's
[private vulnerability reporting](https://github.com/Harvard-ACMG/cannon-env/security/advisories/new)
for this repository.

Please include:

- A description of the issue and its potential impact
- Steps to reproduce it
- The affected file(s)

We will acknowledge your report and work with you on a fix and disclosure timeline.

## Reporting Other Bugs

Non-security bugs and technical issues should be reported as a
[GitHub issue](https://github.com/Harvard-ACMG/cannon-env/issues), as described in the
[README](README.md#reporting-bugs-or-technical-issues).
