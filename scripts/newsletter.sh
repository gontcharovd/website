#!/usr/bin/env bash
# Create today's newsletter issue (content/newsletter/YYYYMMDD.md) and open it for writing.
# Usage: newsletter My Issue Title   (title optional; defaults to the archetype's "Title")
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

post_path="content/newsletter/$(date +%Y%m%d).md"
open() { exec nvim "$post_path" -c "Goyo" -c "Limelight" -c "set wrap"; }

if [ -f "$post_path" ]; then
    echo "Issue already exists: $post_path"
    open
fi

last="$(grep -h '^issueno:' content/newsletter/*.md | grep -o '[0-9]\+' | sort -n | tail -1)"
number="$(printf '%03d' $((10#${last:-0} + 1)))"

hugo new "$post_path"
sed -i "0,/^issueno:.*/s//issueno: \"${number}\"/" "$post_path"
if [ $# -gt 0 ]; then
    title="$(printf '%s' "$*" | sed 's/[\/&]/\\&/g; s/"/\\\\"/g')"
    sed -i "0,/^title:.*/s//title: \"${title}\"/" "$post_path"
fi

open
