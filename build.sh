#!/bin/bash
set -e
echo "Building....."

pip install zensical
zensical build --clean

echo "Build Complete"
