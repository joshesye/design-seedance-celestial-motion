#!/bin/sh
set -eu

skill_root=${1:-"$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"}

require_text() {
  pattern=$1
  file=$2
  label=$3

  if ! rg -q -- "$pattern" "$skill_root/$file"; then
    echo "missing: $label ($file)" >&2
    exit 1
  fi
}

require_text '每个.*分镜.*可见.*人物.*动作|每段.*可见.*人物.*动作' SKILL.md 'visible character action in every populated segment'
require_text '衣摆.*呼吸.*不能|不能.*衣摆.*呼吸' SKILL.md 'costume motion does not replace character action'
require_text '肢体交流|身体朝向.*视线.*手势' SKILL.md 'body-language communication default'
require_text '近层.*远层|前景.*远景.*云' SKILL.md 'layered cloud parallax'
require_text '银河.*流动|星河.*流动' SKILL.md 'galaxy flow'
require_text '星星.*错峰.*闪烁|星光.*错峰.*闪烁' SKILL.md 'asynchronous star flicker'
require_text '树叶.*松针.*树梢|树叶.*树梢' SKILL.md 'foliage motion'
require_text '开始状态.*动作过程.*段尾状态' references/output-contract.md 'character action lifecycle in output contract'
require_text '人物关系动作|肢体交流' references/motion-archetypes.md 'relationship actions in motion archetypes'
require_text '抬手|点头|缓步|交谈姿态' references/example-cases.md 'visible actions in examples'

echo 'dynamic contract: PASS'
