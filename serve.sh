#!/usr/bin/env bash
set -u

PORT="${1:-8000}"
DIR="${2:-.}"
HOST="${HOST:-127.0.0.1}"

have() {
  command -v "$1" >/dev/null 2>&1
}

run() {
  echo "Using: $*"
  exec "$@"
}

# Normalize dir
DIR="$(cd "$DIR" 2>/dev/null && pwd)" || {
  echo "Directory not found: $DIR" >&2
  exit 1
}

# 1) Python 3
if have python3; then
  run python3 -m http.server "$PORT" --bind "$HOST" --directory "$DIR"
fi

# 2) Python
if have python; then
  run python -m http.server "$PORT" --bind "$HOST" --directory "$DIR"
fi

# 3) BusyBox httpd
if have busybox; then
  run busybox httpd -f -p "$HOST:$PORT" -h "$DIR"
fi

# 4) Ruby
if have ruby; then
  if ruby -e 'require "webrick"' >/dev/null 2>&1; then
    run ruby -run -e httpd "$DIR" -p "$PORT" -b "$HOST"
  fi
fi

# 5) PHP
if have php; then
  cd "$DIR" || exit 1
  run php -S "$HOST:$PORT"
fi

# 6) Node via npx serve
if have npx; then
  cd "$DIR" || exit 1
  run npx --yes serve -l "$HOST:$PORT"
fi

echo "No supported server found." >&2
echo "Tried: python3, python, busybox httpd, ruby webrick, php, npx serve" >&2
exit 1
