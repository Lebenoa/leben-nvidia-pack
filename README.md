# Leben's NVIDIA Pack

A client-side Fabric modpack for Minecraft 26.3. Despite the name, the only NVIDIA-specific mod is Nvidium (RTX-only) — Sodium, Iris Shaders, and the rest run on any GPU.

## Features

- Render with Sodium and Iris Shaders; add Nvidium 0.4.4 on NVIDIA RTX GPUs — the only NVIDIA-specific mod in the pack.
- Use client-side interface and quality-of-life mods, including Jade, Mouse Tweaks, and Smooth Scrolling.
- Stop at any version you like — every mod is pinned by packwiz metadata with SHA-512-verified downloads, so importing the pack once resolves the exact same set.

## Installation

This repository is a packwiz pack: `pack.toml` + `index.toml` + `mods/*.pw.toml` metadata. Import it with a launcher that supports packwiz packs (launcher-specific steps are not in this repository).

The pack targets Minecraft **26.3** and Fabric **0.20.1** (packwiz format **1.1.0**).

## Usage

Export the pack to a `.mrpack` and import it into a Modrinth-compatible launcher.

**Use the fork, not upstream.** One mod — [InstaPack](https://www.curseforge.com/minecraft/mc-mods/instapack) — is hosted on CurseForge only (`mods/instapack.pw.toml` has `metadata:curseforge`). CurseForge returns `downloadUrl` for such distribution-disabled projects only to keys it trusts (known launcher keys); with an untrusted key the file comes back without a URL and export fails. Upstream packwiz removed the trusted MultiMC/PolyMC/Prism key, so InstaPack becomes a manual download. The fork ships that trusted key ([enjarai/the-curseforge-api-key](https://github.com/enjarai/the-curseforge-api-key)), so InstaPack resolves and bundles into the `.mrpack` automatically. Grab a [fork release](https://github.com/Lebenoa/packwiz/releases) binary for your platform (e.g. `packwiz-windows-amd64.exe`) and put it on your PATH as `packwiz`:

```bash
curl -LO https://github.com/Lebenoa/packwiz/releases/download/v0.0.1/packwiz-windows-amd64.exe
```

Then export:

```bash
git clone https://github.com/Lebenoa/leben-nvidia-pack.git
cd leben-nvidia-pack
packwiz modrinth export -o leben-nvidia-pack.mrpack
```

`--restrictDomains` defaults to true, so all mods must resolve from modrinth.com. Use `-y` to skip prompts non-interactively.

Import `leben-nvidia-pack.mrpack` into a Modrinth-compatible launcher (e.g. Prism Launcher, ATLauncher). The launcher installs the module set and launches the Minecraft 26.3 / Fabric 0.20.1 instance. This is a client pack — the metadata marks Sodium, Nvidium, and Iris Shaders as `side = "client"`.

## Acknowledgments

This pack is maintained with a personal fork of the packwiz CLI: [Lebenoa/packwiz](https://github.com/Lebenoa/packwiz), forked from [packwiz/packwiz](https://github.com/packwiz/packwiz).

## License

No license file or license declaration is present in this repository. All rights reserved unless the author grants permission; contact the author before redistributing.