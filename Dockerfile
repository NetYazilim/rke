FROM netyazilim/alpine-base:3.9

LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"
ARG RKE_VERSION=v0.2.0
ARG KCTL_VERSION=v1.14.0

VOLUME /rke
WORKDIR /rke

RUN apk add --upgrade --no-cache curl nano && \
    curl -L -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KCTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x /usr/bin/kubectl && \
    curl -L -o /usr/bin/rke  https://github.com/rancher/rke/releases/download/${RKE_VERSION}/rke_linux-amd64 && \
    chmod +x /usr/bin/rke

CMD ["/bin/sh"]