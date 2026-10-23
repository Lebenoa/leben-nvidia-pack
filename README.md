# Leben's NVIDIA Pack

A client-side Fabric modpack for Minecraft 26.3 with rendering and quality-of-life mods. Despite the name, Nvidium is the only NVIDIA-specific mod.

## Features

- Render with Sodium and Iris Shaders; use Nvidium's alternative renderer on supported NVIDIA GPUs when shaders are inactive.
- Use client-side interface and quality-of-life mods, including Jade, Mouse Tweaks, and Smooth Scrolling.
- Export the recorded mod versions to a `.mrpack` for import into a compatible launcher.

## No Redistribution

No prebuilt `.mrpack` is published here because of the maintainer's redistribution concerns about InstaPack. This repository provides metadata and scripts to download the mods and build the pack locally. This policy is not a license grant for the included mods.

The pack targets Minecraft **26.3** and Fabric **0.20.1** (packwiz format **1.1.0**).

## Installation

Download the repository using **Code → Download ZIP**, or [download the ZIP directly](https://github.com/Lebenoa/leben-nvidia-pack/archive/refs/heads/master.zip). Extract it before running either installer; Git is not required.

Windows requires PowerShell 5.1 or later; its downloader and ZIP extraction commands are built in. Linux/macOS require bash and curl, plus tar when the script must fetch the pack. Both paths require internet access and a launcher that imports `.mrpack` files.

## Usage

**Windows:** double-click `install.cmd` in the extracted folder. It runs `install.ps1` and keeps the window open so you can read the result or any errors. No administrator privileges are required.

Alternatively, open PowerShell in the extracted folder and run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1
```

**Linux / macOS:** open a terminal in the extracted folder and run:

```bash
# Linux / macOS
bash install.sh
```

The scripts reuse `packwiz` on PATH, or download fork release **v0.0.1** if none is found, then export `leben-nvidia-pack.mrpack`. The Windows downloader selects the amd64 build; the Unix script selects an asset using the OS and architecture. These scripts export the pack; they do not install a launcher or Minecraft.

> [!TIP]
> **Recommended: use the [fork release](https://github.com/Lebenoa/packwiz/releases).** It can fetch InstaPack automatically. If `packwiz` is already on PATH, the scripts reuse it without verifying that it is the fork; an upstream binary may require a manual download. See [Acknowledgments](#acknowledgments) for the API-key explanation.

**With upstream packwiz:** if export requests a manual download, obtain [InstaPack 1.0.0 for Fabric 26.3](https://www.curseforge.com/minecraft/mc-mods/instapack/files/9099256) and follow packwiz's prompt before retrying. Do not assume a failed export produced a complete pack.

> [!NOTE]
> After changing the pack metadata, run the installer again to generate a new `.mrpack`.

After export succeeds, import `leben-nvidia-pack.mrpack` into a compatible launcher, such as Prism Launcher or ATLauncher. Launch the imported Minecraft **26.3** / Fabric **0.20.1** instance.

## Why?

I spent hours assembling this mod collection because [Fabulously Optimized](https://modrinth.com/modpack/fabulously-optimized) includes some mods I do not want and omits others I use. This pack includes most of my usual mods, leaving out those I rarely use.

## Mods

All 44 mods, grouped by purpose. The Side column reproduces this pack's metadata (`client` or `both`); it is not a guarantee of server compatibility.

| Mod | Side | What it does |
|---|---|---|
| **Performance** | | |
| [Sodium](https://modrinth.com/mod/AANobbMI) | client | Replaces Minecraft's renderer with an optimized one for smoother gameplay. |
| [Lithium](https://modrinth.com/mod/gvQqBUqZ) | both | Optimizes game logic (physics, mob AI, block ticks) without changing vanilla behavior. |
| [FerriteCore](https://modrinth.com/mod/uXXizFIs) | both | Reduces Minecraft's memory usage. |
| [BadOptimizations](https://modrinth.com/mod/g96Z4WVZ) | client | Applies targeted micro-optimizations to frequently-run client code. |
| [ModernFix-mVUS](https://modrinth.com/mod/TjSm1wrD) | both | Extends ModernFix to additional Minecraft versions, retaining performance, memory, and bug fixes. |
| [ImmediatelyFast](https://modrinth.com/mod/5ZwdcRci) | client | Optimizes the immediate-mode rendering path (HUD, GUIs, text). |
| [Entity Culling](https://modrinth.com/mod/NNAgCjsB) | client | Skips rendering hidden entities and block entities. |
| [More Culling](https://modrinth.com/mod/51shyZVL) | client | Skips rendering hidden block faces and other culling improvements. |
| [Better Block Entities](https://modrinth.com/mod/ONZm0H7Y) | client | Optimizes block entity rendering, including chests and signs, while preserving animations. |
| [Dynamic FPS](https://modrinth.com/mod/LQ3K71Q1) | client | Adjusts frame rate, volume, and resource use when backgrounded, idle, or on battery. |
| [FastQuit](https://modrinth.com/mod/x1hIzbuY) | client | Lets you leave a world while saving finishes in the background. |
| [Ixeris](https://modrinth.com/mod/p8RJPJIC) | client | Reduces input-polling overhead, especially with high-polling-rate mice on Windows. |
| [InstaPack](https://www.curseforge.com/minecraft/mc-mods/instapack) | both | Optimizes resource reloads, skips unchanged server packs, and caches packs to avoid repeat downloads. |
| **Rendering & visuals** | | |
| [Iris Shaders](https://modrinth.com/mod/YL57xq9U) | client | Loads OptiFine-style shader packs alongside Sodium. |
| [Nvidium](https://modrinth.com/mod/SfMw2IZN) | client | Replaces Sodium's terrain renderer on mesh-shader-capable NVIDIA GPUs (GTX 16-series and supported newer cards); disables itself while Iris shaders are active. |
| [LambDynamicLights](https://modrinth.com/mod/yBW8D80W) | client | Adds dynamic lighting from held and dropped light-emitting items and glowing or burning entities. |
| [3D Skin Layers](https://modrinth.com/mod/zV5r3pPn) | client | Renders the outer skin layer of players in 3D instead of flat. |
| [Continuity](https://modrinth.com/mod/1IjD5062) | client | Supports connected textures, emissive block/item textures, and custom block layers in compatible resource packs. |
| [Animatica Refabricated](https://modrinth.com/mod/xEyZuswh) | client | Enables animated textures from OptiFine-style resource packs. |
| [\[EMF\] Entity Model Features](https://modrinth.com/mod/4I1XuqiY) | client | Loads custom entity models from OptiFine-style resource packs. |
| [\[ETF\] Entity Texture Features](https://modrinth.com/mod/BVzZfTc1) | client | Supports custom, random, and emissive entity textures and additional player-skin features. |
| [OptiGUI](https://modrinth.com/mod/JuksLGBQ) | client | Custom container GUI textures from resource packs. |
| [Puzzle](https://modrinth.com/mod/3IuO68q1) | client | Adds resource-pack features and a shared configuration GUI for OptiFine alternatives. |
| [Sodium Shadowy Path Blocks (SSPB)](https://modrinth.com/mod/EIa1eiMm) | client | Restores vanilla-like smooth shading on non-full blocks, such as dirt paths, when using Sodium. |
| [Show Me Your Skin!](https://modrinth.com/mod/bD7YqcA3) | both | Hides or customizes armor rendering so player skins remain visible. |
| **Interface & QoL** | | |
| [Mod Menu](https://modrinth.com/mod/mOgUt4GM) | client | Browse installed mods and open their config screens from the title screen. |
| [Jade](https://modrinth.com/mod/nvQzSEkH) | both | Shows what block/entity you're looking at. |
| [Mouse Tweaks](https://modrinth.com/mod/aC3cM3Vq) | client | Drag-based item moving in inventories. |
| [Client Sort](https://modrinth.com/mod/K0AkAin6) | both | Sort and move stacks in inventory with keybinds. |
| [Chest Search Bar](https://modrinth.com/mod/FqlAuAzY) | client | Search field inside container GUIs. |
| [Chat Heads](https://modrinth.com/mod/Wb5oqrBJ) | client | Player faces next to chat messages. |
| [Smooth Scrolling](https://modrinth.com/mod/CllP7wW0) | client | Adds configurable smooth scrolling to chat, the hotbar, inventories, and lists. |
| [Smooth Swapping](https://modrinth.com/mod/ydZic5r4) | client | Animates item movement inside inventories. |
| [Reese's Sodium Options](https://modrinth.com/mod/Bh37bMuy) | client | Reorganized, searchable Sodium video settings screen. |
| [Sodium Extra](https://modrinth.com/mod/PtjYWJkn) | client | Extra graphics toggles Sodium lacks (fog, animations, particles). |
| [No Chat Reports](https://modrinth.com/mod/qQyHxfxd) | both | Removes chat signatures where possible; client-side protection depends on server policy. |
| [Remove Reloading Screen](https://modrinth.com/mod/ZP7xHXtw) | client | Keeps the game accessible during resource reloads, retaining a progress bar. |
| **Libraries & dependencies** | | |
| [Fabric API](https://modrinth.com/mod/P7dR8mSH) | both | Core APIs most Fabric mods depend on. |
| [Fabric Language Kotlin](https://modrinth.com/mod/Ha28R6CL) | both | Lets Kotlin-based Fabric mods run. |
| [Cloth Config API](https://modrinth.com/mod/9s6osm5g) | both | Config screen library used by other mods. |
| [YetAnotherConfigLib (YACL)](https://modrinth.com/mod/1eAoo2KR) | client | Config screen library used by other mods. |
| [oωo (owo-lib)](https://modrinth.com/mod/ccKDOlHs) | both | UI and utility library used by other mods. |
| [CICADA](https://modrinth.com/mod/IwCkru1D) | both | Misc utilities used by enjarai's mods. |
| [Text Placeholder API](https://modrinth.com/mod/eXts2L7r) | client | Placeholder system for dynamic text used by other mods. |

## Acknowledgments

This pack is maintained with a personal fork of the packwiz CLI: [Lebenoa/packwiz](https://github.com/Lebenoa/packwiz), forked from [packwiz/packwiz](https://github.com/packwiz/packwiz).

The fork's single change vs upstream is shipping the trusted [MultiMC/PolyMC/Prism CurseForge API key](https://github.com/enjarai/the-curseforge-api-key). CurseForge only returns `downloadUrl` for projects with third-party distribution disabled (like InstaPack) when the request uses a key it trusts; with an untrusted key the file comes back without a URL and export fails. Upstream removed this key, so its exports degrade that mod to a manual download — the fork resolves and bundles it automatically ([release binaries](https://github.com/Lebenoa/packwiz/releases) for Windows/macOS/Linux).

## License

No license file or license declaration is present in this repository. All rights reserved unless the author grants permission; contact the author before redistributing.