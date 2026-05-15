
set -euo pipefail

REPO_RAW_BASE="https://raw.githubusercontent.com/AZZ-vopp/test/main"

arch="$(uname -m)"
case "${arch}" in
  x86_64|amd64)
    bin_name="xrayrguard-linux-amd64"
    ;;
  aarch64|arm64)
    bin_name="xrayrguard-linux-arm64"
    ;;
  *)
    echo "Unsupported architecture: ${arch}" >&2
    exit 1
    ;;
esac

if ! curl -fsSL "${REPO_RAW_BASE}/${bin_name}" -o "./${bin_name}"; then
  echo "Failed to download ${bin_name} from GitHub" >&2
  exit 1
fi

chmod +x "./${bin_name}"
exec "./${bin_name}" "$@"
