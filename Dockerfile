# aws-cli - Dockerfile
# https://github.com/ArtiomL/aws-cli
# Artiom Lichtenstein
# v2.0.1, 07/06/2022

FROM amazonlinux:2 as installer
ARG EXE_FILENAME=awscli-exe-linux-x86_64.zip
RUN curl "https://awscli.amazonaws.com/$EXE_FILENAME" -o "$EXE_FILENAME"
RUN yum update -y && \
    yum install -y unzip && \
    unzip $EXE_FILENAME && \
    ./aws/install --bin-dir /aws-cli-bin/


FROM amazonlinux:2

# Core dependencies
RUN yum update -y && \
    yum install -y git groff jq less python3 vim && \
    yum clean all

# aws-cli
COPY --from=installer /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=installer /aws-cli-bin/ /usr/local/bin/
COPY / /opt/cli/
WORKDIR /opt/cli/

# System account and permissions
RUN adduser -u 1001 user
COPY .creds /home/user/
RUN chown -RL user: /opt/cli/ /home/user/
RUN chmod +x scripts/start.sh

# Environment variables
ENV PATH="/opt/cli:${PATH}"

# UID to use when running the image and for CMD
USER 1001

# Run
CMD ["scripts/start.sh"]

LABEL maintainer="Artiom Lichtenstein" version="2.0.1"
