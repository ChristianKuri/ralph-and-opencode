# Ralph Agent Instructions

## Overview

Ralph is an autonomous AI agent loop that runs OpenCode repeatedly until all PRD items are complete. Each iteration is a fresh OpenCode instance with clean context.

## Commands

```bash
# Run Ralph (from your project that has prd.json)
./ralph.sh [max_iterations]
```

## Key Files

- `ralph.sh` - The bash loop that spawns fresh OpenCode instances
- `prompt.md` - Instructions given to each OpenCode instance
- `prd.json.example` - Example PRD format

## Patterns

- Each iteration spawns a fresh OpenCode instance with clean context
- Memory persists via git history, `progress.txt`, and `prd.json`
- Stories should be small enough to complete in one context window
- Always update AGENTS.md with discovered patterns for future iterations
