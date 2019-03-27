#!/bin/sh
# aws-cli - Run Tests
# https://github.com/ArtiomL/aws-cli
# Artiom Lichtenstein
# v1.0.1, 27/03/2019

set -xeo pipefail

REPO="artioml/aws-cli"

# aws-cli
str_TEST="aws --version"

if [ "$TRAVIS" == "true" ]; then
	docker run $REPO /bin/sh -c "set -xeo pipefail; $str_TEST"
else
	eval "$str_TEST"
fi
