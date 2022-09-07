# haskell-book-club

This repository should help you get up and running with Haskell in Visual Studio Code.

## Development Environment Instructions

You will need [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install) and [Docker Desktop for Windows](https://docs.docker.com/desktop/windows/install/) for this, so install those if you haven't already.

Open the root of this repository in Visual Studio Code. VS Code should detect that the folder contains Docker configuration files, so follow the instructions to set up a container.

## Usage

### Creating a package

1. Create a package folder under the `packages` directory, e.g. `packages/chapters/02`.
2. Add an entry to the root `stack.yaml` for the new package, e.g.:
```
packages:
  - packages/chapters/01
  - packages/chapters/02
```
3. In VS Code, open a new `bash` terminal.
4. In the terminal, `cd` to your new folder, e.g. `cd packages/chapters/02`.
5. Run `stack new {package-name} --bare`, e.g. `stack new chapter-two --bare`.

### Building a package

1. In the `bash` terminal, `cd` to the project root.
2. Run `stack build {package-name}`, e.g. `stack build chapter-two`.

### Running a package

To run the new package, use `stack run {package-name}-exe`, e.g. `stack run chapter-two-exe`.

The terminal should output the result of running the `main` function in `app/Main.hs`, which by default prints `someFunc` to the console.

### Working on a package

Before starting work on a new package, it's worth ensuring the Haskell language server is up and running. Without it, you won't see any syntax highlighting, which is extremely useful for writing and inspecting Haskell code.

To do this:

Open one of the modules within the new package, e.g. `src/Lib.hs`, and mouse over a function - if the language server is running, you should see a function definition appear above the cursor.

If you don't see a definition, try restarting the language server by doing the following:

1. Use `Ctrl + Shift + P` to open the Command Palette in VS Code.
2. Click 'Haskell: Restart Haskell LSP Server'.

You can also set a keyboard shortcut for this command by going to File > Preferences > Keyboard Shortcuts, finding the command and adding a keybinding, such as `Ctrl + Shift + A`.

If restarting the language server fails to resolve the issue:

1. Ensure you have added an entry to the root `stack.yaml` for the new package path (see above).
2. Try closing VS Code and reopening the project folder, making sure to choose the folder suffixed with [Dev Container].
