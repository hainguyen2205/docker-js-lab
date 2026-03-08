FROM node:24.14.0-alpine

RUN apk add --no-cache bash git curl

WORKDIR /workspace


# -------------------------------------------------------------------
# OPTIONAL: multi Node version support (enable when needed)
# -------------------------------------------------------------------
#
# ENV NVM_DIR=/root/.nvm
#
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
#
# SHELL ["/bin/bash", "-c"]
#
# RUN source $NVM_DIR/nvm.sh \
#     && nvm install 18 \
#     && nvm install 20 \
#     && nvm install 22 \
#     && nvm alias default 24
#
# ENV PATH=$NVM_DIR/versions/node/$(ls $NVM_DIR/versions/node | tail -n 1)/bin:$PATH
#
# -------------------------------------------------------------------