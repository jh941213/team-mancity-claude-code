#!/bin/bash
# Team Man City - Claude Code Agent Squad Installer
# https://github.com/jh941213/team-mancity-claude-code

set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'
BOLD='\033[1m'

echo ""
echo -e "${CYAN}${BOLD}"
echo "  ⚽ Team Man City - Claude Code Agent Squad"
echo "  ===========================================${NC}"
echo ""

# 1. Claude Code 설치 확인
if ! command -v claude &> /dev/null; then
    echo -e "${RED}Claude Code가 설치되어 있지 않습니다.${NC}"
    echo "  npm install -g @anthropic-ai/claude-code"
    echo ""
    exit 1
fi
echo -e "${GREEN}[OK]${NC} Claude Code 감지됨"

# 2. ~/.claude 디렉토리 확인
CLAUDE_DIR="$HOME/.claude"
AGENTS_DIR="$CLAUDE_DIR/agents"
SETTINGS_FILE="$CLAUDE_DIR/settings.json"

mkdir -p "$AGENTS_DIR"
echo -e "${GREEN}[OK]${NC} 에이전트 디렉토리: $AGENTS_DIR"

# 3. 에이전트 파일 복사
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
AGENT_COUNT=0

for file in "$SCRIPT_DIR/agents/"*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        cp "$file" "$AGENTS_DIR/$filename"
        AGENT_COUNT=$((AGENT_COUNT + 1))
        echo -e "  ${CYAN}>>>${NC} $filename"
    fi
done
echo -e "${GREEN}[OK]${NC} 에이전트 ${AGENT_COUNT}명 배치 완료"

# 4. settings.json에 Agent Teams 실험 기능 활성화
if [ -f "$SETTINGS_FILE" ]; then
    # 기존 settings.json 백업
    cp "$SETTINGS_FILE" "$SETTINGS_FILE.bak"
    echo -e "${YELLOW}[INFO]${NC} 기존 settings.json 백업 → settings.json.bak"

    # jq 사용 가능하면 안전하게 머지
    if command -v jq &> /dev/null; then
        TEMP_FILE=$(mktemp)
        jq '.env = (.env // {}) | .env.CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS = "1" | .teammateMode = "in-process"' "$SETTINGS_FILE" > "$TEMP_FILE"
        mv "$TEMP_FILE" "$SETTINGS_FILE"
        echo -e "${GREEN}[OK]${NC} settings.json 업데이트 (jq)"
    else
        # jq 없으면 python으로 시도
        if command -v python3 &> /dev/null; then
            python3 -c "
import json, sys
with open('$SETTINGS_FILE', 'r') as f:
    data = json.load(f)
if 'env' not in data:
    data['env'] = {}
data['env']['CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS'] = '1'
data['teammateMode'] = 'in-process'
with open('$SETTINGS_FILE', 'w') as f:
    json.dump(data, f, indent=2, ensure_ascii=False)
"
            echo -e "${GREEN}[OK]${NC} settings.json 업데이트 (python3)"
        else
            echo -e "${YELLOW}[WARN]${NC} jq/python3 없음. settings.json 수동 설정 필요:"
            echo ""
            echo '  {
    "env": {
      "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
    },
    "teammateMode": "in-process"
  }'
            echo ""
        fi
    fi
else
    # settings.json이 없으면 새로 생성
    cat > "$SETTINGS_FILE" << 'SETTINGS_EOF'
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  },
  "teammateMode": "in-process"
}
SETTINGS_EOF
    echo -e "${GREEN}[OK]${NC} settings.json 생성 완료"
fi

# 5. 완료
echo ""
echo -e "${GREEN}${BOLD}  설치 완료!${NC}"
echo ""
echo -e "  ${BOLD}사용법:${NC}"
echo "  claude 실행 후 다음과 같이 에이전트를 호출하세요:"
echo ""
echo -e "  ${CYAN}\"team-lead 에이전트로 작업 계획 세워줘\"${NC}"
echo -e "  ${CYAN}\"architect 에이전트로 시스템 설계해줘\"${NC}"
echo -e "  ${CYAN}\"backend-developer로 API 구현해줘\"${NC}"
echo ""
echo -e "  ${BOLD}팀 모드:${NC}"
echo "  TeamCreate로 팀을 만들면 8명이 협업합니다."
echo ""
echo -e "  ${CYAN}${BOLD}CITYZENS!${NC} ⚽"
echo ""
