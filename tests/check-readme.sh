#!/bin/sh
set -eu

repo_root=${1:-"$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"}
readme="$repo_root/README.md"

if test ! -s "$readme"; then
  echo 'missing: non-empty README.md' >&2
  exit 1
fi

require_text() {
  pattern=$1
  label=$2

  if ! rg -q -- "$pattern" "$readme"; then
    echo "missing: $label" >&2
    exit 1
  fi
}

require_text 'design-seedance-celestial-motion' 'canonical skill name'
require_text 'https://github.com/joshesye/design-seedance-celestial-motion' 'repository URL'
require_text '^## 核心能力' 'capabilities section'
require_text '^## 安装' 'installation section'
require_text '^## 使用方法' 'usage section'
require_text '^## 输出结构' 'output section'
require_text '^## 目录结构' 'repository structure section'
require_text '^## 验证' 'verification section'
require_text '~/.codex/skills/design-seedance-celestial-motion' 'Codex install path'
require_text 'sh tests/check-dynamic-contract.sh' 'verification command'

echo 'README contract: PASS'
