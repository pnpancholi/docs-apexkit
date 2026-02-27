#!/bin/bash
set -e
echo "Building....."

uv venv
uv pip install zensical
.venv/bin/zensical build --clean

echo "Build Complete"
