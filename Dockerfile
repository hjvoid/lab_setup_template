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

# Create a persistent venv inside the image
ENV VENV_PATH=/opt/lab-venv
RUN python3 -m venv ${VENV_PATH}
ENV PATH="${VENV_PATH}/bin:${PATH}"

# Install python deps into the venv
WORKDIR /root
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r /tmp/requirements.txt \
 && python3 -c "import scapy.all, impacket, pwn, boofuzz, mitmproxy" \
 && rm -f /tmp/requirements.txt


WORKDIR /root
CMD ["bash"]
