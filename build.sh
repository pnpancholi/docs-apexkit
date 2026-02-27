#!/bin/bash
set -e
echo "Building....."

uv pip install zensical
zensical build --clean

echo "Build Complete"
