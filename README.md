## Instructions
### Creating source files
Any file which matches the shell glob `_*` will be linked into `$HOME` as a symlink with the first `_`
replaced with a `.`

For example: _bashrc becomes ${HOME}/.bashrc

### Installing source files
Run the following:

    ./install.sh

**Warning** This will delete any existing files with names as described above from your home directory

## VS Code
`vscode/` holds the VS Code configuration that Settings Sync does **not** cover. Settings, keybindings,
snippets, tasks, UI state and extensions are all handled by Settings Sync; these files are not.

| File | Linked to | Why it isn't synced |
| --- | --- | --- |
| `vscode/mcp.json` | `<user dir>/mcp.json` | MCP server definitions; secrets must stay machine-local |
| `vscode/agent-plugins.txt` | n/a | Copilot agent plugins installed from a git URL rather than the marketplace |

The user directory is `~/Library/Application Support/Code/User` on macOS, `~/.config/Code/User` on
Linux and `%APPDATA%\Code\User` on Windows.

`./install.sh` links `mcp.json`, backing up any existing non-symlink file as `*.bak`.
Extensions are intentionally omitted because Settings Sync will restore them on the new machine.

### Secrets
Never commit tokens into `vscode/mcp.json`. Use a `promptString` input with `"password": true`
(as the GitHub server does) so VS Code prompts for the value and stores it in the OS keychain.

### Agent plugins
VS Code has no CLI for installing agent plugins, so `vscode/agent-plugins.txt` is a reminder list.
For each URL, run **Chat: Install Agent Plugin...** from the Command Palette.

Skills and hooks under `~/.agents` are not tracked — they are installed and updated by the
Azure Copilot extension.

## Requirements
* bash
* git
* vim with the following scripts:
  * filetype
  * ftoff
  * ftplugin
  * ftplugof

## Mac specific instructions
* homebrew
* Xcode command line tools
* ```brew install vim```
* ```brew install git```
* ```brew install bash-completion```
