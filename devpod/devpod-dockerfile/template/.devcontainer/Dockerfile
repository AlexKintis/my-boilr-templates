FROM {{ BaseImage }}

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    openssh-client \
    tar \
    && rm -rf /var/lib/apt/lists/*

# Download nvim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
RUN tar zxf nvim-linux-x86_64.tar.gz
RUN mv nvim-linux-x86_64 /opt/ 
RUN ln /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/

ARG DOTFILES_REPO

# Setup nvim
# NOTE: ssh-agent
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519
# ssh-add -l
RUN --mount=type=ssh \
  set -eux; \
  mkdir -p -m 0700 /root/.ssh; \
  ssh-keyscan -t rsa,ed25519 github.com >> /root/.ssh/known_hosts; \
  git clone $DOTFILES_REPO /root/.config/

# Setup nvim
# NOTE: ssh-agent
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519
# ssh-add -l
# RUN --mount=type=ssh \
#   set -eux; \
#   mkdir -p -m 0700 /root/.ssh; \
#   ssh-keyscan -t rsa,ed25519 github.com >> /root/.ssh/known_hosts; \
#   git clone git@github.com:AlexKintis/dotfiles.git /tmp/dotfiles
# 
# ARG CONTAINER_USER
# # NOTE: use the following in the devcontainer.json under the build 
# # "args": {
# #   "CONTAINER_USER": "root"
# # }
# 
# RUN useradd -ms /bin/bash $CONTAINER_USER && \
#     mkdir -p /home/$CONTAINER_USER/.config && \
#     mv /tmp/dotfiles /home/$CONTAINER_USER/.config && \
#     chown -R $CONTAINER_USER:$CONTAINER_USER /home/$CONTAINER_USER/.config
