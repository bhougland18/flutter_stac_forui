#!/usr/bin/env bash
set -euo pipefail

# Find flutter_tester in nix store
nix_tester=$(nix develop --command bash -c 'echo $NIX_FLUTTER_SDK/bin/cache/artifacts/engine/linux-x64/flutter_tester' | tail -n 1)
local_tester=".cache/flutter-tester-patched"

mkdir -p .cache
cp "$nix_tester" "$local_tester"
chmod +w "$local_tester"

# Use patchelf from the nix environment
nix develop --command bash -c "patchelf --set-interpreter \$(cat \$NIX_CC/nix-support/dynamic-linker) $local_tester"
chmod +x "$local_tester"

echo "Patched tester created at $local_tester"
