# Repairable npm ERESOLVE fixture

This fixture intentionally fails dependency installation. It pins
`react@18.2.0` with `react-dom@19.0.0`; React DOM 19 requires React 19 as its
peer dependency, so npm must report an `ERESOLVE` peer-dependency conflict.

## Manual end-to-end test

1. Run the **Repairable npm ERESOLVE fixture** workflow on
   `test/mcp-repair-eresolve`. The **Install repairable ERESOLVE fixture
   dependencies** step must fail with `npm error code ERESOLVE`.
2. Submit the failed run to GitHub Actions Failure Analyzer v0.8.0 through the
   MCP tools and obtain package metadata and source context as needed.
3. Confirm that aligning the two packages to a compatible major version is the
   minimal repair. For example, either use `react@19.0.0` with
   `react-dom@19.0.0`, or use `react@18.2.0` with `react-dom@18.2.0`.
4. Do not use `--force`, `--legacy-peer-deps`, or disable dependency
   validation. Apply a version-alignment repair only after explicit approval.
