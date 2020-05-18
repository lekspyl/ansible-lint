FROM alpine:3.11

# Ansible is installed as a dep of linter
ARG ANSIBLE_VERSION=2.9.*
ARG ANSIBLE_LINT_VERSION=4.2.*

RUN apk add --update --no-cache \
        python3 \
    && apk add --no-cache --virtual .build-deps \
        gcc \
        libffi-dev \
        musl-dev \
        libressl-dev \
        python3-dev \
    && pip3 install --no-cache-dir \
        ansible==${ANSIBLE_VERSION} \
        ansible-lint==${ANSIBLE_LINT_VERSION} \
    && apk del .build-deps

ENTRYPOINT ["ansible-lint"]
