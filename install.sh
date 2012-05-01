#!/usr/bin/env bash

set -e

DIR=$(dirname "$0")

if [ -z "$PREFIX" ]; then
    PREFIX="/usr/local"
fi

echo "Installing php-build in $PREFIX"

BIN_DIR="$PREFIX/bin"
MAN1_DIR="$PREFIX/share/man/man1"
MAN5_DIR="$PREFIX/share/man/man5"
TMP_DIR="/tmp/php-build"

echo -n "  - Creating Directories..."

[ ! -d "$BIN_DIR" ]          && mkdir -p "$BIN_DIR"
[ ! -d "$MAN1_DIR" ]          && mkdir -p "$MAN1_DIR"
[ ! -d "$MAN5_DIR" ]          && mkdir -p "$MAN5_DIR"
[ ! -d "$TMP_DIR/packages" ] && mkdir -p "$TMP_DIR/packages"
[ ! -d "$TMP_DIR/source" ]   && mkdir -p "$TMP_DIR/source"


echo " Done."

chmod -R 0777 "$TMP_DIR"

echo -n "  - Copying files..."
cp -R "$DIR/"{bin,share} "$PREFIX/"

cp "$DIR/man/php-build.1" "$PREFIX/share/man/man1/"
cp "$DIR/man/php-build.5" "$PREFIX/share/man/man5/"

echo " Done."
