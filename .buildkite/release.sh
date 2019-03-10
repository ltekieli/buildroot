#!/bin/bash

set -euo pipefail

tag_name="$BUILDKITE_TAG"
token="$GITHUB_RELEASE_ACCESS_TOKEN"

github-release \
    "$tag_name" \
    output/images/arm-buildroot-linux-gnueabihf_sdk-buildroot.tar.gz \
    output/images/system.tar.gz \
    --github-repository "ltekieli/buildroot" \
    --github-access-token "$token"
