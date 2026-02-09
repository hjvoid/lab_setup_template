FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    iputils-ping \
    python3 \
    python3-pip \
    curl \
    dnsutils \
    netcat-openbsd \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root
CMD ["bash"]
