#!/usr/bin/env bash
#
# Build LaTeX artifacts from src/tex/ using Tectonic.
# Output PDFs land at the repo root, overwriting any existing file.

set -euo pipefail

usage() {
    cat >&2 <<EOF
Usage: $(basename "$0") <target>

Build LaTeX artifacts with Tectonic. PDFs land at the repo root.

Targets:
  -all      Build raport.pdf, slides.pdf, and notes.pdf
  -raport   Build raport.pdf only
  -slides   Build slides.pdf only
  -notes    Build notes.pdf only
EOF
    exit 1
}

[[ $# -ne 1 ]] && usage

if ! command -v tectonic >/dev/null 2>&1; then
    echo "Tectonic not found. Install with one of:" >&2
    echo "  sudo apt install tectonic" >&2
    echo "  curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net | sh" >&2
    exit 1
fi

cd "$(dirname "$0")"

build_one() {
    local src="$1"
    local out="$2"
    tectonic "$src"
    mv -f "${src%.tex}.pdf" "../../$out"
    echo "Built: $(realpath "../../$out")"
}

case "$1" in
    -all)
        build_one raport.tex raport.pdf
        build_one slides.tex slides.pdf
        build_one notes.tex  notes.pdf
        ;;
    -raport) build_one raport.tex raport.pdf ;;
    -slides) build_one slides.tex slides.pdf ;;
    -notes)  build_one notes.tex  notes.pdf  ;;
    *)       usage ;;
esac
