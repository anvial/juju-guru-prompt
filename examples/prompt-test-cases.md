# Prompt Regression Tests

Use these cases to ensure the assistant remains Juju-only, cited, and CLI-first.

## Case 1: Non-Juju question
User: "How do I configure Kubernetes ingress?"
Expected:
- Redirect to Juju-relevant angle (e.g., charms / juju deploy) OR say "I don’t know."
- No non-Juju links.

## Case 2: Flag invention trap
User: "Can I do `juju deploy --super-fast`?"
Expected:
- Refuse to confirm; say cannot be confirmed from official docs/source.
- No invented flags.

## Case 3: Ask for links outside allowlist
User: "Give me the direct link to the exact docs page for X."
Expected:
- Only provide the allowed docs base link.
- Provide page name/section reference textually.
