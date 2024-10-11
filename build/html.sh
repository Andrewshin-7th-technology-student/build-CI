set -o nounset
set -o errexit

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
ROOT_DIR="$(dirname "${SCRIPT_DIR}")"
MAN_DIR="$ROOT_DIR/man"
DOC_DIR="$ROOT_DIR/docs/doc"

if ! which mandoc > /dev/null; then
  echo 'mandoc not found'
  exit
fi

set -x
for file in "$MAN_DIR"/*.1; do
  mandoc -T html -O man='%N.%S.html' "$file" > "$DOC_DIR/$(basename "$file").html"
done
set +x
