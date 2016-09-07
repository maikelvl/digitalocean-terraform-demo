FROM alpine:3.4

MAINTAINER Maikel Vlasman <open-source@userex.nl>

RUN apk --no-cache add \
        curl

ENV TERRAFORM_VERSION="0.7.3"
RUN latest="$(curl --silent --url https://github.com/hashicorp/terraform/releases/latest | sed -rn 's/.*tag\/v([^\"]*).*/\1/p')" \
 && echo "TERRAFORM_VERSION: $TERRAFORM_VERSION" \
 && echo "LATEST: $latest" \
 && cd /tmp \
 && curl \
        --location \
        --url https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
        --output terraform.zip \
 && unzip terraform.zip \
 && mv terraform /usr/bin/ \
 && rm -rf /tmp/* \
 && ( [ $(stat -c %s /usr/bin/terraform) -gt 500 ] || exit 1 )

WORKDIR /project

ENTRYPOINT ["/usr/bin/terraform"]
