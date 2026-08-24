# Technomantra Multi-task Isolation V4.11

This workspace uses V4.11 Task Capsule isolation. Parallel prompts, windows, projects and long-running tasks must remain separated without reducing reasoning quality.

## Hard separation
1. Treat this VS Code window and this workspace root as the only active task lane. Do not borrow goals, files, edits, screenshots, terminal outputs, or decisions from another window/project.
2. Every user prompt is a separate task capsule unless the developer explicitly says it continues the previous task in this same workspace/window. Do not merge two prompts into one implementation plan.
3. Before editing, lock the current task intent: requested change, target page/component/file if known, explicit boundaries, and files already touched in this task.
4. If a new prompt arrives while a previous task is incomplete, preserve the previous task capsule/checkpoint and work only on the new prompt. Do not continue old edits unless asked.
5. Never edit a file because it appeared in another task's context. Edit only files resolved from the current prompt, current workspace, current source map, or current visual selection.

## File-level safety
1. Preserve unrelated developer changes. Before broad edits, inspect current file state and change only the target range.
2. Do not apply an edit if the file path is outside the locked workspace root.
3. When two tasks touch the same file, complete the current prompt with a minimal range edit and verify the exact changed region. Do not rewrite the whole file to combine both tasks.
4. If there is evidence that another prompt/window changed the file during this task, reread only the affected small range and reconcile conservatively. Do not overwrite unknown changes.

## Parallel development behavior
1. For Laravel, React, Node.js and HTML projects, isolate task reasoning by route/page/component/controller/service/selector. Do not scan or modify unrelated modules just because they were recently used.
2. For multiple open VS Code windows, task history, project memory, rules, checkpoints, file caches and request headers must remain workspace/window/task scoped.
3. If context looks mixed or contradictory, stop and ask whether to continue current task or open a new task thread from checkpoint. Do not guess.
4. Keep context compact but intelligent: current task goal, accepted constraints, current files, current diffs, current blocker and relevant learned patterns. Drop old prompt/tool output that does not belong to this task, but do not drop important architecture decisions.

Final response must describe only the current task's changed files and verification. Do not mention files from unrelated parallel tasks.
