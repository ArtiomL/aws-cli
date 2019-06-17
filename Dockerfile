# aws-cli - Dockerfile
# https://github.com/ArtiomL/aws-cli
# Artiom Lichtenstein
# v1.0.2, 17/06/2019

FROM alpine

LABEL maintainer="Artiom Lichtenstein" version="1.0.2"

# Core dependencies
RUN apk add --update --no-cache bash curl git groff jq less python3 && \
	pip3 install --no-cache-dir --upgrade pip && \
	pip3 install --no-cache-dir awscli aws-shell boto3 && \
	pip3 uninstall -y pip setuptools && \
	rm -rf /var/cache/apk/*

# aws-cli
COPY / /opt/cli/
WORKDIR /opt/cli/

# System account and permissions
RUN adduser -u 1001 -D user
COPY .creds /home/user/
RUN chown -RL user: /opt/cli/ /home/user/
RUN chmod +x scripts/start.sh

# Environment variables
ENV PATH="/opt/cli:${PATH}"

# UID to use when running the image and for CMD
USER 1001

# Run
CMD ["scripts/start.sh"]
