# --- Stage 1: Build with Ansible ---
FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    ansible \
    sudo \
    curl \
    gnupg \
    && apt-get clean

# Copy Ansible code
COPY ansible /ansible
WORKDIR /ansible

# Run the playbook
RUN ansible-playbook playbook.yml

# --- Stage 2: Final runtime image ---
FROM ubuntu:22.04

# Copy only nodejs from the builder
COPY --from=builder /usr/bin/node /usr/bin/node
COPY --from=builder /usr/bin/npm /usr/bin/npm
COPY --from=builder /usr/lib/node_modules /usr/lib/node_modules

# (Optional) Set up symlinks for globally installed npm packages
ENV PATH="/usr/lib/node_modules/npm/bin:$PATH"

CMD ["node", "--version"]
