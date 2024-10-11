set -o nounset
set -o errexit

COMPILER=${1:-gcc}
BUILD_TYPE=${2:-Debug}

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
ROOT_DIR=${SCRIPT_DIR}/..
BIN_DIR=${ROOT_DIR}/out/${COMPILER}/${BUILD_TYPE}/cov
LCOVRC_FILE=${ROOT_DIR}/lcovrc
COV_FILE=${BIN_DIR}/lcov.info
COV_HTML_DIR=${ROOT_DIR}/out/lcov

log_and_run() {
  echo $*
  (exec $*)
}

log_and_run lcov --zerocounters -d ${BIN_DIR} --rc lcov_branch_coverage=1
log_and_run test/run-tests.py --bindir ${BIN_DIR}
log_and_run bin/wabt-unittests --bindir ${BIN_DIR}
log_and_run lcov -c -d ${BIN_DIR} -o ${COV_FILE} --rc lcov_branch_coverage=1
log_and_run genhtml --branch-coverage -o ${COV_HTML_DIR} ${COV_FILE}
