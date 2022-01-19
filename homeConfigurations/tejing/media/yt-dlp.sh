#! @bash@/bin/bash

set -e

cachedir="$HOME/.cache/yt-dlp.latest"

# if "$cachedir/version" is more than 60 minutes old (or doesnt exist)
if [ $(@coreutils@/bin/stat -c '%Y' "$cachedir/version" 2>/dev/null || echo 0) -lt $((EPOCHSECONDS + 60*60)) ]; then
    curversion="$(@coreutils@/bin/cat "$cachedir/version" 2>/dev/null || true)"
    newversion="$(@curl@/bin/curl -sSL https://pypi.org/rss/project/yt-dlp/releases.xml | @sfeed@/bin/sfeed | @coreutils@/bin/sort -rk1,1 | @coreutils@/bin/head -n 1 | @coreutils@/bin/cut -f2)"
    if [ "$newversion" != "$curversion" ]; then
        sha256="$(@curl@/bin/curl -sSL "https://pypi.org/pypi/yt-dlp/$newversion/json" | @jq@/bin/jq -r '.urls[] | select(.packagetype == "sdist") | .digests.sha256')"
        @nix@/bin/nix build --argstr version "$newversion" --argstr sha256 "$sha256" -o "$cachedir/package" --impure --expr '
{version, sha256}:
let
  inherit (builtins) getFlake split filter concatStringsSep fromJSON;
  pkgs = (getFlake("pkgs")).legacyPackages.x86_64-linux;
  lib = pkgs.lib;
  fixedversion = concatStringsSep "." (map (n: if fromJSON n < 10 then "0" + n else n) (filter (x: x!=[]) (split "\\." version)));
in
pkgs.yt-dlp.overrideAttrs (old: {
  name = concatStringsSep "-" (lib.init (filter (x: x!=[]) (split "-" old.name)) ++ [ fixedversion ]);
  version = fixedversion;
  src = old.src.override {inherit version sha256;};
})' 1>&2
        @coreutils@/bin/mkdir -p "$cachedir" 1>&2
        printf '%s\n' "$newversion" >"$cachedir/version"
    fi
fi

exec "$cachedir/package/bin/yt-dlp" "$@"
