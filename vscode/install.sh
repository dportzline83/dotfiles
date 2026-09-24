#!/usr/bin/env bash
# Deploys the VS Code configuration that Settings Sync does not cover.
# MCP server definitions are synced via Settings Sync (MCP Servers category), not tracked here.
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Agent plugins must be installed by hand via 'Chat: Install Agent Plugin...':"
grep -v '^\s*#' "${script_dir}/agent-plugins.txt" | grep -v '^\s*$' | sed 's/^/  /'
