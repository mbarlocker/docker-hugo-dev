#!/bin/bash
set -Eeuo pipefail

source "/home/app/.bashnvm"
source "/env.sh"

: "${PORT:?Missing port. Specify PORT in env.sh before running.}"

cd /app

if ! nvm use >/dev/null 2>&1; then
	nvm install
	nvm use
fi

corepack enable
yarn install

exec hugo server -D --bind "${ADDRESS:-0.0.0.0}" --port "${PORT}"
