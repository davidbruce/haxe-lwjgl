#!/bin/bash

profiles=("lwjgl-natives-linux-amd64" "lwjgl-natives-linux-aarch64" "lwjgl-natives-macos-aarch64" "lwjgl-natives-windows-amd64")

for profile in ${profiles[@]}; do
    mvn dependency:copy-dependencies -DoutputDirectory=temp -P$profile
done

rm -rf src/lwjgl/_internal/jars

mkdir -p src/lwjgl/_internal/jars/common
mkdir -p src/lwjgl/_internal/jars/aarch64/macos
mkdir -p src/lwjgl/_internal/jars/x86-64/macos
mkdir -p src/lwjgl/_internal/jars/aarch64/linux
mkdir -p src/lwjgl/_internal/jars/x86-64/linux
mkdir -p src/lwjgl/_internal/jars/x86-64/windows
mkdir -p src/lwjgl/_internal/jars/aarch64/windows

mv temp/*macos-arm64*   src/lwjgl/_internal/jars/aarch64/macos
mv temp/*macos*         src/lwjgl/_internal/jars/x86-64/macos
mv temp/*linux-arm64*   src/lwjgl/_internal/jars/aarch64/linux
mv temp/*linux*         src/lwjgl/_internal/jars/x86-64/linux
mv temp/*windows-arm64* src/lwjgl/_internal/jars/x86-64/windows
mv temp/*windows*       src/lwjgl/_internal/jars/x86-64/windows
mv temp/*               src/lwjgl/_internal/jars/common

rmdir temp