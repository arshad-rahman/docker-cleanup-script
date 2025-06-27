<!-- PROJECT LOGO -->
<p align="center">
  <a href="https://github.com/arshad-rahman/docker-cleanup-script">
    <img src="https://img.shields.io/badge/Docker-Cleanup-blue?logo=docker&style=for-the-badge" alt="Project Logo" />
  </a>
</p>

# 🧹 Docker Cleanup Script

<p align="center">
  <a href="https://github.com/arshad-rahman/docker-cleanup-script/actions">
    <img src="https://img.shields.io/github/actions/workflow/status/arshad-rahman/docker-cleanup-script/ci.yml?branch=main&style=flat-square" alt="CI Status" />
  </a>
  <a href="https://github.com/arshad-rahman/docker-cleanup-script/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/arshad-rahman/docker-cleanup-script?style=flat-square" alt="License" />
  </a>
  <a href="https://github.com/arshad-rahman/docker-cleanup-script/releases">
    <img src="https://img.shields.io/github/v/release/arshad-rahman/docker-cleanup-script?style=flat-square" alt="Latest Release" />
  </a>
</p>

> **A robust, zero–dependency Bash script** to **automatically clean** your Docker host by removing stopped containers, dangling images, unused volumes, and orphan networks—keeping your environment lean and performant.

---

## 📋 Table of Contents

- [✨ Features](#✨-features)  
- [🚀 Quickstart](#🚀-quickstart)  
- [🛠️ Installation](#🛠️-installation)  
- [▶️ Usage](#▶️-usage)  
- [📂 Directory Structure](#📂-directory-structure)  
- [📜 Configuration & Scheduling](#📜-configuration--scheduling)  
- [🔍 How It Works](#🔍-how-it-works)  
- [🤝 Contributing](#🤝-contributing)  
- [📄 License](#📄-license)  
- [✍️ Author](#✍️-author)

---

## ✨ Features

- ✅ **Zero Dependencies** – Pure Bash + Docker CLI.  
- 🔒 **Safe & Idempotent** – Checks for resources before removal.  
- 📣 **Verbose Logging** – Clear feedback on what was cleaned.  
- ⏰ **Cron-Friendly** – Designed for unattended scheduled runs.  

---

## 🚀 Quickstart

```bash
# 1. Clone the repository
git clone https://github.com/arshad-rahman/docker-cleanup-script.git
cd docker-cleanup-script

# 2. Make the script executable
chmod +x docker-cleanup.sh

# 3. Run the cleanup
./docker-cleanup.sh
````

---

## 🛠️ Installation

*No installation of dependencies required!*
Ensure you have:

* **Docker CLI** installed and running
* **Bash** (version ≥ 4)

---

## ▶️ Usage

```bash
./docker-cleanup.sh [--dry-run] [--quiet]
```

| Flag        | Description                                   |
| ----------- | --------------------------------------------- |
| `--dry-run` | Show what *would* be removed without deleting |
| `--quiet`   | Suppress informational output (errors only)   |

---

## 📂 Directory Structure

```text
docker-cleanup-script/
├── docker-cleanup.sh     # Main cleanup script
├── ci.yml                # (Optional) GitHub Actions workflow
├── LICENSE               # MIT License
└── README.md             # This document
```

---

## 📜 Configuration & Scheduling

To automate daily cleanup at 2 AM, add to your crontab:

```cron
# m h  dom mon dow   command
0 2 * * * /path/to/docker-cleanup-script/docker-cleanup.sh >> /var/log/docker-cleanup.log 2>&1
```

---

## 🔍 How It Works

1. **Stopped Containers**

   * Lists via `docker ps -aq --filter "status=exited"`.
   * Removes all matches with `docker rm`.

2. **Dangling Images**

   * Finds via `docker images -f "dangling=true" -q`.
   * Cleans up using `docker rmi`.

3. **Unused Volumes**

   * Detects via `docker volume ls -qf "dangling=true"`.
   * Deletes via `docker volume rm`.

4. **Orphan Networks**

   * Prunes with `docker network prune -f`.

All operations are guarded by checks to avoid errors in an already-clean environment.

---

## 🤝 Contributing

We welcome contributions! Please:

1. **Fork** the repo
2. **Branch**: `git checkout -b feature/awesome-stuff`
3. **Commit**: `git commit -m 'Add awesome feature'`
4. **Push**: `git push origin feature/awesome-stuff`
5. **Open** a Pull Request

Please adhere to the existing style and include tests or examples if applicable.

---

## 📄 License

Distributed under the **MIT License**. See [LICENSE](LICENSE) for details.

---

## ✍️ Author

**Arshad** – [@arshad-rahman-mp](https://github.com/arshad-rahman) <br>
Feel free to connect on [LinkedIn](https://www.linkedin.com/in/arshad-rahman-mp).

---

<p align="center">
  Made with ❤️ and 🐳
</p>

