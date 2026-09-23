#!/usr/bin/env bash
# Resolves the platform-specific VS Code user configuration directory.

case "$(uname -s)" in
  Darwin)
    VSCODE_USER_DIR="${HOME}/Library/Application Support/Code/User"
    ;;
  MINGW*|CYGWIN*|MSYS*)
    VSCODE_USER_DIR="${APPDATA}/Code/User"
    ;;
  *)
    VSCODE_USER_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/Code/User"
    ;;
esac

export VSCODE_USER_DIR
