#!/usr/bin/env bash

set -eaux

VAULT_LOCATION=${1:?Vault Location Required}
VAULT_SUBDIRECTORY="${VAULT_LOCATION}/${2:-/}"
COPY_LOCATION="${VAULT_LOCATION}/copy"

obsidian-export "${VAULT_LOCATION}" "${COPY_LOCATION}" --start-at "${VAULT_SUBDIRECTORY}"
