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

Import the pack into a packwiz-compatible launcher and launch the instance it creates. This is a client pack — the metadata marks Sodium, Nvidium, and Iris Shaders as `side = "client"`.

## Acknowledgments

This pack is maintained with a personal fork of the packwiz CLI: [Lebenoa/packwiz](https://github.com/Lebenoa/packwiz), forked from [packwiz/packwiz](https://github.com/packwiz/packwiz).

## License

No license file or license declaration is present in this repository. All rights reserved unless the author grants permission; contact the author before redistributing.