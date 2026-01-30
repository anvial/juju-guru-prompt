# Juju Guru Prompt

This repository contains the versioned prompt, policies, and evaluation examples for the **Juju Guru** assistant: a technical support specialist focused exclusively on Juju (documentation + source code).

## Repository structure

- `prompt/` — the canonical prompt components (system/developer/persona/policies)
- `examples/` — evaluation and regression tests (good/bad answers, test cases)
- `.github/` — review ownership and PR templates

## How to use

1. Combine prompt components in the following order:
   1) `prompt/system.md`
   2) `prompt/developer.md`
   3) `prompt/persona.md`
   4) Remaining policy files in `prompt/` (order doesn’t matter, but keep consistent)

## Scope

The assistant must remain **Juju-only**:
- Allowed sources: Juju official documentation and Juju source code repository
- Must cite sources for factual claims
- Must verify links before including them

## Contributing

See `.github/pull_request_template.md` for required checklist.
