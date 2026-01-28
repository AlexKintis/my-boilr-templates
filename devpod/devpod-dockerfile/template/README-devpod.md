# Devpod

## Execute the following

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ssh-add -l

devpod up .
```

To see the available containers use the following [webpage](https://containers.dev/features). This contains all the available images.

## Devcontainers + DevPod (fast guide)

### What a devcontainer is

A devcontainer is a **project-defined development environment** (OS + tools + settings) stored in the repo.
Anyone opening the repo gets the same toolchain and versions, inside a container.

### Why DevPod (`devpod.sh`)

DevPod is the **runner**. It reads `.devcontainer/devcontainer.json`, builds or pulls the image, starts the container as a workspace, and lets you attach to it.
`devpod.sh` is just the quick installer/entrypoint for DevPod.

---

## Minimal example (Rust in our case)

**Structure**

```
repo/
  .devcontainer/
    devcontainer.json
```

**.devcontainer/devcontainer.json**

```json
{
  "name": "rust-dev",
  "image": "mcr.microsoft.com/devcontainers/rust:1",
  "features": {
    "ghcr.io/devcontainers/features/git:1": {},
    "ghcr.io/devcontainers-contrib/features/neovim-homebrew:1": {}
  },
  "postCreateCommand": "rustc --version && cargo --version",
}
```

What this does:

* Uses a prebuilt Rust image (fast).
* Ensures Rust tooling exists.
* No custom Dockerfile needed.

---

## Run it with DevPod

[Installation guide](https://devpod.sh/docs/getting-started/install)

```bash
curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && sudo install -c -m 0755 devpod /usr/local/bin && rm -f devpod  # install DevPod
devpod provider add docker
devpod use ide none
devpod up .                           # start workspace from repo
```
