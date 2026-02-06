#!/bin/bash
# Team Man City - Uninstaller

set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo -e "${YELLOW}Team Man City 에이전트를 제거합니다...${NC}"
echo ""

AGENTS_DIR="$HOME/.claude/agents"
AGENTS=(
    "team-lead.md"
    "pm-analyst.md"
    "architect.md"
    "backend-developer.md"
    "frontend-developer.md"
    "qa-engineer.md"
    "code-reviewer.md"
    "security-reviewer.md"
)

REMOVED=0
for agent in "${AGENTS[@]}"; do
    if [ -f "$AGENTS_DIR/$agent" ]; then
        rm "$AGENTS_DIR/$agent"
        echo -e "  ${RED}x${NC} $agent 제거됨"
        REMOVED=$((REMOVED + 1))
    fi
done

echo ""
if [ $REMOVED -gt 0 ]; then
    echo -e "${GREEN}${REMOVED}개 에이전트 제거 완료.${NC}"
else
    echo -e "${YELLOW}제거할 에이전트가 없습니다.${NC}"
fi

echo ""
echo -e "${YELLOW}[참고]${NC} settings.json의 Agent Teams 설정은 수동으로 제거하세요:"
echo "  $HOME/.claude/settings.json"
echo ""
