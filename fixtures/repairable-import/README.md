# Repairable import fixture

This fixture intentionally fails TypeScript type checking with `TS2307` because
`src/index.ts` imports `./formatters/manual-title`, while the existing local
module is located at `src/lib/manual-title.ts`.

## Manual end-to-end test

1. Run the **Repairable import fixture** workflow on `test/mcp-repair-ts2307`.
   The **Typecheck repairable import fixture** step must fail with `TS2307` for
   `fixtures/repairable-import/src/index.ts`.
2. Submit the failed run to GitHub Actions Failure Analyzer v0.8.0 through the
   MCP tools and obtain source context as needed.
3. Confirm the minimal repair is changing the relative import path to
   `./lib/manual-title`. Do not install a dependency, disable TypeScript
   checking, or create a replacement module at the incorrect path.
4. Apply the import-path correction only after explicit approval, then rerun
   `npm ci` and `npm run typecheck` in this directory.
