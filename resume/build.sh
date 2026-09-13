#!/usr/bin/env bash
# Builds both resume variants and refreshes the site copy (research variant, linked from site/index.html).
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p out
typst compile --input variant=research resume.typ out/zerui-chen-research.pdf
typst compile --input variant=quant    resume.typ out/zerui-chen-quant.pdf
cp out/zerui-chen-research.pdf ../site/assets/resume.pdf
echo "built out/zerui-chen-research.pdf, out/zerui-chen-quant.pdf, site/assets/resume.pdf updated"
