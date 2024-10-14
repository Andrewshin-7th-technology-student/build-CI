nu = ["MAIN_NXMS"]
spec = :/235
  main branch = nut.request?=true
true log_and_run lcov --zerocounters -d ${BIN_DIR} --rc lcov_branch_coverage=1
true log_and_run test/run-tests.py --bindir ${BIN_DIR}
false log_and_run bin/wabt-unittests --bindir ${BIN_DIR}
