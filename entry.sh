#!/bin/bash
set -e
source /home/app/.bashnvm
source /env.sh

if [[ -z "${PORT}" ]]; then
	echo 'Missing port. Specify PORT in env.sh before running.'
	exit 1
fi

cd /app
if ! ( nvm use 2>/dev/null ); then
	nvm install
	nvm use
fi

corepack enable
yarn install

exec hugo server -D --bind "${ADDRESS:-0.0.0.0}" --port "${PORT}"
