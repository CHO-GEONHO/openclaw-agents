# OpenClaw Multi-Agent System

AI 에이전트 4인 팀 기반 자율 협업 시스템.

## Architecture

```
Boss (사람)
  └── Commander (PM/조율) — Claude Sonnet
        ├── Dev (풀스택 개발) — Claude Sonnet
        ├── Researcher (리서치/분석) — Claude Sonnet
        └── Ops (인프라/모니터링) — Claude Haiku
```

## Communication
- **Slack** — 에이전트 간 @멘션 기반 Mesh 통신
- 각 에이전트가 별도 Slack 앱 → 독립 이벤트 수신
- 스레드 = 공유 컨텍스트

## Directory Structure
```
openclaw/
├── agents/
│   ├── commander/    SOUL.md, AGENTS.md, USER.md, memory/
│   ├── dev/          SOUL.md, AGENTS.md, USER.md, knowledge/, memory/
│   ├── researcher/   SOUL.md, AGENTS.md, USER.md, knowledge/, memory/
│   └── ops/          SOUL.md, AGENTS.md, USER.md, memory/
├── shared/
│   ├── context/      에이전트 간 공유 컨텍스트
│   └── monitoring/   비용/상태 모니터링
├── tools/            스크립트, 유틸리티
├── docs/             아키텍처 문서
└── logs/
```

## Autonomy Matrix
- 🟢 자율: 코딩, 리서치, 헬스체크, PR 생성
- 🟡 알림 후 실행: 아키텍처 결정, 새 도구 도입, PR 머지
- 🔴 Boss 승인: DB 변경, 프로덕션 배포, 외부 발송, 비용 결제

## Tech
- Runtime: [OpenClaw](https://openclaw.ai)
- Model: Claude Sonnet 4.5 (primary) + Claude Haiku 3.5 (lightweight)
- Channel: Slack (Socket Mode)
- Infra: Mac Mini M4 / External SSD 2TB / Tailscale VPN
