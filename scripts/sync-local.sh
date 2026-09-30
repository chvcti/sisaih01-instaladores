#!/usr/bin/env bash
# Sincronização local: baixa das fontes oficiais DATASUS (o runner do GitHub não alcança o FTP),
# publica as releases e envia o manifesto atualizado para main.
set -euo pipefail
cd "$(dirname "$0")/.."
export PATH="$HOME/.local/bin:$PATH"
export GH_TOKEN="${GH_TOKEN:-$(gh auth token)}"

git pull --ff-only origin main
bun run sync:datasus

if git diff --quiet -- public/releases.json; then
  echo "Manifesto sem alterações."
  exit 0
fi
git add public/releases.json
git commit -m "chore: sincronizar releases DATASUS"
git push origin main
