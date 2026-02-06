# Team Man City - Claude Code Agent Squad

<div align="center">

<img src="images/mancity-logo.svg" width="120" alt="Manchester City Logo">

### BMAD + SDD Methodology Agent Team

**Manchester City 2024-25 Squad** 테마의 Claude Code 에이전트 팀

*"Together we are stronger"*

</div>

---

## Overview

맨체스터 시티 선수들의 페르소나를 입힌 **8명의 Claude Code 에이전트 팀**입니다.

BMAD(Build, Measure, Analyze, Deploy) 방법론과 SDD(Spec-Driven Development) 워크플로우를 기반으로, 각 에이전트가 실제 맨시티 선수처럼 역할을 수행합니다.

유교적 상하관계(나이 기반 존댓말/반말)가 반영되어 있어, 에이전트 간 자연스러운 커뮤니케이션이 이루어집니다.

## The Squad

<table>
<tr>
<td align="center" width="25%">
<img src="images/debruyne.jpg" width="150" height="180" alt="Kevin De Bruyne"><br>
<b>Kevin De Bruyne</b><br>
<sub>Team Lead / Chief Engineer</sub><br>
<sub>35세 | #17 | opus</sub><br>
<a href="agents/team-lead.md">team-lead.md</a>
</td>
<td align="center" width="25%">
<img src="images/walker.jpg" width="150" height="180" alt="Kyle Walker"><br>
<b>Kyle Walker</b><br>
<sub>PM / Analyst</sub><br>
<sub>36세 | #2 | opus</sub><br>
<a href="agents/pm-analyst.md">pm-analyst.md</a>
</td>
<td align="center" width="25%">
<img src="images/bernardo.jpg" width="150" height="180" alt="Bernardo Silva"><br>
<b>Bernardo Silva (C)</b><br>
<sub>Principal Architect</sub><br>
<sub>32세 | #20 | opus</sub><br>
<a href="agents/architect.md">architect.md</a>
</td>
<td align="center" width="25%">
<img src="images/rodri.jpg" width="150" height="180" alt="Rodri"><br>
<b>Rodri</b><br>
<sub>Code Reviewer / Principal Engineer</sub><br>
<sub>30세 | #16 | opus</sub><br>
<a href="agents/code-reviewer.md">code-reviewer.md</a>
</td>
</tr>
<tr>
<td align="center" width="25%">
<img src="images/ederson.jpg" width="150" height="180" alt="Ederson"><br>
<b>Ederson</b><br>
<sub>Security Reviewer</sub><br>
<sub>33세 | #31 | opus</sub><br>
<a href="agents/security-reviewer.md">security-reviewer.md</a>
</td>
<td align="center" width="25%">
<img src="images/stones.jpg" width="150" height="180" alt="John Stones"><br>
<b>John Stones</b><br>
<sub>QA Engineer</sub><br>
<sub>32세 | #5 | sonnet</sub><br>
<a href="agents/qa-engineer.md">qa-engineer.md</a>
</td>
<td align="center" width="25%">
<img src="images/haaland.jpg" width="150" height="180" alt="Erling Haaland"><br>
<b>Erling Haaland</b><br>
<sub>Backend Developer</sub><br>
<sub>26세 | #9 | sonnet</sub><br>
<a href="agents/backend-developer.md">backend-developer.md</a>
</td>
<td align="center" width="25%">
<img src="images/foden.jpeg" width="150" height="180" alt="Phil Foden"><br>
<b>Phil Foden</b><br>
<sub>Frontend Developer</sub><br>
<sub>26세 | #47 | sonnet</sub><br>
<a href="agents/frontend-developer.md">frontend-developer.md</a>
</td>
</tr>
</table>

## SDD Workflow

```
Phase 1: Planning
  Walker(PM) --> Bernardo(Architect) --> De Bruyne(Approval)
      |              |                      |
   PRD 작성      아키텍처 설계         Spec/Design Gate

Phase 2: Development (Parallel)
  Haaland(Backend) <-----> Foden(Frontend)
      |                        |
   API/DB 구현            UI/UX 구현

Phase 3: Verification
  Stones(QA) --> Rodri(Review) --> Ederson(Security)
      |              |                  |
   테스트 작성     코드 리뷰         보안 검토
```

## Hierarchy (Age-based)

에이전트 간 커뮤니케이션은 **나이 기반 유교적 상하관계**를 따릅니다:

| 순위 | 선수 | 나이 | 직급 | 말투 |
|:---:|------|:---:|------|------|
| 1 | Kyle Walker | 36 | Senior PM | 팀 최고참, 모두에게 반말 |
| 2 | Kevin De Bruyne | 35 | Chief Engineer | Walker에게만 형 대우, 나머지 반말 |
| 3 | Ederson | 33 | Senior Security | 후배들에게 반말 |
| 4 | Bernardo Silva | 32 | Principal Architect | 캡틴, 후배들에게 반말 |
| 4 | John Stones | 32 | Senior QA | 동갑 Bernardo와 편한 관계 |
| 6 | Rodri | 30 | Principal Engineer | 형들에게 존댓말, 막내들에게 반말 |
| 7 | Erling Haaland | 26 | Senior Developer | 막내, 형들에게 존댓말 |
| 7 | Phil Foden | 26 | Senior Developer | 막내, 형들에게 존댓말 |

## Installation

`~/.claude/agents/` 디렉토리에 에이전트 파일을 복사하면 Claude Code에서 바로 사용할 수 있습니다:

```bash
# 에이전트 파일 복사
cp agents/*.md ~/.claude/agents/
```

## Agent Details

| Agent File | Role | Model | Tools |
|-----------|------|-------|-------|
| `team-lead.md` | BMAD Master Orchestrator | opus | Read, Grep, Glob |
| `pm-analyst.md` | PM / Requirements Analyst | opus | Read, Grep, Glob |
| `architect.md` | System Architect | opus | Read, Grep, Glob, WebSearch |
| `backend-developer.md` | Python/FastAPI Backend | sonnet | Read, Write, Edit, Glob, Grep, Bash |
| `frontend-developer.md` | React/TypeScript Frontend | sonnet | Read, Write, Edit, Glob, Grep, Bash |
| `qa-engineer.md` | QA + TDD Guide | sonnet | Read, Write, Edit, Glob, Grep, Bash |
| `code-reviewer.md` | Code Quality Reviewer | opus | Read, Grep, Glob, Bash |
| `security-reviewer.md` | Security Analyst | opus | Read, Grep, Glob, Bash |

## Usage with Teams

Claude Code의 Team 기능과 함께 사용하면 에이전트들이 협업합니다:

```
1. TeamCreate로 팀 생성
2. TaskCreate로 작업 목록 생성
3. Task 도구로 각 에이전트를 팀원으로 spawn
4. SendMessage로 팀원 간 커뮤니케이션
```

## Image Credits

All player photos are from [Wikimedia Commons](https://commons.wikimedia.org/) and are used under Creative Commons licenses (CC BY-SA 3.0 / 4.0).

## License

MIT

---

<div align="center">

*Built with Claude Code*

**CITYZENS**

</div>
