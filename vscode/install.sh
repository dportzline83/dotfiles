#!/usr/bin/env bash
# Deploys the VS Code configuration that Settings Sync does not cover:
#   * <user dir>/mcp.json          (MCP server definitions)
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./paths.sh
source "${script_dir}/paths.sh"

link_config() {
  local source="$1" target="$2"

  mkdir -p "$(dirname "${target}")"

  if [ -e "${target}" ] && [ ! -L "${target}" ]; then
    mv "${target}" "${target}.bak"
    echo "Backed up existing ${target} to ${target}.bak"
  fi

  ln -sfn "${source}" "${target}"
  echo "Linked ${target} -> ${source}"
}

link_config "${script_dir}/mcp.json" "${VSCODE_USER_DIR}/mcp.json"

echo
echo "Agent plugins must be installed by hand via 'Chat: Install Agent Plugin...':"
grep -v '^\s*#' "${script_dir}/agent-plugins.txt" | grep -v '^\s*$' | sed 's/^/  /'
