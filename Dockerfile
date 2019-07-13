FROM alpine:3.10

LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"

RUN apk add --upgrade --no-cache curl nano openssh-client && \
	curl -Lo /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x /usr/bin/kubectl && \
    curl -Lo /usr/bin/rke https://github.com/rancher/rke/releases/download/$(curl -s https://api.github.com/repos/rancher/rke/releases/latest | grep tag_name | cut -d'"' -f4)/rke_linux-amd64 && \
    chmod +x /usr/bin/rke

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["kubectl version --short=true --client=true && rke -v && /bin/sh"]
