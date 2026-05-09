# macOS 15.7.5

**AI Agent Development, Evaluation & Deployment Environment**  
**Version:** 1  
**Base System:** macOS Sequoia 15.7.5  
**Architecture:** x86_64  
**Last Updated:** May 2026  
**Developer:** Kartik (NullVoider)

---

## ⚖️ Legal Notice

**IMPORTANT - PLEASE READ CAREFULLY**

This container includes macOS, which is proprietary software owned by Apple Inc. By using this container, you acknowledge and agree to the following:

1. **Apple EULA Compliance**: You must comply with Apple's Software License Agreement for macOS. The developer of this container does not grant, and cannot grant, any rights to macOS itself.

2. **Licensing Separation**: 
   - The container infrastructure (Docker configuration, scripts, documentation) is licensed under GPL-3.0
   - macOS and Apple software remain under Apple's EULA
   - You must comply with BOTH licenses

3. **Commercial Use**: Commercial deployment of macOS may require additional licensing from Apple. You are responsible for ensuring compliance with Apple's terms.

4. **No Warranty**: This container is provided "as is" without any warranty. The developer is not affiliated with or endorsed by Apple Inc.

5. **User Responsibility**: You are solely responsible for ensuring your use of this container complies with all applicable licenses, laws, and regulations.

**By proceeding to use this container, you acknowledge that you have read, understood, and agree to comply with both the GPL-3.0 license (for container components) and Apple's EULA (for macOS).**

---

## Getting Started

### Clone the Repository

The QCOW2 disk image is hosted on HuggingFace due to its size. The setup scripts handle downloading it alongside the repository files automatically. It is recommended to use the below command to clone the repository.

**Linux / macOS:**
```bash
curl -fsSL https://raw.githubusercontent.com/nullvoider07/mac15-base/master/scripts/setup-mac15.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/nullvoider07/mac15-base/master/scripts/setup-mac15.ps1 | iex
```

The scripts will clone the repository, download the QCOW2 image from HuggingFace, and place all files in the correct locations automatically. Once complete, proceed to [Installation & Deployment](#installation--deployment).

---

## Table of Contents

1. [Overview](#overview)
2. [Key Features](#key-features)
3. [Container Capabilities](#container-capabilities)
   - [Operating System](#operating-system)
   - [Development Tools](#development-tools)
   - [Remote Access](#remote-access)
4. [Technical Specifications](#technical-specifications)
   - [System Requirements](#system-requirements)
   - [Container Resource Usage](#container-resource-usage)
   - [Performance Metrics](#performance-metrics)
5. [Installation & Deployment](#installation--deployment)
   - [Prerequisites](#prerequisites)
   - [Docker Compose Deployment](#docker-compose-deployment)
   - [Testing the Container](#testing-the-container)
6. [Customizing the Image](#customizing-the-image)
7. [Installed Software](#installed-software)
8. [Development Environments](#development-environments)
9. [The-Eye Integration](#the-eye-integration)
10. [Task Executor REST API](#task-executor-rest-api)
11. [Remote Access Methods](#remote-access-methods)
   - [NoMachine (Recommended)](#nomachine-recommended)
   - [VNC (Temporary Monitoring)](#vnc-temporary-monitoring)
   - [SSH Access](#ssh-access)
12. [Troubleshooting](#troubleshooting)
13. [CI/CD Integration](#cicd-integration)
14. [Reporting Issues](#reporting-issues)
15. [FAQ](#faq)
16. [License](#license)
17. [About This Project](#about-this-project)

---

## Overview

The **macOS 15.7.5 Container** is a complete macOS Sequoia environment designed for AI agent development, evaluation, testing, and deployment — including Computer Use Agents (CUA) and coding agents. It provides a full macOS desktop experience with pre-configured development tools, integrated monitoring capabilities, and a REST API task executor — all within a single Docker container.

**IMPORTANT LEGAL NOTICE**: This container includes macOS software. By using this container, you agree to comply with Apple's Software License Agreement (EULA) for macOS. The GPL-3.0 license applies to the container configuration, scripts, and custom components created by the developer, but does not and cannot apply to macOS itself or Apple's proprietary software. Users are responsible for ensuring their use complies with Apple's EULA.

### Purpose

This container is designed for:

- **Computer Use Agent Development**: Pre-configured environment for building and testing CUA applications
- **Coding Agent Evaluation**: Full OS environment for running coding agent benchmarks including SWE-bench Lite
- **AI Agent Development**: Pre-configured environment for building, testing, and deploying any AI agent
- **Task Execution via REST API**: Structured task submission, execution, and result retrieval over HTTP (port 9090)
- **macOS Development**: Native macOS environment for developing Mac-specific applications
- **Automated Testing**: Consistent, reproducible macOS environment for CI/CD pipelines
- **Remote Development**: Full-featured macOS desktop accessible via NoMachine and VNC
- **Multi-Language Development**: Support for 10+ programming languages out of the box
- **Visual Monitoring**: Integrated Eye tool for screen capture and agent training data collection

### What Makes This Unique

- **Single Container Design**: Complete macOS 15.7.5 system with no external file dependencies
- **Ephemeral State**: Everything is isolated inside the container, providing clean state management
- **4TB Virtual Disk**: Massive storage capacity for development projects
- **RAM**: Customizable memory allocation (minimum 4 GB for smooth operation)
- **Optimized Performance**: Significantly smoother than Dockur and Docker-OSX alternatives
- **Fully Customizable**: Configuration can be modified to improve performance based on hardware
- **Zero External Files**: Unlike Dockur and Docker-OSX, everything is self-contained
- **Developer-Ready**: Pre-installed IDEs, tools, and language runtimes

**Note**: The virtual storage does not mandate requirement of exactly 4TB of storage in the device running the container. The virtual disk is a growable disk, and 4TB is the cap on the virtual disk.  

---

## Key Features

### Operating System
✅ **macOS Sequoia 15.7.5** - Latest macOS release  
✅ **Virtual Disk** - Massive 4TB virtual storage  
✅ **RAM** - Customizable memory allocation (minimum 4 GB for smooth operation)  
✅ **Intel i3 CPU Configuration** - Optimized for stability and compatibility  
✅ **Ephemeral State** - Clean isolation with no external dependencies

### Development Tools
✅ **10+ Languages** - Python, Go, Rust, Java, C#, C++, Node.js, TypeScript, Kotlin, Scala  
✅ **VS Code** - Pre-installed with essential extensions  
✅ **Xcode Tools** - Command line tools for macOS development  
✅ **Homebrew** - Package manager for macOS  
✅ **Git & Git LFS** - Version control with large file support  
✅ **Terminal Tools** - Modern shell utilities and productivity tools

### Applications
✅ **Brave Browser** - Privacy-focused web browser  
✅ **VS Code** - Feature-rich code editor  
✅ **Terminal Apps** - zsh, tmux, and modern CLI tools

### Remote Access
✅ **NoMachine** - High-performance remote desktop (4000/TCP) - **Recommended**  
✅ **VNC** - Standard VNC access (5900/TCP) - For temporary monitoring only  
✅ **SSH** - Secure shell access (2222/TCP)  
✅ **Eye Server** - Screen capture endpoint (4444/TCP)  
✅ **Task Executor REST API** - Structured task execution for coding agents (9090/TCP)

### Performance & Stability
✅ **Fast Boot Time** - Container ready in ~30 seconds  
✅ **Low CPU Usage** - 20-30% under normal workload  
✅ **Smooth Performance** - Optimized for regular development tasks  
✅ **Single Container** - No external files or dependencies  
✅ **KVM Acceleration** - Hardware virtualization for optimal performance

---

## Container Capabilities

### Operating System

**macOS Sequoia 15.7.5**
- Complete macOS desktop experience
- Native macOS applications support
- Standard macOS file system and permissions
- macOS security features
- Native macOS APIs and frameworks

**Storage Configuration**:
- **Virtual Disk**: 4TB capacity
- **Format**: APFS (Apple File System)
- **RAM**: Fully customizable (minimum 4 GB for smooth operation)
- **CPU**: Intel i3 configuration (optimized for compatibility)

**Pre-installed Applications**:
- **Browser**: Brave
- **Editor**: Visual Studio Code
- **Terminal**: Built-in Terminal app with modern shell tools
- **File Manager**: Finder
- **System Utilities**: Standard macOS utilities

### Development Tools

#### Programming Languages & Runtimes

| Language | Version | Package Manager | Notes |
|----------|---------|----------------|-------|
| **Python** | 3.14.4 | pip 26.1 | Default `python` command |
| **Go** | 1.26.2 | go modules | Full Go development environment |
| **Rust** | stable | cargo | System-wide installation |
| **Node.js** | 25.9.0 | npm 11.12.1 | TypeScript & tsx included |
| **Java** | 25 (latest) | - | Oracle JDK |
| **C#/.NET** | 10.0 SDK | dotnet | LTS version |
| **C/C++** | clang/gcc | - | Xcode command line tools |
| **Kotlin** | 2.3.0 | - | Compiler installed |
| **Scala** | 3.8.3 | coursier | Latest stable |
| **PowerShell** | latest | - | Cross-platform shell |

#### IDEs & Editors

**Visual Studio Code** (latest)

Pre-installed extensions:
- C++ Tools Extension Pack
- Docker Extension
- Java Extension Pack
- Oracle Java Extension
- .NET Runtime & C# DevKit
- GitLab Workflow & GitLens
- Go Extension
- Python Extension Pack (Pylance, debugpy, environment manager)
- Rust Analyzer
- Scala Language Server

#### Build Tools & Utilities

- **Homebrew** - macOS package manager
- **Git** (latest) - Version control with LFS support
- **Xcode Command Line Tools** - Essential development tools
- **CMake** - Cross-platform build system
- **GDB** / **LLDB** - Debuggers

### Remote Access

#### NoMachine (Port 4000) - **Recommended**

**Why NoMachine?**
- **Best Performance**: Optimized for macOS with hardware acceleration
- **Low Latency**: Minimal input lag for smooth development experience
- **High Quality**: Superior video quality with efficient compression
- **Full Features**: Clipboard sharing, file transfer, audio support

**Configuration**:
- Port: 4000 (TCP)
- Default remote access method
- Pre-configured for optimal performance
- Clipboard sharing enabled
- Audio support enabled

**Use Cases**:
- Primary development interface
- Extended coding sessions
- Full desktop interaction
- Multi-window workflows

#### VNC (Port 5900) - **For Temporary Monitoring Only**

**Configuration**:
- Port: 5900 (TCP)
- Standard VNC protocol
- Compatible with any VNC client

**Important Notes**:
- VNC performance is significantly lower than NoMachine
- Recommended only for temporary monitoring or quick checks
- Not suitable for extended development sessions
- Use NoMachine for regular work

**Use Cases**:
- Quick status checks
- Emergency access when NoMachine is unavailable
- Automated monitoring scripts
- Screenshot capture

#### SSH (Port 2222)

**Configuration**:
- Port: 2222 (TCP)
- Secure shell access
- Terminal-based access to macOS

**Use Cases**:
- Command-line operations
- File transfers via SCP/SFTP
- Remote script execution
- System administration

---

## Technical Specifications

### System Requirements

#### Minimum Requirements

| Component | Requirement | Notes |
|-----------|-------------|-------|
| **RAM** | 6 GB | Absolute minimum for container operation |
| **Disk Space** | 100 GB free | For container image and virtual disk |
| **CPU** | 4 cores | x86_64 architecture with KVM support |
| **Virtualization** | KVM enabled | Hardware virtualization must be enabled in BIOS |
| **Host OS** | Linux | Ubuntu 20.04+, Debian 11+, or similar |
| **Docker** | 24.0+ | Recent Docker version required |
| **Kernel** | 6+ | For proper KVM support |

#### Recommended Requirements

| Component | Recommendation | Benefit |
|-----------|---------------|---------|
| **RAM** | 8 GB | Better performance and headroom |
| **Disk Space** | 150 GB free | Ample space for projects and data |
| **CPU** | 4+ cores | Improved responsiveness |
| **Storage Type** | SSD/NVMe | Faster disk I/O operations |
| **Network** | 100 Mbps+ | Better remote access experience |

### Container Resource Usage

**Runtime Allocations**:
- **Virtual RAM**: Fully customizable (minimum 4 GB for smooth operation)
- **Virtual Disk**: 4 TB (APFS filesystem)
- **Virtual CPU**: Intel i3 configuration
- **Network**: Bridged networking with port forwarding

**Host Resource Impact**:
- **CPU Usage**: 20-30% under normal workload
- **Memory Overhead**: ~2-3 GB for container management
- **Disk I/O**: Moderate (depends on workload)
- **Network**: Minimal overhead

### Performance Metrics

**Boot Performance**:
- **macOS Boot**: ~30 seconds
- **Container Start**: Immediate
- **Desktop Ready**: Immediate after boot completion

**Runtime Performance**:
- **Idle CPU**: 5-10%
- **Normal Workload CPU**: 20-30%
- **Memory Usage**: Stable at allocated 8GB
- **Disk Performance**: Depends on host storage type

**Comparison to Alternatives**:
- **vs. Dockur**: Significantly smoother performance
- **vs. Docker-OSX**: Better responsiveness and stability
- **External Files**: None required (vs. multiple external files in alternatives)
- **Customization**: Fully customizable configuration
- **State Management**: Clean ephemeral state

**Optimization Notes**:
- Current configuration (Intel i3) is optimized for compatibility and stability
- Configuration is based on tested and confirmed safe settings
- Performance can be improved by adjusting CPU configuration to match host hardware
- Animations may cause slight performance impact with current CPU configuration
- Heavy animation applications may slow down during transitions
- Regular development workflows run smoothly without issues

---

## Installation & Deployment

### Prerequisites

#### 1. Install Docker

**For Ubuntu/Debian**:
```bash
# Update package index
sudo apt-get update

# Install dependencies
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Verify installation
docker --version
docker compose version
```

**For Other Linux Distributions**:
```bash
# Fedora/RHEL/CentOS
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Arch Linux
sudo pacman -S docker docker-compose
```

**Post-Installation Steps**:
```bash
# Add your user to docker group (to run docker without sudo)
sudo usermod -aG docker $USER

# Enable Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Log out and log back in for group changes to take effect
```

#### 2. Enable KVM

**Check KVM Support**:
```bash
# Check if KVM is supported
lscpu | grep Virtualization

# Check if KVM modules are loaded
lsmod | grep kvm

# Expected output:
# kvm_intel (for Intel CPUs) or kvm_amd (for AMD CPUs)
# kvm
```

**Enable KVM**:
```bash
# Install KVM packages (Ubuntu/Debian)
sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

# For Fedora/RHEL/CentOS
sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils

# Verify KVM is working
sudo kvm-ok

# Expected output:
# INFO: /dev/kvm exists
# KVM acceleration can be used
```

**Set KVM Permissions**:
```bash
# Add user to kvm group
sudo usermod -aG kvm $USER

# Verify /dev/kvm permissions
ls -l /dev/kvm

# Should show: crw-rw---- 1 root kvm

# Log out and log back in for group changes to take effect
```

**Verify KVM Access**:
```bash
# After logging back in, verify you can access KVM
groups | grep kvm

# Test KVM device access
test -r /dev/kvm && test -w /dev/kvm && echo "KVM is accessible" || echo "KVM access denied"
```

**If KVM is Not Enabled in BIOS**:
1. Restart your computer
2. Enter BIOS/UEFI settings (usually F2, F10, F12, or Del key during boot)
3. Look for virtualization settings:
   - Intel: "Intel VT-x" or "Intel Virtualization Technology"
   - AMD: "AMD-V" or "SVM Mode"
4. Enable the setting
5. Save and exit BIOS
6. Boot into Linux and verify with `kvm-ok`

### Docker Compose Deployment

**Recommended Deployment Method**: The **ONLY** recommended way to run this container is using Docker Compose. This ensures proper configuration and port mappings.

#### 1. Create Docker Compose File

Create a file named `deploy-macos.yaml`:

```yaml
services:
  mac-agent:
    image: nullvoider/mac15-base:v1
    container_name: mac_agent
    restart: unless-stopped
    tty: true
    stdin_open: true
    ports:
      - 4000:4000      # NoMachine (recommended remote access)
      - 4444:4445      # Eye server
      - 2222:2222      # SSH
      - 5900:5900      # VNC (temporary monitoring only)
      - 9090:9090      # Task Executor REST API
    environment:
      - API_TOKEN=your-secret-token
      - TASK_MAX_AGE=3600
    devices:
      - /dev/kvm:/dev/kvm
    cap_add:
      - NET_ADMIN
    extra_hosts:
      - "host.docker.internal:host-gateway"
```

#### 2. Deploy the Container

```bash
# Start the container
docker compose -f deploy-macos.yaml up -d

# View logs
docker compose -f deploy-macos.yaml logs -f

# Check container status
docker compose -f deploy-macos.yaml ps
```

#### 3. Container Management

```bash
# Stop the container
docker compose -f deploy-macos.yaml stop

# Start the container
docker compose -f deploy-macos.yaml start

# Restart the container
docker compose -f deploy-macos.yaml restart

# Remove the container
docker compose -f deploy-macos.yaml down

# Remove container and volumes
docker compose -f deploy-macos.yaml down -v
```

### Testing the Container

#### 1. Verify Container is Running

```bash
# Check container status
docker ps | grep mac_agent

# Expected output:
# CONTAINER ID   IMAGE                        STATUS          PORTS
# abc123def456   nullvoider/mac15-base:v1   Up 2 minutes    0.0.0.0:4000->4000/tcp, ...
```

#### 2. Check Boot Progress

```bash
# Monitor container logs
docker logs -f mac_agent

# Look for successful boot messages indicating:
# - macOS boot sequence completed
# - Services started
# - NoMachine server ready
# - VNC server ready
```

#### 3. Test Remote Access

**NoMachine (Recommended)**:
```bash
# Connect using NoMachine client to:
# Host: your-server-ip
# Port: 4000
```

**VNC (Temporary)**:
```bash
# Connect using any VNC client to:
# Host: your-server-ip
# Port: 5900
```

**SSH**:
```bash
# Test SSH connection
ssh -p 2222 user@your-server-ip
```

#### 4. Verify Services

Once connected via NoMachine or VNC:
1. Open Terminal
2. Check system information: `sw_vers`
3. Verify development tools: `python --version`, `node --version`, etc.
4. Open VS Code to verify it's installed

#### 5. Health Check

```bash
# Check container resource usage
docker stats mac_agent

# Expected metrics:
# CPU: 20-30% (normal workload)
# MEM: ~4GB allocated
# NET I/O: Varies based on remote access usage
```

---

## Customizing the Image

This section walks through the full process of modifying the macOS environment and rebuilding a custom Docker image — useful for adding languages, tools, updated scripts, or any workflow-specific configurations and customizations.

### Prerequisites

- Repository cloned with QCOW2 downloaded (see [Getting Started](#getting-started))
- Docker and QEMU utilities installed (`qemu-img` must be on PATH)
- At least 100 GB free disk space for the conversion steps

---

### Step 1 — Modify the YAML Configuration (Optional)

If you need to adjust the RAM or CPU core allocation before booting into macOS, edit the YAML file inside the `scripts/` directory of the cloned repo:

```bash
# Example: open and edit the YAML before moving it
nano scripts/mac15.yaml
```

Then move it to a separate working directory of your choice — this directory will be your build workspace for all subsequent steps:

```bash
mv scripts/mac15.yaml /your/working/directory/
```

> ⚠️ **WARNING**: Only change RAM and CPU core values in the YAML. **Do not change the disk size** — altering the disk size will corrupt `data.img` and make it unusable. If that happens, you will need to re-run Step 2 from the original QCOW2 file to start over.

---

### Step 2 — Convert the QCOW2 to a Raw Image

From the root of the cloned repository, convert the QCOW2 disk image to a raw format that QEMU can use as a mutable disk:

```bash
qemu-img convert -p -f qcow2 -O raw mac15-image/mac15.qcow2 data.img
```

This may take several minutes depending on your disk speed. The `-p` flag shows progress.

---

### Step 3 — Create the macOS Directory Structure

Navigate to the working directory where you moved the YAML file and create the expected directory layout:

```bash
cd /your/working/directory
mkdir macos
mkdir macos/15
```

---

### Step 4 — Place the Disk Images

Copy or move `base.dmg` and the `data.img` produced in Step 2 into the directory you just created:

```bash
# Copy (safe — preserves originals)
cp /path/to/base.dmg macos/15/base.dmg
cp /path/to/data.img macos/15/data.img

# Or move (saves disk space if originals are no longer needed)
mv /path/to/data.img macos/15/data.img
```

---

### Step 5 — Boot and Customize

Start the container from your working directory:

```bash
docker compose -f mac15.yaml up -d
```

Connect via NoMachine or VNC and perform your customizations inside the running macOS environment — updating the Task Executor script, installing apps, adding programming languages, configuring tools, or anything else your workflow requires.

---

### Step 6 — Clean Up Before Capture

Before shutting down, ensure the macOS environment is clean so no personal or session data ends up in your image:

- **Browser**: Close all tabs and clear all browsing history, cookies, and cached data in every browser installed
- **Terminal**: Wipe shell history — in the terminal run `history -c && > ~/.zsh_history && > ~/.bash_history`
- **Recent items**: Clear recent files, recent apps, and recent servers from the Apple menu → Recent Items → Clear Menu
- **Trash**: Empty the Trash

---

### Step 7 — Shut Down and Stop the Container

Shut down macOS cleanly from within the OS (Apple menu → Shut Down) and wait for the guest to fully power off. Then, from the host terminal in your working directory:

```bash
docker compose -f mac15.yaml down
```

---

### Step 8 — Convert Back to QCOW2

From the `macos/15/` directory, convert the modified raw image back to a compressed QCOW2:

```bash
cd macos/15
qemu-img convert -p -O qcow2 -c data.img mac15.qcow2
```

The `-c` flag enables compression to keep the image size manageable. This step may take several minutes.

---

### Step 9 — Move the QCOW2 to the Build Directory

Move the new QCOW2 back into the `mac15-image/` directory of the cloned repository. If a QCOW2 already exists there, remove it first:

```bash
# Remove existing if present
rm /path/to/cloned-repo/mac15-image/mac15.qcow2

# Move new QCOW2 into place
mv macos/15/mac15.qcow2 /path/to/cloned-repo/mac15-image/mac15.qcow2
```

---

### Step 10 — Build Your Custom Image

From the root of the cloned repository, build the Docker image with your chosen tag:

```bash
docker build -f mac15-base.dockerfile -t <username>/<image-name>:<version-number> .
```

Example:
```bash
docker build -f mac15-base.dockerfile -t myorg/mac15-custom:v1 .
```

Once the build completes, clear the Docker builder cache to avoid storage bloat:

```bash
docker builder prune --all
```

Your custom image is ready to use in your workflow.

---

## Installed Software

### Pre-installed Applications

#### Productivity & Development
- **Brave Browser** - Privacy-focused web browser (default)
- **Visual Studio Code** - Feature-rich code editor with extensions
- **Terminal** - Built-in macOS terminal with modern shell tools

#### System Utilities
- **Finder** - macOS file manager
- **System Preferences** - macOS settings
- **Activity Monitor** - System resource monitoring
- **Console** - System log viewer

### Command Line Tools

#### Package Managers
- **Homebrew** - macOS package manager
- **pip** - Python package manager
- **npm** - Node.js package manager
- **cargo** - Rust package manager
- **go modules** - Go dependency management

#### Development Utilities
- **git** - Version control (with Git LFS)
- **zsh** - Z shell (default shell)
- **tmux** - Terminal multiplexer
- **vim** / **nano** - Text editors

#### Build Tools
- **Xcode Command Line Tools** - Essential development tools
- **gcc** / **clang** - C/C++ compilers
- **make** - Build automation
- **cmake** - Cross-platform build system

---

## Development Environments

### Python Development
```bash
# Python 3.14.4 pre-installed
python --version

# Install packages
pip install numpy pandas tensorflow

# Virtual environments
python -m venv myenv
source myenv/bin/activate
```

### Node.js Development
```bash
# Node.js 25.9.0 pre-installed
node --version
npm --version

# Install packages
npm install -g typescript tsx

# Project setup
npm init -y
npm install express
```

### Go Development
```bash
# Go 1.26.2 pre-installed
go version

# Initialize module
go mod init myproject

# Install dependencies
go get github.com/gin-gonic/gin
```

### Rust Development
```bash
# Rust stable pre-installed
rustc --version
cargo --version

# Create new project
cargo new myproject
cd myproject
cargo build
```

### Java Development
```bash
# Java 25 pre-installed
java --version
javac --version

# Compile and run
javac HelloWorld.java
java HelloWorld
```

### C#/.NET Development
```bash
# .NET 10.0 SDK pre-installed
dotnet --version

# Create new project
dotnet new console -n MyApp
cd MyApp
dotnet run
```

### iOS/macOS Development
```bash
# Xcode command line tools available
xcode-select --version

# Build tools
xcodebuild -version
```

---

## The-Eye Integration

The Eye is an AI-native vision capture tool integrated into the macOS container, providing automated screen capture capabilities for Computer Use Agent training, monitoring, and debugging.

### Overview

The Eye captures screen content at configurable intervals for:
- **Agent Training**: Collect visual data for training CUAs, train coding agents with full environment rather than a partial one and also evaluate agents in a full OS environments
- **Debugging**: Record agent interactions for troubleshooting
- **Monitoring**: Track agent behavior during execution
- **Dataset Creation**: Build machine learning datasets from screen captures

### Configuration

**Eye Server Port**: 8080 (HTTP)  
**Architecture**: Client-server model with RESTful API  
**Storage**: In-memory circular buffer (configurable capacity)

**Important Note**: The Eye server configuration is specific to the macOS container. Server port and settings differ from the Ubuntu build, though core functionality remains the same.

### Connection & Endpoints

**Eye Server Base URL**:
```
http://your-server-ip:8080
```

**Available Endpoints**:
- `GET /health` - Server health status and metrics
- `GET /snapshot.png` - Retrieve latest captured frame
- `POST /upload` - Upload captured frames (for external agents)
- `POST /admin/config` - Update capture configuration
- `GET /debug` - Server runtime statistics

### Python SDK

The Eye includes a Python SDK for programmatic access:

**Installation** (if not using container's built-in Eye):
```bash
pip install eye-capture
```

**Basic Usage**:
```python
from eye.core import EyeClient

# Connect to Eye server
client = EyeClient("http://localhost:8080", token="your-token")

# Health check
health = client.health_check()

# Get latest screenshot
image_data = client.get_snapshot()
with open("screenshot.png", "wb") as f:
    f.write(image_data)

# Get frame metadata
metadata = client.get_snapshot_metadata()
print(f"Frame ID: {metadata['frame_id']}")

# Get debug info
debug = client.get_debug_info()
print(f"Uptime: {debug['uptime_sec']}s")
```

**Advanced Features**:
```python
from eye.core import EyeClient, SessionManager
from eye.integrations import DatasetExporter

# Initialize components
client = EyeClient("http://localhost:8080", token="TOKEN")
exporter = DatasetExporter()

# Capture session
for i in range(100):
    frame = client.get_snapshot()
    metadata = client.get_snapshot_metadata()
    exporter.add_frame(frame, i, metadata)
    time.sleep(1.5)

# Export dataset
exporter.export_json("training_data.json")
exporter.export_csv("training_data.csv")
```

### Key Features

**Capture Capabilities**:
- Multiple image formats (PNG, JPEG, WebP, BMP, TIFF)
- Configurable quality (1-100)
- Adjustable capture interval (0.1s minimum)
- Automatic retries with exponential backoff

**API Features**:
- RESTful HTTP endpoints
- Token authentication
- Dynamic configuration updates
- Health monitoring
- Debug statistics

**Integration Options**:
- Python SDK for programmatic access
- REST API for any language
- Dataset export (JSON, JSONL, CSV)
- Webhook support for event notifications
- Cloud storage integration patterns

### Quick Usage Examples

**REST API (curl)**:
```bash
# Get latest screenshot
curl http://localhost:8080/snapshot.png > screenshot.png

# Check health
curl http://localhost:8080/health

# Update configuration
curl -X POST http://localhost:8080/admin/config \
  -H "Authorization: Bearer your-token" \
  -d '{"interval": 2.0, "format": "jpeg", "quality": 85}'
```

**Python SDK**:
```python
from eye.core import EyeClient

client = EyeClient("http://localhost:8080")

# Continuous monitoring
while True:
    snapshot = client.get_snapshot()
    # Process snapshot for agent training
    process_for_training(snapshot)
    time.sleep(1.5)
```

### Performance Impact

- **CPU Overhead**: <3% during capture
- **Memory Usage**: 50-150 MB (in-memory buffer)
- **Network Bandwidth**: 0.5-2 MB/s @ 1.5s interval
- **Capture Latency**: 10-50ms (platform dependent)
- **Display Performance**: No noticeable impact on macOS GUI

### Configuration Options

The Eye service runs automatically when the container starts. Configure via API:

```python
import requests

# Update capture settings
response = requests.post(
    "http://localhost:8080/admin/config",
    headers={"Authorization": "Bearer your-token"},
    json={
        "interval": 2.0,      # Capture every 2 seconds
        "format": "jpeg",     # Use JPEG format
        "quality": 85         # 85% quality
    }
)
```

**For more details**, see The Eye documentation: https://github.com/nullvoider07/the-eyes

---

## Task Executor REST API
 
The Task Executor is a Flask/waitress HTTP service running directly inside the macOS QEMU guest, exposed on **port 9090** via QEMU port-forwarding. It provides structured task submission and result retrieval for coding agents and evaluation harnesses, including SWE-bench Lite compatibility.
 
### Architecture
 
```
[external client]
    │  HTTP  port 9090
    ▼
[QEMU port-forward  hostfwd tcp::9090-:9090]
    ▼
[Flask service — running natively inside macOS guest]
    │  subprocess / native macOS calls
    ▼
[git, python3, pytest — all native on macOS]
```
 
**Important**: `docker exec` cannot reach the macOS QEMU guest. All task execution must go through this REST API or SSH (port 2222). Never use `docker exec mac_agent <cmd>` to run commands inside macOS.
 
### Service Setup (one-time, via SSH)
 
```bash
# 1. Copy files into the guest
scp -P 2222 task_executor.py AgentUser@localhost:/Users/AgentUser/tasks/
scp -P 2222 com.cua.taskexecutor.plist AgentUser@localhost:/Users/AgentUser/tasks/
 
# 2. SSH in and complete setup
ssh -p 2222 AgentUser@localhost
 
# 3. Install dependencies
pip3 install flask waitress
 
# 4. Register as a launchd system service (auto-starts on boot)
sudo cp /Users/AgentUser/tasks/com.cua.taskexecutor.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/com.cua.taskexecutor.plist
sudo chmod 644 /Library/LaunchDaemons/com.cua.taskexecutor.plist
 
# 5. Start immediately without rebooting
sudo launchctl load /Library/LaunchDaemons/com.cua.taskexecutor.plist
```
 
Service logs are written to `/Users/AgentUser/tasks/task_executor.log`.
 
### Endpoints
 
#### POST /task/submit
 
Submit a task for execution. Returns immediately with a task ID.
 
**Request body**:
```json
{
  "repo_url":        "https://github.com/org/repo",
  "base_commit":     "abc1234",
  "patch":           "--- a/file.py\n+++ b/file.py\n...",
  "test_command":    "python3 -m pytest tests/ -x --tb=short",
  "timeout":         300,
  "lint_command":    "ruff check . --output-format json",
  "capture_diff":    true,
  "reference_patch": "--- a/file.py\n+++ b/file.py\n..."
}
```
 
| Field | Required | Default | Description |
|---|---|---|---|
| `repo_url` | ✅ | — | Git-clonable URL |
| `base_commit` | ❌ | `HEAD` | Commit, tag, or branch to check out |
| `patch` | ❌ | — | Unified diff applied after checkout |
| `test_command` | ✅ | — | Command run in the repo root |
| `timeout` | ❌ | `300` | Seconds before the process is killed |
| `lint_command` | ❌ | — | CLI lint command run after tests; result is a soft score only |
| `capture_diff` | ❌ | `false` | Capture `git diff <base_commit>` after tests |
| `reference_patch` | ❌ | — | Ground-truth unified diff for patch similarity scoring |
 
**Response** `202 Accepted`:
```json
{ "task_id": "550e8400-e29b-41d4-a716-446655440000", "status": "pending" }
```
 
#### GET /task/{id}
 
Lightweight status poll — no stdout/stderr payload.
 
**Response** `200`:
```json
{ "task_id": "...", "status": "pending|running|completed|failed" }
```
 
#### GET /task/{id}/result
 
Full result once the task completes. Returns `202` while still running.
 
**Response** `200`:
```json
{
  "task_id":          "...",
  "status":           "completed",
  "exit_code":        0,
  "stdout":           "...",
  "stderr":           "...",
  "tests_passed":     5,
  "tests_failed":     0,
  "lint_errors":      2,
  "lint_output":      "Found 2 errors.",
  "patch_diff":       "diff --git a/src/foo.py ...",
  "patch_similarity": 0.9412,
  "execution_time":   14.2
}
```
 
#### DELETE /task/{id}
 
Remove a task record from the store.
 
**Response** `200`:
```json
{ "task_id": "...", "deleted": true }
```
 
### SWE-bench Lite Compatibility
 
The task executor is designed to be compatible with the [SWE-bench Lite](https://github.com/princeton-nlp/SWE-bench) evaluation harness:
 
- **Clean workspace per task**: Each task runs in its own UUID subdirectory (`/Users/AgentUser/tasks/<uuid>/repo/`). No git state is shared between tasks — no VM reboot required.
- **Pinned base commit**: The `base_commit` field maps directly to the SWE-bench instance's `base_commit`.
- **Patch application**: The `patch` field accepts a standard unified diff, applied via `git apply` after checkout.
- **pytest execution**: `test_command` accepts any pytest invocation; pass/fail counts are parsed from output automatically.
- **Structured results**: Exit code, stdout, stderr, pass/fail counts, and execution time are all returned in a single JSON response.
**Example SWE-bench task submission**:
```bash
curl -X POST http://localhost:9090/task/submit \
  -H "Content-Type: application/json" \
  -d '{
    "repo_url":     "https://github.com/psf/requests",
    "base_commit":  "a1b2c3d4",
    "patch":        "<unified diff from SWE-bench instance>",
    "test_command": "python3 -m pytest tests/test_requests.py -x --tb=short",
    "timeout":      600
  }'
```
 
### Supported Test Frameworks

The executor auto-detects the test framework from `test_command` and routes to the appropriate parser.

| `test_command` contains | Framework | Output parsed |
|------------------------|-----------|--------------|
| `pytest`, `py.test` | pytest | `5 passed, 2 failed, 1 error in 3.14s` |
| `cargo` | cargo test | `test result: ok. 5 passed; 0 failed` |
| `go test` | go test | `--- PASS/FAIL:` lines; `ok`/`FAIL` package lines |
| `jest`, `npm test`, `yarn test`, `pnpm test` | Jest | `Tests: 2 failed, 5 passed, 7 total` |
| `dotnet` | dotnet test | `Failed: 2, Passed: 3, Total: 5` |
| `mvn`, `gradle`, `sbt`, `junit` | JUnit/Surefire | `Tests run: 7, Failures: 2, Errors: 0` |

For unrecognised commands, all parsers are tried in order and the first non-zero result is used.

### Supported Linters (Soft Score)

Lint results are recorded in `lint_errors` and `lint_output` but **never** change `status` or `exit_code`. This is consistent with SWE-bench, HumanEval, and LiveCodeBench conventions.

| Linter | Language | Example `lint_command` |
|--------|----------|------------------------|
| `ruff` | Python | `ruff check . --output-format json` |
| `flake8` | Python | `flake8 src/` |
| `mypy` | Python | `mypy src/ --ignore-missing-imports` |
| `pylint` | Python | `pylint src/` |
| `cargo clippy` | Rust | `cargo clippy -- -D warnings` |
| `eslint` | JS/TS | `eslint src/ --format json` |
| `go vet` | Go | `go vet ./...` |
| `clang-tidy` | C/C++ | `clang-tidy src/*.cpp` |
| `dotnet build` | C# | `dotnet build --no-restore` |

### API Authentication

When `API_TOKEN` is set (via environment variable in the macOS guest or the Docker Compose file), every request must include:

```
Authorization: Bearer <token>
```

Requests without a valid token return `401 Unauthorized`. Set it via SSH before starting the executor:

```bash
ssh -p 2222 AgentUser@localhost
export API_TOKEN=your-secret-token
python3 /Users/AgentUser/tasks/task_executor.py &
```

Or set it persistently in the launchd plist:
```xml
<key>EnvironmentVariables</key>
<dict>
    <key>API_TOKEN</key>
    <string>your-secret-token</string>
    <key>TASK_MAX_AGE</key>
    <string>3600</string>
</dict>
```

### Cleanup After Testing
 
To remove all traces of the task executor from the macOS guest:
 
```bash
ssh -p 2222 AgentUser@localhost
 
# Stop and unload the service
sudo launchctl unload /Library/LaunchDaemons/com.cua.taskexecutor.plist
 
# Remove the plist
sudo rm /Library/LaunchDaemons/com.cua.taskexecutor.plist
 
# Remove the script, log, and any remaining task directories
rm -rf /Users/AgentUser/tasks
 
# Uninstall dependencies
pip3 uninstall flask waitress -y
```

---

## Remote Access Methods

### NoMachine (Recommended)

**Primary Remote Access Method**: NoMachine provides the best performance and user experience for macOS container access.

#### Why NoMachine?

**Performance Benefits**:
- Hardware-accelerated rendering
- Optimized for macOS GUI
- Low latency input handling
- Efficient bandwidth usage
- Superior video quality

**Features**:
- Full desktop experience
- Clipboard sharing (bidirectional)
- File transfer capabilities
- Audio support
- Multi-session support
- Keyboard and mouse optimization

#### Connection Setup

**1. Install NoMachine Client**:
- Download from: https://www.nomachine.com/download
- Available for Windows, macOS, Linux

**2. Create Connection**:
```
Protocol: NX
Host: your-server-ip
Port: 4000
```

**3. Connect**:
- Open NoMachine client
- Select the connection
- Connect to macOS desktop

#### Best Practices

**For Best Performance**:
- Use wired network connection when possible
- Close unused applications in the container
- Disable unnecessary animations in macOS settings
- Use NoMachine's adaptive quality settings

**Network Requirements**:
- Minimum: 10 Mbps
- Recommended: 100 Mbps+
- Latency: <50ms for best experience

#### Use Cases

**Primary Development**:
- Extended coding sessions
- Full IDE usage (VS Code, Xcode)
- Multi-window workflows
- GUI application development

**Testing & Debugging**:
- Interactive debugging
- Visual testing
- GUI automation development
- Screen recording

### VNC (Temporary Monitoring)

**Important**: VNC should **ONLY** be used for temporary monitoring. Performance is significantly inferior to NoMachine.

#### When to Use VNC

**Appropriate Use Cases**:
- Quick status checks
- Emergency access when NoMachine is unavailable
- Automated monitoring scripts
- Screenshot capture for monitoring

**Not Recommended For**:
- Primary development work
- Extended sessions
- Resource-intensive applications
- High-quality video requirements

#### Connection Setup

**1. Use Any VNC Client**:
- TigerVNC
- RealVNC
- TightVNC
- Built-in VNC clients (macOS Screen Sharing)

**2. Connect**:
```
Host: your-server-ip:5900
or
Host: your-server-ip
Port: 5900
```

#### Performance Comparison

| Aspect | NoMachine | VNC |
|--------|-----------|-----|
| Video Quality | Excellent | Moderate |
| Latency | Very Low | Higher |
| Bandwidth Usage | Optimized | Higher |
| CPU Usage | Low | Higher |
| Features | Full | Basic |
| **Recommendation** | **Primary Use** | **Emergency Only** |

### SSH Access

**Port**: 2222

#### Connection

```bash
# Basic SSH connection
ssh -p 2222 username@your-server-ip

# With key authentication
ssh -i ~/.ssh/id_rsa -p 2222 username@your-server-ip

# Port forwarding example
ssh -L 8080:localhost:8080 -p 2222 username@your-server-ip
```

#### Use Cases

**Command-Line Operations**:
- Script execution
- Package installation
- System administration
- Log viewing

**File Transfer**:
```bash
# Copy files to container
scp -P 2222 file.txt username@your-server-ip:/path/to/destination

# Copy files from container
scp -P 2222 username@your-server-ip:/path/to/file.txt ./

# Using rsync
rsync -avz -e "ssh -p 2222" ./local-dir username@your-server-ip:/remote-dir
```

**Remote Script Execution**:
```bash
# Execute single command
ssh -p 2222 username@your-server-ip "python3 script.py"

# Execute multiple commands
ssh -p 2222 username@your-server-ip << 'EOF'
cd /path/to/project
git pull
python3 script.py
EOF
```

---

## Troubleshooting

### Common Issues

#### 1. Dock Not Appearing

**Symptoms**:
- macOS dock is missing after boot
- Desktop appears but dock doesn't load
- Dock was visible before but disappeared

**Causes**:
- Docker not releasing RAM/CPU completely
- macOS process management issue
- System resource constraints

**Solutions**:

**Option 1: Restart Container** (Try This First)
```bash
# Stop the container
docker compose -f deploy-macos.yaml stop

# Wait 10 seconds
sleep 10

# Start the container
docker compose -f deploy-macos.yaml start

# Monitor logs
docker logs -f mac_agent
```

**Option 2: Restart Docker Service**
```bash
# Restart Docker service
sudo systemctl restart docker

# Wait for Docker to fully restart
sleep 15

# Start the container
docker compose -f deploy-macos.yaml up -d
```

**Option 3: System Restart** (If Above Don't Work)
```bash
# If Docker doesn't release resources properly, a system restart may be necessary
sudo reboot
```

**Prevention**:
- Ensure adequate system RAM free (8GB recommended)
- Don't run too many containers simultaneously
- Monitor host system resources regularly
- Perform clean container shutdowns

#### 2. Slow Performance During Animations

**Symptoms**:
- Lag during window transitions
- Slow animations
- Choppy GUI movements
- Applications with heavy animations slow down other apps

**Cause**:
- Intel i3 CPU configuration limits animation performance
- Current configuration optimized for stability, not animation speed

**Solutions**:

**Option 1: Reduce Animations in macOS**
1. Open System Preferences
2. Go to Accessibility → Display
3. Enable "Reduce motion"
4. Disable "Reduce transparency" if needed

**Option 2: Close Animation-Heavy Applications**
- Avoid running multiple apps with complex animations
- Close unnecessary applications
- Focus on development tools without heavy UI effects

**Option 3: Configuration Adjustment** (Advanced)
- The current i3 configuration is based on tested and confirmed settings
- Configuration can be customized for better animation performance
- Requires understanding of system limits and testing
- Contact for configuration guidance if needed

**Note**:
- Regular development workloads run smoothly
- Issue only affects excessive animation scenarios
- Normal coding, browsing, and terminal work unaffected

#### 3. Container Won't Start

**Symptoms**:
- Container exits immediately after start
- Error messages in logs
- Container status shows "Exited"

**Diagnostic Steps**:
```bash
# Check container logs
docker logs mac_agent

# Check container status
docker ps -a | grep mac_agent

# Inspect container
docker inspect mac_agent
```

**Common Solutions**:

**KVM Not Available**:
```bash
# Verify KVM is accessible
ls -l /dev/kvm

# Check if you're in kvm group
groups | grep kvm

# Add user to kvm group if missing
sudo usermod -aG kvm $USER
# Log out and back in
```

**Insufficient Resources**:
```bash
# Check available RAM
free -h

# Check disk space
df -h

# Verify at least 4GB RAM available
```

**Port Conflicts**:
```bash
# Check if ports are already in use
sudo netstat -tlnp | grep -E '4000|4444|2222|5900|9090'

# Stop conflicting services or change ports in docker-compose.yaml
```

#### 4. Remote Access Connection Issues

**NoMachine Won't Connect**:
```bash
# Verify port is exposed
docker port mac_agent 4000

# Check if service is listening
docker exec mac_agent netstat -an | grep 4000

# Test connectivity from host
telnet localhost 4000
```

**VNC Not Working**:
```bash
# Check VNC port
docker port mac_agent 5900

# Verify VNC server is running
docker exec mac_agent ps aux | grep vnc
```

**SSH Connection Refused**:
```bash
# Check SSH port mapping
docker port mac_agent 2222

# Verify SSH service
docker exec mac_agent ps aux | grep sshd
```

#### 5. macOS-Specific Issues

**Standard macOS Troubleshooting Applies**:

Most macOS-related issues can be resolved using standard macOS troubleshooting methods:

1. **System Preferences Reset**:
   - Open System Preferences
   - Reset specific settings causing issues
   - Restart affected applications

2. **Application Issues**:
   - Force quit misbehaving applications
   - Clear application caches
   - Reinstall problematic applications via Homebrew

3. **Disk Issues**:
   - Run Disk Utility
   - Verify and repair disk if needed
   - Check available storage space

4. **Permission Issues**:
   - Reset permissions in System Preferences
   - Use `chmod` and `chown` as needed
   - Check application permissions in Security & Privacy

**These are standard macOS issues, not container-specific problems**.

### Getting Help

If you encounter issues not covered here:

1. **Check container logs**: `docker logs mac_agent`
2. **Review system resources**: Ensure minimum requirements are met
3. **Verify KVM access**: Confirm `/dev/kvm` is accessible
4. **Test connectivity**: Check network and port accessibility
5. **See Reporting Issues section** for how to get support

---

## CI/CD Integration

The macOS container is designed for seamless integration into CI/CD pipelines, particularly for Computer Use Agent development and deployment.

**IMPORTANT**: When deploying this container in CI/CD pipelines or production environments, ensure compliance with Apple's Software License Agreement (EULA) for macOS. Commercial or enterprise deployments may require additional licensing from Apple.

### Supported Platforms

**Container Orchestration**:
- ✅ **Docker** - Native Docker deployment
- ✅ **Kubernetes** - K8s pod deployment
- ✅ **Docker Compose** - Multi-container orchestration
- ✅ **Docker Swarm** - Swarm service deployment

**CI/CD Systems**:
- GitHub Actions
- GitLab CI/CD
- Jenkins
- CircleCI
- Travis CI
- Any system supporting Docker

### Docker-Based CI/CD

#### GitHub Actions CI/CD Example

```yaml
name: Agent macOS Tests
 
on: [push, pull_request]
 
jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Set up KVM
        run: |
          sudo apt-get update
          sudo apt-get install -y qemu-kvm libvirt-daemon-system
          sudo usermod -aG kvm $USER
      
      - name: Start macOS Container
        run: |
          docker compose -f deploy-macos.yaml up -d
          sleep 90  # Wait for macOS boot and task executor to be ready
      
      - name: Submit task via REST API
        run: |
          # The task executor runs inside the macOS QEMU guest.
          # Use the REST API on port 9090 — docker exec cannot reach the guest.
          TASK_ID=$(curl -s -X POST http://localhost:9090/task/submit \
            -H "Content-Type: application/json" \
            -d '{
              "repo_url": "https://github.com/your-org/your-repo",
              "base_commit": "main",
              "test_command": "python3 -m pytest tests/ -x --tb=short",
              "timeout": 300
            }' | python3 -c "import sys,json; print(json.load(sys.stdin)['task_id'])")
          echo "TASK_ID=$TASK_ID" >> $GITHUB_ENV
      
      - name: Poll for result
        run: |
          for i in $(seq 1 60); do
            STATUS=$(curl -s http://localhost:9090/task/$TASK_ID | python3 -c "import sys,json; print(json.load(sys.stdin)['status'])")
            echo "Status: $STATUS"
            if [ "$STATUS" = "completed" ] || [ "$STATUS" = "failed" ]; then
              break
            fi
            sleep 5
          done
          curl -s http://localhost:9090/task/$TASK_ID/result | python3 -m json.tool
      
      - name: Cleanup
        if: always()
        run: docker compose -f deploy-macos.yaml down
```

#### GitLab CI Example

```yaml
stages:
  - test

macos_tests:
  stage: test
  image: docker:latest
  services:
    - docker:dind
  variables:
    DOCKER_DRIVER: overlay2
  before_script:
    - docker info
  script:
    - docker compose -f deploy-macos.yaml up -d
    - sleep 90
    - |
      TASK_ID=$(curl -s -X POST http://localhost:9090/task/submit \
        -H "Content-Type: application/json" \
        -d '{"repo_url":"https://github.com/your-org/your-repo","test_command":"python3 -m pytest tests/ -x","timeout":300}' \
        | python3 -c "import sys,json; print(json.load(sys.stdin)['task_id'])")
    - sleep 30
    - curl -s http://localhost:9090/task/$TASK_ID/result | python3 -m json.tool
  after_script:
    - docker compose -f deploy-macos.yaml down
  tags:
    - kvm
```

### Kubernetes Deployment

#### Pod Specification

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: macos-agent
  labels:
    app: macos-base
spec:
  containers:
  - name: mac-agent
    image: nullvoider/mac15-base:v1
    ports:
    - containerPort: 4000
      name: nomachine
    - containerPort: 4444
      name: eye-server
    - containerPort: 2222
      name: ssh
    - containerPort: 5900
      name: vnc
    - containerPort: 9090
      name: task-executor
    securityContext:
      capabilities:
        add:
        - NET_ADMIN
    volumeMounts:
    - name: kvm
      mountPath: /dev/kvm
  volumes:
  - name: kvm
    hostPath:
      path: /dev/kvm
      type: CharDevice
  restartPolicy: Always
```

#### Deployment with Service

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: macos-agent-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: macos-base
  template:
    metadata:
      labels:
        app: macos-base
    spec:
      containers:
      - name: mac-agent
        image: nullvoider/mac15-base:v1
        ports:
        - containerPort: 4000
        - containerPort: 4444
        - containerPort: 2222
        - containerPort: 5900
        - containerPort: 9090
---
apiVersion: v1
kind: Service
metadata:
  name: macos-agent-service
spec:
  selector:
    app: macos-base
  ports:
  - name: nomachine
    port: 4000
    targetPort: 4000
  - name: eye
    port: 4444
    targetPort: 4444
  - name: ssh
    port: 2222
    targetPort: 2222
  - name: vnc
    port: 5900
    targetPort: 5900
  - name: task-executor
    port: 9090
    targetPort: 9090
  type: LoadBalancer
```

### Use Cases

**Computer Use Agent Development**:
- Automated testing of CUA implementations
- Training data collection in reproducible environments
- Performance benchmarking
- Integration testing

**macOS Application Testing**:
- Cross-platform application testing
- macOS-specific feature validation
- GUI automation testing
- Compatibility verification

**Continuous Integration**:
- Automated builds on macOS environment
- Unit testing with macOS dependencies
- Integration testing with macOS services
- End-to-end testing workflows

### Best Practices

**Resource Management**:
```yaml
# Kubernetes resource limits
resources:
  requests:
    memory: "4Gi"
    cpu: "4"
  limits:
    memory: "8Gi"
    cpu: "8"
```

**Health Checks**:
```yaml
# Kubernetes liveness probe
livenessProbe:
  exec:
    command:
    - /bin/bash
    - -c
    - "pgrep -f NoMachine"
  initialDelaySeconds: 120
  periodSeconds: 30
```

**Cleanup Strategy**:
- Always use `docker compose down` or equivalent cleanup
- Implement timeout for long-running tests
- Monitor resource usage during CI runs
- Use ephemeral runners when possible

---

## Reporting Issues

When reporting issues, please provide comprehensive information to help diagnose and resolve problems quickly.

### Bug Reports

**Required Information**:

1. **Environment Details**:
   ```bash
   # Docker version
   docker --version
   docker compose version
   
   # Host OS information
   cat /etc/os-release
   uname -a
   
   # KVM information
   kvm-ok
   ls -l /dev/kvm
   ```

2. **System Resources**:
   ```bash
   # Available RAM
   free -h
   
   # Disk space
   df -h
   
   # CPU information
   lscpu
   ```

3. **Container Logs**:
   ```bash
   # Full container logs
   docker logs mac_agent > container-logs.txt
   
   # Last 200 lines
   docker logs --tail 200 mac_agent
   
   # Real-time logs
   docker logs -f mac_agent
   ```

4. **Container Status**:
   ```bash
   # Container details
   docker ps -a | grep mac_agent
   docker inspect mac_agent
   
   # Resource usage
   docker stats mac_agent --no-stream
   ```

5. **Steps to Reproduce**:
   - Detailed steps to reproduce the issue
   - Expected behavior
   - Actual behavior
   - Screenshots or screen recordings if applicable

6. **Configuration**:
   - Docker Compose file contents
   - Any custom modifications
   - Environment variables used

### Feature Requests

**Required Information**:

1. **Use Case Description**:
   - What problem does this feature solve?
   - Who would benefit from this feature?
   - How urgent is this feature?

2. **Proposed Implementation**:
   - How should the feature work?
   - What configuration options should it have?
   - Any technical considerations?

3. **Impact Assessment**:
   - How would this affect existing functionality?
   - Resource implications (CPU, RAM, disk)?
   - Compatibility considerations?

4. **Alternatives Considered**:
   - What alternatives have you considered?
   - Why is this approach preferred?

### Contact Information

**For Direct Support**:
- **X (Twitter)**: [@nullvoider07](https://x.com/nullvoider07)

**When Reporting**:
- Be specific and detailed
- Include all requested information
- Attach logs and screenshots
- Describe impact and urgency

---

## FAQ

### Coding Agent Evaluation Questions

**Q: What new eval capabilities were added in v1?**
A: The Task Executor API now supports `lint_command` (soft-score linting), `capture_diff` (records `git diff <base_commit>` after the test run), and `reference_patch` (ground-truth unified diff for patch similarity scoring returning a 0.0–1.0 ratio). Multi-framework test scoring covers pytest, cargo, go test, jest, dotnet, and JUnit/Maven/Gradle/sbt — auto-detected from `test_command`. See the [Task Executor REST API](#task-executor-rest-api) section for full field reference.

**Q: Why is lint scoring soft — why doesn't it fail the task?**
A: The majority of established coding benchmarks (SWE-bench, HumanEval, LiveCodeBench) use test pass/fail as the primary correctness signal. Lint errors reflect code quality but not functional correctness. Keeping lint as a soft score lets you track quality trends without invalidating otherwise correct solutions.

**Q: What is patch_similarity and when is it useful?**
A: It is a 0.0–1.0 similarity ratio between the agent's actual diff and a ground-truth reference patch, computed after stripping all unified diff metadata (file paths, line numbers, git object hashes). Most useful for patch-apply evals where a canonical solution exists. Always interpret alongside `tests_passed` — a lower similarity score does not mean the solution is wrong.

**Q: How do I access the Task Executor API remotely from outside the container?**
A: The Task Executor runs inside the macOS QEMU guest and is forwarded to the Docker host via QEMU's `hostfwd` on port 9090. From outside the host, it is reachable at `http://your-server-ip:9090` as long as port 9090 is exposed in the Compose file (which it is by default). Always set `API_TOKEN` when the port is reachable outside a trusted network boundary.

**Q: In a k8s deployment with many replicas, how does an orchestrator target a specific pod?**
A: Each replica runs its own Task Executor with its own in-memory task store. The orchestrator must track the pod IP (or headless service DNS entry) at submission time and send all status/result polls to the same pod — a load-balanced service may route to a different replica and return `404 Task not found`. Use a headless k8s service to get per-pod DNS entries, or record the pod IP at submission time.

**Q: What happens to in-flight tasks if a pod is evicted or restarted?**
A: Tasks are in-memory inside the macOS guest and are lost on restart. The macOS container's ~4-second boot means recovery is fast, but the orchestrator must still implement retry logic and treat `404 Task not found` as a signal to resubmit.

**Q: How do I pass API_TOKEN securely in a k8s deployment?**
A: Mount it as a k8s Secret and inject it into the launchd plist environment via an init container or startup script. Never hardcode tokens in the Compose file or Dockerfile:
```yaml
env:
  - name: API_TOKEN
    valueFrom:
      secretKeyRef:
        name: task-executor-secret
        key: api-token
```

**Q: Can the Task Executor run tasks in parallel?**
A: Yes — each submitted task runs in an independent background thread with its own isolated UUID workspace under `/Users/AgentUser/tasks/`. Tasks never share git state. For large-scale parallelism, deploy multiple container replicas via k8s; each replica maintains its own in-memory store.

### General Questions

**Q: Can I use this container for coding agent evaluation like SWE-bench?**
A: Yes. The Task Executor REST API (port 9090) provides exactly the interface needed: submit a repo URL, base commit, patch, and test command; poll for status; retrieve structured results including exit code, stdout, stderr, and pytest pass/fail counts. Each task gets an isolated UUID workspace so concurrent tasks and sequential tasks never share state. See the [Task Executor REST API](#task-executor-rest-api) section for full setup and usage.
 
**Q: Why can't I use `docker exec mac_agent <command>` to run commands inside macOS?**
A: This container runs macOS inside a QEMU virtual machine. `docker exec` executes commands on the Ubuntu Docker host layer, not inside the macOS guest. To run commands in macOS, use SSH on port 2222 or the Task Executor REST API on port 9090.

**Q: How is the entire macOS system running in a single container?**  
A: This container uses advanced virtualization techniques with KVM acceleration to run a complete macOS system. Unlike Dockur and Docker-OSX which require multiple external files and complex setups, this build has everything self-contained within the container image, the result is a fully functional macOS 15.7.5 environment that's completely isolated and ephemeral.

**Q: Why doesn't this container need external files like Dockur and Docker-OSX?**  
A: The container architecture was designed from the ground up to be self-contained. All necessary components, including the macOS system files, bootloader, and configuration, are embedded within the container image itself. This provides significant advantages: easier deployment, cleaner state management, no external file dependencies, and true ephemeral operation.

**Q: What makes this container different from Docker-OSX and Dockur?**  
A: Several key differences:
- **No External Files**: Everything is self-contained in the container
- **Better Performance**: 20-30% CPU usage vs higher overhead in alternatives
- **Smoother Operation**: Optimized for stability and responsiveness
- **Ephemeral State**: Clean isolation without external dependencies
- **Simpler Deployment**: Just Docker Compose, no complex file management
- **Customizable**: Configuration can be tuned for specific hardware

**Q: Can I run multiple instances of this container?**  
A: Yes, but each instance requires 4GB of RAM. Ensure your host has sufficient resources (e.g., 8GB+ RAM for 2 instances).

**Q: How much disk space does it need?**  
A: The container image requires approximately 100GB of host disk space. The macOS system inside has a 4TB virtual disk.

**Q: Is this suitable for production use?**  
A: Yes, it's specifically designed for Computer Use Agent development and deployment in production environments. The container provides a stable, reproducible macOS environment ideal for CI/CD pipelines and automated testing. **Important**: For production use, ensure compliance with Apple's Software License Agreement (EULA), as commercial deployment of macOS may have specific licensing requirements.

### Performance Questions

**Q: What is the boot time?**  
A: The container is ready in approximately 30 seconds — the macOS system and all services (NoMachine, Task Executor, Eye) are live immediately after the container starts. This is one of the key advantages over Dockur and Docker-OSX alternatives.

**Q: Can I improve the performance?**  
A: Yes, the current Intel i3 CPU configuration can be customized for better performance based on your hardware. The existing configuration prioritizes stability and compatibility. For better animation performance, you can adjust the CPU configuration, though this requires testing on your specific hardware.

**Q: Why does NoMachine perform better than VNC?**  
A: NoMachine uses hardware acceleration, optimized protocols, and better compression algorithms specifically designed for remote desktop performance. VNC uses a more basic protocol that's less efficient for macOS GUI rendering.

**Q: What's the CPU usage under heavy load?**  
A: Under normal development workloads (coding, browsing, terminal work), expect 20-30% CPU. Heavy compilation or animation-intensive applications may increase this to 40-50%.

### Compatibility Questions

**Q: Does it work on Windows/macOS hosts?**  
A: It requires a Linux host with KVM support. Windows (WSL2 with nested virtualization) and macOS hosts are not officially supported due to KVM requirements.

**Q: What Linux distributions are supported?**  
A: Any modern Linux distribution with Docker 24.0+ and KVM support:
- Ubuntu 20.04+
- Debian 11+
- Fedora 36+
- CentOS 8+
- Arch Linux

**Q: Can I use AMD CPUs?**  
A: Yes, as long as AMD-V (SVM) is enabled in BIOS and the KVM kernel modules are loaded.

**Q: What about ARM processors (Apple Silicon)?**  
A: Not supported. This is an x86_64 container designed for Intel/AMD processors only.

### Configuration Questions

**Q: Can I change the RAM allocation?**  
A: The container is configured for 4GB RAM. Changing this requires rebuilding the container image with modified configuration. This is not recommended without thorough testing.

**Q: How do I add more software to the container?**  
A: Use Homebrew inside the running container:
```bash
brew install package-name
```
For persistence, create a custom image based on this one.

**Q: Can I use this for iOS app development?**  
A: Xcode command line tools are available, but full Xcode IDE may require additional configuration. The container is optimized for Computer Use Agent development.

**Q: How do I persist data across container restarts?**  
A: Use Docker volumes to mount directories from the host:
```yaml
volumes:
  - ./my-projects:/Users/username/projects
```

### Remote Access Questions

**Q: Why can't I use VNC for development work?**  
A: VNC performance is significantly lower than NoMachine. It's suitable only for monitoring or quick checks. For actual development work, the lag and lower frame rate make it impractical.

**Q: Can I use other remote desktop solutions?**  
A: The container is pre-configured with NoMachine and VNC. Adding other solutions would require custom configuration.

**Q: What's the bandwidth requirement for NoMachine?**  
A: Minimum 10 Mbps, recommended 100 Mbps+ for best experience. Less bandwidth will work but may impact video quality.

### Troubleshooting Questions

**Q: The dock isn't appearing. What should I do?**  
A: First try restarting the container. If that doesn't work, restart the Docker service. In rare cases, a system restart may be needed to fully release resources.

**Q: Why are animations slow?**  
A: The Intel i3 CPU configuration prioritizes stability. You can reduce animations in macOS settings or customize the CPU configuration for better animation performance.

**Q: How do I access container logs?**  
A:
```bash
docker logs mac_agent
docker logs -f mac_agent  # Follow mode
```

**Q: The container won't start. What's wrong?**  
A: Check:
1. KVM is accessible (`ls -l /dev/kvm`)
2. Sufficient RAM available (8GB free)
3. Ports aren't conflicting
4. Docker service is running
5. Container logs for specific errors

### Security Questions

**Q: Is this container secure?**  
A: The container runs with NET_ADMIN capability and requires KVM access. It's designed for development environments. For production, review security considerations and implement appropriate network isolation.

**Q: Can I run this in a public cloud?**  
A: Only on infrastructure that exposes hardware virtualization extensions to the guest. Bare-metal instances work universally. Standard VM instances require the cloud provider to explicitly enable nested virtualization — AWS Nitro, Google Cloud, and Azure support it on select instance types, but it must be enabled per-instance and is not on by default. The limiting factor is the hypervisor configuration, not the host OS.

**Q: How do I secure remote access?**  
A: Use VPN or SSH tunneling to access the container:
```bash
ssh -L 4000:localhost:4000 -p 2222 host-server
```
Then connect NoMachine to `localhost:4000`.

---

## License

This project is licensed under the **GNU General Public License v3.0 (GPL-3.0)** for the container infrastructure, configuration, and custom components. However, macOS and Apple software are subject to Apple's Software License Agreement.

### License Scope

**GPL-3.0 Applies To**:
- Container configuration files and Docker Compose setup
- Custom scripts and automation tools created by the developer
- Integration code and custom components
- Documentation and setup instructions
- Any modifications you make to these components

**GPL-3.0 Does NOT Apply To**:
- macOS operating system (proprietary Apple software under Apple EULA)
- Apple applications and frameworks
- Third-party commercial software included in the container
- Other third-party software with their own licenses

### GPL-3.0 License Summary

**Permissions** (for GPL-3.0 covered components only):
- ✅ Commercial use
- ✅ Modification
- ✅ Distribution
- ✅ Patent use
- ✅ Private use

**Conditions** (for GPL-3.0 covered components):
- 📋 License and copyright notice
- 📋 State changes
- 📋 Disclose source
- 📋 Same license (copyleft)

**Limitations**:
- ❌ Liability
- ❌ Warranty

### Apple EULA Requirements

**IMPORTANT**: By using this container, you agree to comply with Apple's Software License Agreement for macOS. Key requirements include:

- macOS is licensed, not sold
- Use restrictions apply based on Apple's EULA
- Commercial deployment may require additional Apple licenses
- Redistribution of macOS is subject to Apple's terms
- You are responsible for ensuring EULA compliance

### What This Means for Users

**For the Container Infrastructure** (GPL-3.0):
- You can use, modify, and distribute the container configuration
- You can create derivative works of the setup scripts
- If you distribute modified versions, you must:
  - Include the GPL-3.0 license
  - Make your source code modifications available
  - License your modifications under GPL-3.0
  - Document any changes made

**For macOS and Apple Software** (Apple EULA):
- You must comply with Apple's Software License Agreement
- Review Apple's EULA before commercial use
- Some use cases may require Apple's approval or additional licensing
- You are solely responsible for EULA compliance

**Combined Usage**:
When using this container, you must comply with BOTH:
1. GPL-3.0 for container infrastructure components
2. Apple's EULA for macOS and Apple software

The developer provides the container infrastructure under GPL-3.0 but cannot grant rights to macOS itself—those rights come from Apple's EULA.

### Full Licenses

- **GPL-3.0**: https://www.gnu.org/licenses/gpl-3.0.en.html
- **Apple EULA**: https://www.apple.com/legal/sla/

### Disclaimer

This container is provided "as is" without warranty of any kind. The developer is not affiliated with Apple Inc. Users are responsible for ensuring their use complies with all applicable licenses and laws.

---

## About This Project

The **macOS 15.7.5 Container** represents a significant advancement in containerized macOS environments. Built for Computer Use Agent development and frontier coding agent evaluation, this project addresses the key challenges faced by developers working with macOS-based automation and AI agents.

Version 2 extends the original CUA environment into a full coding agent evaluation platform. The Task Executor API — covering multi-framework test scoring, programmatic lint integration, diff capture, and ground-truth patch similarity scoring — was designed to support rigorous benchmarking on a native macOS runtime, enabling SWE-bench-style workflows and broader eval harness compatibility on Apple's platform.

### Project Goals

**Primary Objectives**:
- Provide a reproducible macOS environment for CUA development
- Eliminate external file dependencies for cleaner deployments
- Optimize performance while maintaining stability
- Enable seamless CI/CD integration for macOS workflows
- Support scalable agent training and testing

**Design Philosophy**:
- **Self-Contained**: Everything in one container, no external files
- **Ephemeral**: Clean state management with proper isolation
- **Performant**: Optimized for real-world development workflows
- **Tested**: Based on confirmed safe and stable configurations
- **Accessible**: Simple deployment with Docker Compose

### Development Journey

This container was built from the ground up through:
- Extensive testing on real hardware
- Iterative performance optimization
- Configuration tuning for stability
- Integration of development tools
- Refinement of remote access methods

Every configuration choice, from the Intel i3 CPU setting to the customizable RAM allocation, is based on tested and confirmed performance characteristics. The current configuration represents what can be safely delivered and has been verified to work reliably.

### Why This Matters

**For Developers**:
- Consistent macOS environment across team members
- No "works on my machine" issues
- Fast setup and deployment
- Integrated development tools
- Built-in monitoring capabilities

**For Organizations**:
- Reproducible testing environments
- CI/CD pipeline integration
- Scalable agent deployment
- Cost-effective macOS access
- Clean resource management

### Future Direction

While the current configuration is optimized for compatibility and stability, the container is designed to be customizable. As hardware capabilities evolve and use cases expand, configurations can be adjusted to leverage more powerful systems while maintaining the core benefits of containerization.

### Acknowledgments

This project builds on the containerization ecosystem and the work of many in the Docker and virtualization communities. Special recognition to:
- The Docker team for container technology
- The KVM project for virtualization
- The open-source community for tools and libraries

### Get Involved

**Feedback & Contact**:
- **X (Twitter)**: [@nullvoider07](https://x.com/nullvoider07)
- Report issues with detailed information
- Share your use cases and experiences
- Suggest improvements and features

**Contributing**:
While the core implementation details are open-source, feedback on:
- Performance optimization suggestions
- Use case requirements
- Bug reports and fixes
- Documentation improvements

...is always welcome and appreciated.

---

**Last Updated:** May, 2026  
**Version:** 1  
**Developer:** Kartik (NullVoider)  
**License:** GPL-3.0

---

**macOS 15.7.5** - Full macOS in one self-contained container. No compromises, no external files, no BS. Powerful. Just works. 🚀