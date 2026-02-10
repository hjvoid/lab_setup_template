FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    iputils-ping \
    python3 \
    python3-venv \
    python3-pip \
    curl \
    dnsutils \
    netcat-openbsd \
    git \
    ca-certificates \
    build-essential \
    libffi-dev \
    libssl-dev \
    vim-common \
    vim-runtime \
    vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


WORKDIR /root
CMD ["bash"]
