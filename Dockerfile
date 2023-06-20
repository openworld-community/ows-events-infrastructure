###
FROM python:3.8-slim-buster AS ansible

ENV DEBIAN_FRONTEND=noninteractive
ENV ANSIBLE_PRIVATE_KEY_FILE=~/.ssh/id_rsa

RUN apt-get update -y --no-install-recommends && \
    apt-get upgrade -y --no-install-recommends; \
    apt-get install -y openssh-client; \
    pip install --no-cache-dir --upgrade pip; \
    python3 -m pip install --no-cache-dir ansible; \
    rm -Rf /root/.cache/pip; \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/ansible

ENTRYPOINT ["ansible-playbook"]
