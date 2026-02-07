#!/usr/bin/env bash
#
# Marp Export Script - marp-cli wrapper for exporting Marp slides.
#
# Usage:
#   bash marp_export.sh <input.md> [--format pdf|html|pptx|png|images] [--output path] [--allow-local]
#
# Examples:
#   bash marp_export.sh slides.md --format pdf
#   bash marp_export.sh slides.md --format html --output preview.html
#   bash marp_export.sh slides.md --format images --output ./slides/
#   bash marp_export.sh slides.md --format png

set -euo pipefail

# Resolve script directory for theme-set path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="${SCRIPT_DIR}/../references/themes"

# Defaults
FORMAT="html"
OUTPUT=""
ALLOW_LOCAL=false
INPUT=""

usage() {
  cat <<'EOF'
Usage: bash marp_export.sh <input.md> [options]

Options:
  --format, -f    Output format: pdf, html, pptx, png, images (default: html)
  --output, -o    Output file path
  --allow-local   Allow local file access for images
  --help, -h      Show this help message
EOF
  exit 0
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --help|-h)
      usage
      ;;
    --format|-f)
      FORMAT="$2"
      shift 2
      ;;
    --output|-o)
      OUTPUT="$2"
      shift 2
      ;;
    --allow-local)
      ALLOW_LOCAL=true
      shift
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
  echo "Usage: bash marp_export.sh <input.md> [--format pdf|html|pptx|png|images]" >&2
  exit 1
fi

if [[ ! -f "$INPUT" ]]; then
  echo "Error: Input file not found: $INPUT" >&2
  exit 1
fi

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

# Build command
CMD=("${MARP_CMD[@]}" --html --theme-set "${THEME_DIR}")

case "$FORMAT" in
  html)
    ;;
  pdf)
    CMD+=(--pdf)
    ;;
  pptx)
    CMD+=(--pptx)
    ;;
  png)
    CMD+=(--image png)
    ;;
  images)
    CMD+=(--images png)
    ;;
  *)
    echo "Error: Unknown format: $FORMAT" >&2
    echo "Supported formats: pdf, html, pptx, png, images" >&2
    exit 1
    ;;
esac

if [[ "$ALLOW_LOCAL" == true ]]; then
  CMD+=(--allow-local-files)
fi

if [[ -n "$OUTPUT" ]]; then
  CMD+=(-o "$OUTPUT")
fi

CMD+=("$INPUT")

echo "Running: ${CMD[*]}"
"${CMD[@]}"
echo "Export completed successfully."
if [[ -n "$OUTPUT" ]]; then
  echo "Output: $OUTPUT"
fi
