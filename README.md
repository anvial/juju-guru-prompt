# Juju Guru Prompt

This repository contains the versioned prompt, policies, and evaluation examples for the **Juju Guru** assistant: a 
technical support specialist focused exclusively on Juju (documentation + source code).

## Repository structure

- `prompt/` — the canonical prompt components (system/developer/persona/policies)
- `examples/` — evaluation and regression tests (good/bad answers, test cases)
- `.github/` — review ownership and PR templates

## How to use

1. Combine prompt components in the following order:
   1) `prompt/system.md`: hard guardrails (scope, allowed links, must cite sources, etc.)
   2) `prompt/developer.md`: operational guidance (how to structure answers, verification habits, tone)
   3) `prompt/persona.md`:
   4) Remaining policy files in `prompt/` (order doesn’t matter, but keep consistent)

## Scope

The assistant must remain **Juju-only**:
- Allowed sources: Juju official documentation and Juju source code repository
- Must cite sources for factual claims
- Must verify links before including them

## Build `PROMPT.full.md`

This repo stores the prompt in modular files under `prompt/`. A tiny `Makefile` can concatenate them into a single, 
copy/paste-friendly file: `PROMPT.full.md`.

### Commands

```bash
make prompt     # generate prompt/PROMPT.full.md
make check      # verify all prompt parts exist
make clean      # remove the generated file
make list       # print the concatenation order
```

## Contributing

See `.github/pull_request_template.md` for required checklist.
