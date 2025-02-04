<div align="center">
    ![license](https://img.shields.io/github/license/robloxarchiver/archiverpack)
    ![release](https://img.shields.io/github/v/release/robloxarchiver/archiverpack)
    ![downloads](https://img.shields.io/github/downloads/robloxarchiver/archiverpack/total)

    For my great friend, Topit. The original creator of [RedlinePack](https://github.com/topitbopit/RedlinePack).
</div>

# archiverpack

A bundler/packer for scripts in a template form so it's easy for anyone to use. Streamlined and currently pending a rewrite. Originally this was an internal tool used at NW. 

## Index
* [Requirements](#requirements)
* [First Time Usage](#first-time-usage)
* [Macros](#macros)

# Requirements

* [Visual Studio Code](https://code.visualstudio.com/)
* [Roblox LSP](https://marketplace.visualstudio.com/items?itemName=Nightrains.robloxlsp)
* [Rokit](https://github.com/rojo-rbx/rokit)
* [Bun](https://bun.sh/) or [Node](https://nodejs.org/)

# First Time Usage

Using ASP for the first time can be pretty jarring if you're a novice. I've broken everything down to be easy to understand even for the noobiest of people. :p

## Preparing for usage

Preparing to use ASP is simple, this is the only part you are required to do if it's your first time. If you already have Bun/Node, an IDE and Rokit installed, you can move on to the next part below this.

3. Install your IDE of choice, for the sake of standards [Visual Studio Code](https://code.visualstudio.com/) is used.
2. Go to [Rokit](https://github.com/rojo-rbx/rokit/releases) and download the latest release. (Restart may be required)
1. Go to [bun.sh](https://bun.sh/) and install bun. (Alternative: [Node.js](https://nodejs.org/en))

---

## Setting up for usage

1. Run `bun install` to install the package required (`fs-extra`)
2. Run `rokit install` to install the package required (`darklua`)
3. Now you are ready to use ASP. 

---

## Building with VSC

Press `CTRL + SHIFT + B` or head to the top bar, press `Terminal` and `Run Build Task`.

> Notice: If you are not using VSC a build script is provided (`build.ps1`)

# Macros

Macros are the foundation of ASP, and the reason you are using it. Macros can be modified in any way, such as changing the name if you'd like. This is just base documentation for each and what it does.  
Note that Macros are **not** created in the lua environment.

---

## IMPORT

Imports the file at the designated path. If the file is in `src/myfile.luau`, you would write: `IMPORT("src/myfile.luau")`.

```lua
IMPORT(path: string);
```

## IMPORT_RAW

The same as import, but does not wrap the import in an anonymous function.

```lua
IMPORT_RAW(path: string);
```

---

## IMPORT_DIR

Imports all the files in the path. If the path is `src/modules`, you would write: `IMPORT_DIR("src/modules")`.

```lua
IMPORT_DIR(path: string);
```

---

## IMPORT_MULTI

Adds each file into a single import. `IMPORT_MULTI("src/test.luau", "src/other.luau")`

```lua
IMPORT_MULTI(path...: string);
```

---

## BUILD_TIMESTAMP

Adds a UNIX timestamp of the date on build. Added this as a personal function since I use it a lot. Has a weird kink in some instances by the way, for anyone that may use this depending on how you use it, it will delete a ) next to it. So you'll have to add an extra one to prevent errors on build, so your LSP will freak out:

```lua
table.freeze({
    create_window = IMPORT("src/window.luau"),
    build_date = os.date("%c", BUILD_TIMESTAMP())) --> Extra ), doesn't error on build
});
```

If you can find a fix for this (most likely the shit regex topit wrote <3), please feel free to make a pull request to fix it. May be fixed in the rewrite when I get to that eventually. If you do not want errors just use it as the following:

```lua
local __TIMESTAMP = BUILD_TIMESTAMP();
local BUILD_DATE = os.date("%c", __TIMESTAMP);
```

Oh right, back to documentation.

```lua
BUILD_TIMESTAMP();
```
