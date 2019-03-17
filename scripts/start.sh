#!/bin/sh
# aws-cli - Docker Wrapper Script
# https://github.com/ArtiomL/aws-cli
# Artiom Lichtenstein
# v1.0.0, 17/03/2019

if [[ ! -z "$REPO" ]]; then
	git clone "https://github.com/$REPO.git"
	cd $(echo "$REPO" | cut -d"/" -f2)
fi

exec /bin/sh
