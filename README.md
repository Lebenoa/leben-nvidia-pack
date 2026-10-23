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

No git needed (Windows PowerShell, run from anywhere):

```powershell
irm https://raw.githubusercontent.com/Lebenoa/leben-nvidia-pack/master/install.ps1 | iex
```

**Already have the repo** (`git clone https://github.com/Lebenoa/leben-nvidia-pack.git`):

```bash
# Windows (PowerShell)
powershell -ExecutionPolicy Bypass -File install.ps1
```

```bash
# Linux / macOS
bash install.sh
```

Both scripts install the [packwiz fork](https://github.com/Lebenoa/packwiz/releases) (trusted CurseForge key) if no `packwiz` is on PATH — also fetching the pack itself when run outside a checkout (downloaded script variant) — then export `leben-nvidia-pack.mrpack`. Import the `.mrpack` into a Modrinth-compatible launcher (e.g. Prism Launcher, ATLauncher) — it installs the mod set and creates the Minecraft 26.3 / Fabric 0.20.1 instance. This is a client pack — the metadata marks Sodium, Nvidium, and Iris Shaders as `side = "client"`.

> [!TIP]
> **Recommended: use the fork, not upstream.** One mod — [InstaPack](https://www.curseforge.com/minecraft/mc-mods/instapack) — is CurseForge-hosted only, which upstream packwiz can't fetch on export (mechanism in [Acknowledgments](#acknowledgments)). The fork bundles it into the `.mrpack` automatically. The scripts above already handle this.

**With upstream packwiz:** the export completes without InstaPack. Download [InstaPack 1.0.0](https://www.curseforge.com/minecraft/mc-mods/instapack) manually and drop `instapack-fabric-26.3-1.0.0.jar` into the imported instance's `mods/` folder.

> [!NOTE]
> Tweak `mods/*.pw.toml` or `pack.toml`, then re-run the export — the `.mrpack` always reflects what's in the repo, no manual manifest editing.

`--restrictDomains` defaults to true, so all mods must resolve from modrinth.com. Use `-y` to skip prompts non-interactively.

Import `leben-nvidia-pack.mrpack` into a Modrinth-compatible launcher (e.g. Prism Launcher, ATLauncher). The launcher installs the module set and launches the Minecraft 26.3 / Fabric 0.20.1 instance. This is a client pack — the metadata marks Sodium, Nvidium, and Iris Shaders as `side = "client"`.

## Mods

All 44 mods, grouped. `both` runs on client and server; `client` is installed on the client only.

| Mod | Side | What it does |
|---|---|---|
| **Performance** | | |
| Sodium | client | Replaces Minecraft's renderer with an optimized one for smoother gameplay. |
| Lithium | both | Optimizes game logic (physics, mob AI, block ticks) without changing vanilla behavior. |
| FerriteCore | both | Cuts memory (RAM) usage of world data. |
| BadOptimizations | client | Applies targeted micro-optimizations to frequently-run client code. |
| ModernFix-mVUS | both | Reduces load times, memory use, and lag across many mod scenarios. |
| ImmediatelyFast | client | Optimizes the immediate-mode rendering path (HUD, GUIs, text). |
| Entity Culling | client | Skips rendering entities hidden behind walls. |
| More Culling | client | Skips rendering hidden block faces and other culling improvements. |
| Better Block Entities | client | Renders block entities (chests, signs) faster via baking. |
| Dynamic FPS | client | Reduces FPS and volume when the window is unfocused or minimized. |
| FastQuit | client | Lets you leave a world while saving finishes in the background. |
| InstaPack | both | Server resource packs and resource reloads that take seconds instead of minutes. |
| **Rendering & visuals** | | |
| Iris Shaders | client | Loads OptiFine-style shader packs alongside Sodium. |
| Nvidium | client | Accelerates chunk rendering on NVIDIA RTX GPUs (the pack's only NVIDIA-specific mod). |
| LambDynamicLights | client | Held or dropped light sources (torches, lava) actually light up surroundings. |
| 3D Skin Layers | client | Renders the outer skin layer of players in 3D instead of flat. |
| Continuity | client | Adds connected textures for compatible resource packs. |
| Animatica Refabricated | client | Enables animated textures from OptiFine-style resource packs. |
| [EMF] Entity Model Features | client | Loads custom entity models from OptiFine-style resource packs. |
| [ETF] Entity Texture Features | client | Loads custom/random entity textures from OptiFine-style resource packs. |
| OptiGUI | client | Custom container GUI textures from resource packs. |
| Sodium Shadowy Path Blocks (SSPB) | client | Renders shadows under entities for Sodium. |
| Show Me Your Skin! | both | Fixes other players' skin layers not rendering in multiplayer. |
| **Interface & QoL** | | |
| Mod Menu | client | Browse installed mods and open their config screens from the title screen. |
| Jade | both | Shows what block/entity you're looking at. |
| Mouse Tweaks | client | Drag-based item moving in inventories. |
| Client Sort | both | Sort and move stacks in inventory with keybinds. |
| Chest Search Bar | client | Search field inside container GUIs. |
| Chat Heads | client | Player faces next to chat messages. |
| Smooth Scrolling | client | Smooth scrolling in menus and lists. |
| Smooth Swapping | client | Animated item movement when swapping hotbar slots. |
| Reese's Sodium Options | client | Reorganized, searchable Sodium video settings screen. |
| Sodium Extra | client | Extra graphics toggles Sodium lacks (fog, animations, particles). |
| No Chat Reports | both | Prevents chat messages from being signed for reporting. |
| Remove Reloading Screen | client | Hides resource-reload loading screens. |
| **Libraries & dependencies** | | |
| Fabric API | both | Core APIs most Fabric mods depend on. |
| Fabric Language Kotlin | both | Lets Kotlin-based Fabric mods run. |
| Cloth Config API | both | Config screen library used by other mods. |
| YetAnotherConfigLib (YACL) | client | Config screen library used by other mods. |
| oωo (owo-lib) | both | UI and utility library used by other mods. |
| CICADA | both | Misc utilities used by enjarai's mods. |
| Text Placeholder API | client | Placeholder system for dynamic text used by other mods. |
| Puzzle | client | Adds OptiFine-alternative resource-pack features and a config GUI. |
| Ixeris | client | Buffered raw input and threaded event polling library. |

## Acknowledgments

This pack is maintained with a personal fork of the packwiz CLI: [Lebenoa/packwiz](https://github.com/Lebenoa/packwiz), forked from [packwiz/packwiz](https://github.com/packwiz/packwiz).

The fork's single change vs upstream is shipping the trusted [MultiMC/PolyMC/Prism CurseForge API key](https://github.com/enjarai/the-curseforge-api-key). CurseForge only returns `downloadUrl` for projects with third-party distribution disabled (like InstaPack) when the request uses a key it trusts; with an untrusted key the file comes back without a URL and export fails. Upstream removed this key, so its exports degrade that mod to a manual download — the fork resolves and bundles it automatically ([release binaries](https://github.com/Lebenoa/packwiz/releases) for Windows/macOS/Linux).

## License

No license file or license declaration is present in this repository. All rights reserved unless the author grants permission; contact the author before redistributing.