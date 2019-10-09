# <img align="center" src="img/awslb.svg" width="150">&nbsp;&nbsp; aws-cli
[![Build Status](https://img.shields.io/travis/com/ArtiomL/aws-cli/develop.svg)](https://travis-ci.com/ArtiomL/aws-cli)
[![Releases](https://img.shields.io/github/release/ArtiomL/aws-cli.svg)](https://github.com/ArtiomL/aws-cli/releases)
[![Commits](https://img.shields.io/github/commits-since/ArtiomL/aws-cli/latest.svg?label=commits%20since)](https://github.com/ArtiomL/aws-cli/commits/master)
[![Maintenance](https://img.shields.io/maintenance/yes/2019.svg)](https://github.com/ArtiomL/aws-cli/graphs/code-frequency)
[![Issues](https://img.shields.io/github/issues/ArtiomL/aws-cli.svg)](https://github.com/ArtiomL/aws-cli/issues)
[![Docker Hub](https://img.shields.io/docker/pulls/artioml/aws-cli.svg)](https://hub.docker.com/r/artioml/aws-cli/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

&nbsp;&nbsp;

## Table of Contents
- [Description](#description)
- [Installation](#installation)
	- [Run](#run)
	- [Credentials](#credentials)
- [Extensibility](#extensibility)
- [Modules](#modules)
- [License](LICENSE)

&nbsp;&nbsp;

## Description

Essential Amazon Web Services container with CLI, interactive shell, Python SDK and extensible scripts.

&nbsp;&nbsp;

## Installation

### Run
```shell
# aws-cli/1.16.255
docker run -it artioml/aws-cli

```

### Credentials
The home directory used when running the image (`/home/user/`) has the following [structure](.creds).  
Either edit the `credentials` file for your environment, or mount a local directory with the same path structure:

```
docker run -it -v ~/:/home/user/ artioml/aws-cli
```

&nbsp;&nbsp;

## Extensibility
The container will dynamically pull down (and `cd` to) whatever GitHub repository is specified in the `REPO` environment variable. This enables Continuous Delivery of new content every time the container is started and that repository is updated. It also allows you to load and run your own custom environments.

```shell
-e "REPO=<GitHub_Username>/<Repo_Name>"
```
For [example](https://github.com/ArtiomL/aws-labs):
```shell
docker run -it -e "REPO=artioml/aws-labs" artioml/aws-cli
```

&nbsp;&nbsp;

