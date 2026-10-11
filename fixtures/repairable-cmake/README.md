# Repairable CMake fixture

This fixture intentionally fails CMake configuration because `CMakeLists.txt`
sets `CMAKE_PREFIX_PATH` to `cmake/package`, while the existing local
`ManualTitle` package configuration is at `cmake/packages/ManualTitle`.

## Manual end-to-end test

1. Run the **Repairable CMake fixture** workflow on `test/mcp-repair-cmake`.
   The **Configure repairable CMake fixture** step must fail because CMake
   cannot find the `ManualTitle` package configuration.
2. Submit the failed run to GitHub Actions Failure Analyzer v0.8.0 through the
   MCP tools and obtain source context as needed.
3. Confirm the minimal repair corrects CMake package discovery so that
   `find_package(ManualTitle CONFIG REQUIRED)` can locate the package in
   `fixtures/repairable-cmake/cmake/packages/ManualTitle/ManualTitleConfig.cmake`.
   Do not remove `find_package`, disable the required check, or create a fake
   dependency.
4. Apply the package-discovery correction only after explicit approval, then
   rerun `cmake -S fixtures/repairable-cmake -B build/repairable-cmake`.
