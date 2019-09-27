## Instructions
### Creating source files
Any file which matches the shell glob `_*` will be linked into `$HOME` as a symlink with the first `_`
replaced with a `.`

For example: _bashrc becomes ${HOME}/.bashrc

### Installing source files
Run the following:

    ./install.sh

**Warning** This will delete any existing files with names as described above from your home directory

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
