#!/usr/bin/env bash
# Builds the resume variants (research/quant × graduating 2027/2028) and refreshes the site copy (research 2027, linked from site/index.html).
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p out
typst compile --input variant=research resume.typ out/zerui-chen-research.pdf
typst compile --input variant=quant    resume.typ out/zerui-chen-quant.pdf
typst compile --input variant=research --input grad=2028 resume.typ out/zerui-chen-research-2028.pdf
typst compile --input variant=quant    --input grad=2028 resume.typ out/zerui-chen-quant-2028.pdf
cp out/zerui-chen-research.pdf ../site/assets/resume.pdf
echo "built out/zerui-chen-{research,quant}.pdf and out/zerui-chen-{research,quant}-2028.pdf, site/assets/resume.pdf updated"
