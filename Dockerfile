FROM alpine:3.9

LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"
ARG VERSION=v0.2.0

RUN apk add --upgrade --no-cache curl nano && \
	curl -Lo /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x /usr/bin/kubectl && \
    curl -L -o /usr/bin/rke  https://github.com/rancher/rke/releases/download/${VERSION}/rke_linux-amd64 && \
    chmod +x /usr/bin/rke

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["kubectl version --short=true --client=true && rke -v && /bin/sh"]