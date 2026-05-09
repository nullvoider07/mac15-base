#!/bin/bash
set -e

# --- Configuration ---
OPENCORE_ISO="/vm/OpenCore.iso"
SOURCE_IMG="/vm/source.qcow2"
EPISODE_DISK="/run/episode.qcow2"

# UEFI Firmware
OVMF_CODE="/vm/OVMF_CODE.fd"
OVMF_VARS_ORIG="/vm/OVMF_VARS.fd"
OVMF_VARS_RUN="/run/OVMF_VARS.fd"

# Apple OSK Key
OSK="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"

echo "--- macOS 15 Standard Boot ---"

# 1. Create Ephemeral Overlay (Reset State)
echo "Creating ephemeral overlay..."
qemu-img create -f qcow2 -b "$SOURCE_IMG" -F qcow2 "$EPISODE_DISK"

# 2. Prepare UEFI Variables
if [ ! -f "$OVMF_VARS_RUN" ]; then
    cp "$OVMF_VARS_ORIG" "$OVMF_VARS_RUN"
fi

# 3. Start Web Viewer
echo "Starting web viewer..."
websockify -D --web=/usr/share/novnc/ 8006 localhost:5900 &

# 4. Automated Boot Menu Interaction
cat <<EOF > /run/boot_robot.py
import socket, time
print("ROBOT: Looking for QEMU Monitor on port 4445...")
while True:
    try:
        s = socket.socket()
        s.connect(("127.0.0.1", 4445))
        print("ROBOT: Connected! Waiting 2 seconds for BIOS splash to clear...")
        time.sleep(2)

        # Spam Enter for 20 seconds to guarantee selection
        for i in range(8):
            print(f"ROBOT: Sending Boot Command {i+1}/1...")
            try:
                s.send(b"sendkey ret\n")
            except:
                pass
            time.sleep(0.5)
            
        print("ROBOT: Boot sequence finished. Closing.")
        s.close()
        break
    except ConnectionRefusedError:
        # QEMU not ready yet, keep waiting
        time.sleep(1)
    except Exception as e:
        print(f"ROBOT: Error {e}")
        time.sleep(1)
EOF

python3 /run/boot_robot.py &

echo "Booting macOS..."

exec qemu-system-x86_64 \
  -enable-kvm \
  -m 24G \
  -smp 4,cores=4,threads=1,sockets=1 \
  -machine q35,accel=kvm \
  -no-reboot \
  -boot menu=on,splash-time=0 \
  -cpu Skylake-Client-noTSX-IBRS,vendor=GenuineIntel,+invtsc,+pcid,+ssse3,+sse4.2,+popcnt,+avx,+avx2,+aes,+fma,+bmi1,+bmi2,+xsave,+xsaveopt,check \
  -smbios type=2 \
  -device isa-applesmc,osk="$OSK" \
  -drive if=pflash,format=raw,readonly=on,file="$OVMF_CODE" \
  -drive if=pflash,format=raw,file="$OVMF_VARS_RUN" \
  -vga vmware \
  -device ide-hd,bus=ide.0,drive=OpenCoreDisk,bootindex=0 \
  -drive id=OpenCoreDisk,if=none,format=raw,file="$OPENCORE_ISO" \
  -device virtio-blk-pci,drive=SystemDisk,bootindex=1,serial=bootdisk \
  -drive id=SystemDisk,if=none,format=qcow2,file="$EPISODE_DISK",cache=writeback,aio=threads \
  -netdev user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::4000-:4000 \
  -device vmxnet3,netdev=net0,id=net0,mac=52:54:00:c9:18:27 \
  -audiodev id=snd0,driver=none \
  -device ich9-intel-hda \
  -device hda-duplex,audiodev=snd0 \
  -vnc 0.0.0.0:0 \
  -device qemu-xhci,id=usb \
  -device usb-kbd,bus=usb.0 \
  -device usb-tablet,bus=usb.0 \
  -qmp tcp:0.0.0.0:4444,server,nowait \
  -monitor tcp:0.0.0.0:4445,server,nowait