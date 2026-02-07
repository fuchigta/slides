#!/usr/bin/env bash
#
# Marp Preview Script - Generate PNG images for all slides.
#
# Usage:
#   bash marp_preview.sh <input.md> [--output-dir dir]
#
# Examples:
#   bash marp_preview.sh slides.md
#   bash marp_preview.sh slides.md --output-dir /tmp/preview
#
# Output:
#   Generates <basename>.001.png, <basename>.002.png, ... in the output directory.
#   Lists all generated PNG paths for use with the Read tool.

set -euo pipefail

# Resolve script directory for theme-set path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="${SCRIPT_DIR}/../references/themes"

# Defaults
OUTPUT_DIR=""
INPUT=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --output-dir)
      OUTPUT_DIR="$2"
      shift 2
      ;;
    --help|-h)
      echo "Usage: bash marp_preview.sh <input.md> [--output-dir dir]"
      echo ""
      echo "Options:"
      echo "  --output-dir    Output directory (default: same as input file)"
      echo "  --help, -h      Show this help message"
      exit 0
      ;;
    -*)
      echo "Error: Unknown option: $1" >&2
      exit 1
      ;;
    *)
      if [[ -z "$INPUT" ]]; then
        INPUT="$1"
      else
        echo "Error: Unexpected argument: $1" >&2
        exit 1
      fi
      shift
      ;;
  esac
done

# Validate input
if [[ -z "$INPUT" ]]; then
  echo "Error: Input file is required." >&2
  echo "Usage: bash marp_preview.sh <input.md> [--output-dir dir]" >&2
  exit 1
fi

if [[ ! -f "$INPUT" ]]; then
  echo "Error: Input file not found: $INPUT" >&2
  exit 1
fi

# Determine output directory and base name
BASENAME="$(basename "$INPUT" .md)"

if [[ -z "$OUTPUT_DIR" ]]; then
  OUTPUT_DIR="$(cd "$(dirname "$INPUT")" && pwd)"
fi

mkdir -p "$OUTPUT_DIR"

OUTPUT_PATH="${OUTPUT_DIR}/${BASENAME}.png"

# Clean up previous preview files
for f in "${OUTPUT_DIR}/${BASENAME}".*.png; do
  [[ -f "$f" ]] && rm "$f"
done

# Detect marp-cli
if command -v marp &>/dev/null; then
  MARP_CMD=(marp)
elif command -v npx &>/dev/null; then
  MARP_CMD=(npx @marp-team/marp-cli)
else
  echo "Error: marp-cli is not installed." >&2
  echo "Install it with: npm install -g @marp-team/marp-cli" >&2
  exit 1
fi

# Run marp with --images png
CMD=("${MARP_CMD[@]}" --html --theme-set "${THEME_DIR}" --images png -o "$OUTPUT_PATH" "$INPUT")

echo "Running: ${CMD[*]}"
"${CMD[@]}"

# List generated PNG files
echo ""
echo "Generated preview images:"
for f in "${OUTPUT_DIR}/${BASENAME}".*.png; do
  if [[ -f "$f" ]]; then
    echo "  $f"
  fi
done
