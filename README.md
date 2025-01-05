# Requirements

* Visual Studio Code
* [Node](https://nodejs.org/) or [Bun](https://bun.sh/)
* [Roblox LSP](https://marketplace.visualstudio.com/items?itemName=Nightrains.robloxlsp)

> Roblox LSP is optional but highly recommended

# First Time Usage

Setting up the environment for usage is very easy and straight forward.

First start with installing the required packages:

##### Bun

```sh
bun install
```

##### Node

```sh
npm install
```

Then select the current build task depending on what you have installed. To pull up the menu press `CTRL + SHIFT + B` or whatever keybind you have setup currently for running build tasks.  
You can also go into the top bar and press `Terminal` and then `Run Build Task...` or you can open the VSC command line and run the Build Task through that.

Once you select the Build Task to use (Based on whether you use Node or Bun), press `CTRL + SHIFT + B` and you are done.

# Packer Macros

> Notice: Packer macros are not actual functions and cannot be modified in any way via Lua.

## `IMPORT(path: string)`

Import simply grabs the code and wraps it in a anonymous function call. It's very easy to use and even easier to assign to a variable, just like `require`.

```lua
IMPORT("src/Something/A.lua")

local myModule = IMPORT("src/Library/Stuff.lua")

myModule.DoSomething() --> Note you can make modules easily via following the normal format.
```

## `IMPORT_DIR(path: string)`

`IMPORT_DIR` simply grabs all the files inside of the selected directory and wraps it in `do end`'s. Please note that this will import EVERYTHING inside that folder, try to avoid double imports by accident.

```lua
IMPORT_DIR("src/MyFolder/")
```

## `IMPORT_MULTI(...: string)`

`IMPORT_MULTI` grabs every file you add and adds it into a single function.

```lua
IMPORT_MULTI("src/MyFile.lua", "src/Aaaa.lua")
```

## `BUILD_TIMESTAMP(when: string)`

`BUILD_TIMESTAMP` is pretty much the current UNIX timestamp.

```lua
BUILD_TIMESTAMP("now")
```