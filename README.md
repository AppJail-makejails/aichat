# AIChat

AIChat is an all-in-one LLM CLI tool featuring Shell Assistant, CMD & REPL Mode, RAG, AI Tools & Agents, and More.

github.com/sigoden/aichat

## How to use this Makejail

### Start lightweight built-in HTTP server

```console
$ appjail oci run -Pd \
    -o overwrite=force \
    -o virtualnet=":<random> default" \
    -o nat \
    -e AICHAT_MODEL=gemini:gemini-3.5-flash-lite \
    -e AICHAT_PLATFORM=gemini \
    -e GEMINI_API_KEY=abc-def-hij-1234 \
    ghcr.io/appjail-makejails/aichat aichat
```

### Using AIChat only from the CLI

```console
$ appjail oci run \
    -o overwrite=force \
    -o virtualnet=":<random> default" \
    -o nat \
    -o ephemeral \
    -e AICHAT_MODEL=gemini:gemini-3.5-flash-lite \
    -e AICHAT_PLATFORM=gemini \
    -e GEMINI_API_KEY=abc-def-hij-1234 \
    ghcr.io/appjail-makejails/aichat aichat-cli \
    aichat &&
  appjail stop aichat-cli
```

### Arguments (stage: build)

* `aichat_from` (default: `ghcr.io/appjail-makejails/aichat`): Location of OCI image. See also [OCI Configuration](#oci-configuration).
* `aichat_tag` (default: `latest`): OCI image tag. See also [OCI Configuration](#oci-configuration).

### Environment (OCI image)

* `PGID` (default: `1000`): Equivalent to `PUID` but for the Process Group ID.
* `PUID` (default: `1000`): Process User ID for the container's main process, allowing you to match the owner of files written to mounted host volumes to your host system's user. Writable volumes are changed based on this environment variable.

## OCI Configuration

```yaml
build:
  variants:
    - tag: 15.1
      containerfile: Containerfile
      aliases: ["latest"]
      default: true
      args:
        FREEBSD_RELEASE: "15.1"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
```
