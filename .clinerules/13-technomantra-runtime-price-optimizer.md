# Technomantra Runtime Intelligence + Price Optimizer V4.11.2

This workspace uses runtime intelligence to reduce token waste without reducing coding intelligence. Accuracy, current source truth and user instructions remain higher priority than saving calls.

## Context budget by mode
1. Eco target active context: 25K-30K tokens. Paid/manual target active context: 40K-48K tokens. Deep Build may exceed this only for real cross-file architecture work.
2. Before any large call, compact old tool output into: goal, accepted constraints, touched files, current diff/decision, blocker, next action, relevant learning pattern.
3. Do not send large unchanged files again. Use cached evidence, exact search results, symbols, route/component maps or a 50-150 line range.
4. After a successful edit, never include the full updated file in the next prompt. Send a bounded diff plus targeted verification only.

## Same-file and no-progress control
1. Same unchanged file full-read limit: Eco = 2, paid/manual = 3, Deep Build = 4 only when justified. After that, use search/range/hash evidence.
2. If two consecutive AI turns inspect the same file without a new edit, new error or new useful finding, switch strategy immediately.
3. If the same edit/search/tool call fails twice, do not retry blindly. Refresh the smallest current source range, change anchor/strategy, or ask one focused question.
4. If useful progress is zero after 6 normal turns or 10 Deep Build turns, create a checkpoint and ask whether to Continue from checkpoint or Open new thread.

## Smart retry classifier
1. Safe automatic retry: transient network timeout, stream idle, HTTP 408/429/500/502/503/504, Eco route cooled down, or temporary provider unavailable. Preserve checkpoint first.
2. No automatic retry: cost/task guard, paid exact model failure, context-too-large, repeated same-file loop, repeated edit miss, permission denied, missing dependency, syntax error caused by our edit, or destructive command risk. Stop with a checkpoint and next safe action.
3. Paid/manual model must remain exact. Never switch to another paid/free model. Eco may route through its configured pool only.

## Local work before model work
1. Prefer deterministic local project memory, code graph, hashes, changed-file list, route maps, import graph and Team Learning snippets before asking the model to rediscover.
2. Batch independent local inspections and summarize them once. Do not spend one model call per file when local search can collect the evidence.
3. Keep final responses short: changed files, verification, blocker if any, and one next action.

## Intelligence guard
Saving tokens must never mean guessing. If the current source is unknown, inspect the smallest needed range. If requirements are ambiguous after bounded inspection, ask one focused question.
