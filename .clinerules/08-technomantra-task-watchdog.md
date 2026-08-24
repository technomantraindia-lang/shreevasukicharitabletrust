# Technomantra Task Watchdog V4.11

This rule prevents stuck tasks, repeated-file loops, and unsafe blind retries.

## Idle / stopped work
1. If the model/tool stream is silent or appears stalled for about 60 seconds, treat it as a watchdog warning, not a reason to repeat the same action blindly.
2. If the same request is still stuck around 120 seconds and no edit/tool action is currently in progress, create a compact checkpoint: original user request, completed work, files changed, current blocker, next safest action.
3. For Eco only, a transient timeout, 429, 502/503/504, or provider unavailable response may be retried through Eco routing once the checkpoint is preserved.
4. For paid/manual selected models, do not silently switch models. If the selected model fails, stop cleanly and ask the developer to retry, choose another model, or continue from a new checkpoint.

## No-progress loop protection
1. Do not read the same unchanged file more than twice in Eco mode or three times in paid mode. Use cached content, exact search, or a small line range.
2. Do not repeat the same failed edit/search/tool call more than once. Refresh the smallest target range and change strategy.
3. After two edit misses on one file/target, stop broad retries and explain the exact blocker with one focused next action.
4. After a successful edit, verify only the affected selector/function/route/range. Never resend a whole large file only to confirm success.

## Checkpoint decision
When a task cannot safely continue, ask the developer with two clear choices: Continue from checkpoint, or Open a new thread with the checkpoint summary.
