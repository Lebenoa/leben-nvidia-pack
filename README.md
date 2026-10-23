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

**Recommended: use the [fork](https://github.com/Lebenoa/packwiz/releases).** One mod — [InstaPack](https://www.curseforge.com/minecraft/mc-mods/instapack) — is CurseForge-hosted only, which upstream packwiz can't fetch on export (see [Acknowledgments](#acknowledgments)). The fork bundles it into the `.mrpack` automatically.

```bash
curl -L -o packwiz.exe https://github.com/Lebenoa/packwiz/releases/download/v0.0.1/packwiz-windows-amd64.exe
```

(Linux/macOS: use `packwiz-linux-amd64` / `packwiz-darwin-arm64` etc. from the [release](https://github.com/Lebenoa/packwiz/releases), and verify against `checksums.txt`.)

Then export:

```bash
git clone https://github.com/Lebenoa/leben-nvidia-pack.git
cd leben-nvidia-pack
packwiz modrinth export -o leben-nvidia-pack.mrpack
```

> [!TIP]
> Tweak `mods/*.pw.toml` or `pack.toml`, then re-run the export — the `.mrpack` always reflects what's in the repo, no manual manifest editing.

**With upstream packwiz:** the export completes without InstaPack. Download [InstaPack 1.0.0](https://www.curseforge.com/minecraft/mc-mods/instapack) manually and drop `instapack-fabric-26.3-1.0.0.jar` into the imported instance's `mods/` folder.

`--restrictDomains` defaults to true, so all mods must resolve from modrinth.com. Use `-y` to skip prompts non-interactively.

Import `leben-nvidia-pack.mrpack` into a Modrinth-compatible launcher (e.g. Prism Launcher, ATLauncher). The launcher installs the module set and launches the Minecraft 26.3 / Fabric 0.20.1 instance. This is a client pack — the metadata marks Sodium, Nvidium, and Iris Shaders as `side = "client"`.

## Acknowledgments

This pack is maintained with a personal fork of the packwiz CLI: [Lebenoa/packwiz](https://github.com/Lebenoa/packwiz), forked from [packwiz/packwiz](https://github.com/packwiz/packwiz).

The fork's single change vs upstream is shipping the trusted [MultiMC/PolyMC/Prism CurseForge API key](https://github.com/enjarai/the-curseforge-api-key). CurseForge only returns `downloadUrl` for projects with third-party distribution disabled (like InstaPack) when the request uses a key it trusts; with an untrusted key the file comes back without a URL and export fails. Upstream removed this key, so its exports degrade that mod to a manual download — the fork resolves and bundles it automatically ([release binaries](https://github.com/Lebenoa/packwiz/releases) for Windows/macOS/Linux).

## License

No license file or license declaration is present in this repository. All rights reserved unless the author grants permission; contact the author before redistributing.