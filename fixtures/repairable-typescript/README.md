# Repairable TypeScript fixture

This fixture intentionally starts with TypeScript error `TS2322`: a string is
assigned to a `number` variable in `src/index.ts`.

## Manual end-to-end test

1. Commit and push the intentionally broken fixture to `test/mcp-repair`.
2. Run **Repairable TypeScript fixture** from GitHub Actions, or let its branch
   trigger run it. The **Typecheck repairable fixture** step must fail with
   `TS2322` for `fixtures/repairable-typescript/src/index.ts`.
3. Submit that failed run to GitHub Actions Failure Analyzer v0.7.1 through
   `analyze_github_actions_failure`; obtain extra source context with
   `get_github_actions_fix_context` when available.
4. Confirm the analyzer references this fixture and propose the minimal fix:
   change `"42"` to `42`. Apply it only after explicit user approval.
5. Run `npm ci`, `npm run typecheck`, and `npm run verify` in this directory.
   Commit and push the approved repair to `test/mcp-repair`; the workflow should
   then pass.

The `verify` script compiles this fixture and executes its generated JavaScript.
