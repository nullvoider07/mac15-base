# Use Ubuntu 26.04 as the base image
FROM ubuntu:26.04

# 1. Install QEMU, UEFI (OVMF), and necessary tools
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    qemu-system-x86 \
    qemu-utils \
    ovmf \
    net-tools \
    novnc \
    wget \
    zip \
    python3-websockify \
    python3-numpy \
    strace \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 2. Setup Working Directory
WORKDIR /vm

# 3. Download OpenCore ISO
RUN wget "https://github.com/thenickdude/KVM-Opencore/releases/download/v21/OpenCore-v21.iso.gz" -O /vm/OpenCore.iso.gz \
    && gzip -d /vm/OpenCore.iso.gz

# 4. Download OVMF Firmware Files
RUN wget "https://raw.githubusercontent.com/kholia/OSX-KVM/master/OVMF_CODE_4M.fd" -O /vm/OVMF_CODE.fd && \
    wget "https://raw.githubusercontent.com/kholia/OSX-KVM/master/OVMF_VARS-1920x1080.fd" -O /vm/OVMF_VARS.fd

# 4. Copy Source QCOW2 Image (Read-Only Source)
COPY mac15-image/mac15.qcow2 /vm/source.qcow2

# 5. Copy the Entrypoint Script
COPY entrypoint.sh /scripts/entrypoint.sh
RUN chmod +x /scripts/entrypoint.sh

# 6. Expose Necessary Ports
EXPOSE 5900 4000 4444 2222 8006 9090

# 7. Define Entrypoint
ENTRYPOINT ["/scripts/entrypoint.sh"]