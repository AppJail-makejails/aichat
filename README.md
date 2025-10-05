# AIChat

AIChat is an all-in-one LLM CLI tool featuring Shell Assistant, CMD & REPL Mode, RAG, AI Tools & Agents, and More.

github.com/sigoden/aichat

## How to use this Makejail

**Start lightweight built-in HTTP server**:

```sh
appjail makejail \
    -j aichat \
    -f gh+AppJail-makejail/aichat \
    -o virtualnet=":<random> default" \
    -o nat \
    -o expose=8000
appjail start \
    -V AICHAT_MODEL=gemini:gemini-2.5-flash \
    -V AICHAT_PLATFORM=gemini \
    -V GEMINI_API_KEY=abc1def-hi2jklm3no4 \
    aichat
```

**See also**: https://github.com/sigoden/aichat/wiki/Environment-Variables

**Using AIChat only from the CLI**:

```sh
appjail makejail \
  -j aichat \
  -f gh+AppJail-makejails/aichat \
  -o virtualnet=":<random> default" \
  -o nat
appjail start -V AICHAT_CLI_ONLY=1 aichat
```

### Arguments

* `aichat_plaftorm` (default: `host`).
* `aichat_ajspec` (default: `gh+AppJail-makejails/aichat`): Entry point where the `appjail-ajspec(5)` file is located.
* `aichat_tag` (default: `13.5`): see [#tags](#tags).

## Tags

| Tag           | Arch    | Version            | Type   |
| ------------- | --------| ------------------ | ------ |
| `13.5`    | `amd64` | `13.5-RELEASE` | `thin` |
| `14.3`    | `amd64` | `14.3-RELEASE` | `thin` |
