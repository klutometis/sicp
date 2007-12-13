#!/usr/bin/env bash
declare -r PREAMBLE=preamble.scm
find . -mindepth 2 -name '*.scm' -type f -exec bash -c \
    "cat ${PREAMBLE} '{}' > '{}.tmp' && mv -v '{}.tmp' '{}'" \;
