# Bash - Download Private GitHub Repo Release Assets

*Script: [gh-dl-release.sh](https://gist.githubusercontent.com/jimbrig/03aa65c9b20dc3ad86bbb442f723672a/raw/6020fd8ddef25b3ed0809c69e6342b769b3c35b5/gh-dl-release)*

````bash
#!/usr/bin/env bash
#
# gh-dl-release
# 
# This script downloads an asset from latest or specific Github release of a
# private repo. Feel free to extract more of the variables into command line
# parameters.
#
# PREREQUISITES
#
# curl, wget, jq
#
# USAGE
#
# Set all the variables inside the script, make sure you chmod +x it, then
# to download specific version to my_app.tar.gz:
#
#     gh-dl-release 2.1.1 my_app.tar.gz
#
# to download latest version:
#
#     gh-dl-release latest latest.tar.gz
#
# If your version/tag doesn't match, the script will exit with error.

TOKEN="%3Cgithub_access_token%3E"
REPO="<user_or_org>/<repo_name>"
FILE="<name_of_asset_file>"      # the name of your release asset file, e.g. build.tar.gz
VERSION=$1                       # tag name or the word "latest"
GITHUB="https://api.github.com"

alias errcho='>&2 echo'

function gh_curl() {
  curl -H "Authorization: token $TOKEN" \
       -H "Accept: application/vnd.github.v3.raw" \
       $@
}

if [ "$VERSION" = "latest" ]; then
  # Github should return the latest release first.
  parser=".[0].assets | map(select(.name == \"$FILE\"))[0].id"
else
  parser=". | map(select(.tag_name == \"$VERSION\"))[0].assets | map(select(.name == \"$FILE\"))[0].id"
fi;

asset_id=`gh_curl -s $GITHUB/repos/$REPO/releases | jq "$parser"`
if [ "$asset_id" = "null" ]; then
  errcho "ERROR: version not found $VERSION"
  exit 1
fi;

wget -q --auth-no-challenge --header='Accept:application/octet-stream' \
  https://$TOKEN:@api.github.com/repos/$REPO/releases/assets/$asset_id \
  -O $2
````

## Appendix: Links

* *Code*
* [Development](../../MOCs/Development.md)

See Also: [PowerShell - Get-GitHubRelease](../PowerShell/PowerShell%20-%20Get-GitHubRelease.md)

### Full Gist

````gist
03aa65c9b20dc3ad86bbb442f723672a
````

---

*Backlinks:*

````dataview
list from [[Bash - Download Private GitHub Repo Release Assets]] AND -"Changelog"
````
