FROM docker:dind

LABEL maintainer="Hexosse <hexosse@gmail.com>" \
    org.opencontainers.image.title="docker-suite dsuite/jenkins-docker image" \
    org.opencontainers.image.description="Jenkins docker in docker for dsuite/jenkins. For more info visit https://github.com/docker-suite/jenkins-setup" \
    org.opencontainers.image.authors="Hexosse <hexosse@gmail.com>" \
    org.opencontainers.image.vendor="docker-suite" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/docker-suite/jenkins-docker" \
    org.opencontainers.image.source="https://github.com/docker-suite/jenkins-docker" \
    org.opencontainers.image.documentation="https://github.com/docker-suite/jenkins-docker/blob/master/Readme.md"

# Github token
ARG GH_TOKEN

## Install alpine-base
RUN \
	# Print executed commands
	set -x \
    # Update repository indexes
    && apk update \
    # Download the install-base script and run it
    && apk add --no-cache curl \
    && curl -s -o /tmp/install-base.sh https://raw.githubusercontent.com/docker-suite/Install-Scripts/master/alpine-base/install-base.sh \
    && sh /tmp/install-base.sh \
	# Clear apk's cache
	&& apk-cleanup

## Copy root files to file system
COPY assets/rootfs /

# Make entrypoint script accessible and executable
RUN chmod 0755 /entrypoint.sh

## Entrypoint
ENTRYPOINT ["/entrypoint.sh"]