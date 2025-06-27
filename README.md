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

> A zero-dependency Bash script to automatically clean stopped containers, dangling images, unused volumes, and orphan networks—keeping your Docker host lean and performant.

---

## 📋 Table of Contents

- [✨ Features](#features)  
- [🚀 Quickstart](#quickstart)  
- [🛠️ Installation](#installation)  
- [▶️ Usage](#usage)  
- [📂 Directory Structure](#directory-structure)  
- [⏰ Scheduling](#scheduling)  
- [🔍 How It Works](#how-it-works)  
- [🤝 Contributing](#contributing)  
- [📄 License](#license)  
- [✍️ Author](#author)  

---

## ✨ Features

- ✅ **Zero Dependencies** – Pure Bash + Docker CLI  
- 🔒 **Safe & Idempotent** – Checks before removing  
- 📣 **Verbose Logging** – Shows exactly what’s cleaned  
- ⏰ **Cron-Friendly** – Designed for automated runs  

---

## 🚀 Quickstart

```bash
# 1. Clone the repo
git clone https://github.com/arshad-rahman/docker-cleanup-script.git
cd docker-cleanup-script

# 2. Make it executable
chmod +x docker-cleanup.sh

# 3. Run the cleanup
./docker-cleanup.sh
````

---

## 🛠️ Installation

*No extra dependencies required!*
Just ensure:

* **Docker CLI** is installed and running
* **Bash** (version ≥ 4)

---

## ▶️ Usage

```bash
./docker-cleanup.sh [--dry-run] [--quiet]
```

| Flag        | Description                                 |
| ----------- | ------------------------------------------- |
| `--dry-run` | Show what *would* be removed (no deletion)  |
| `--quiet`   | Suppress informational output (errors only) |

---

## 📂 Directory Structure

```text
docker-cleanup-script/
├── docker-cleanup.sh   # Main cleanup script
├── LICENSE             # MIT License
└── README.md           # This document
```

---

## ⏰ Scheduling

1. Open your crontab editor:

   ```bash
   crontab -e
   ```
2. Add the following line to run daily at 2 AM:

   ```cron
   0 2 * * * /path/to/docker-cleanup-script/docker-cleanup.sh >> /var/log/docker-cleanup.log 2>&1
   ```

---

## 🔍 How It Works

1. **Stopped Containers**

   * `docker ps -aq --filter "status=exited"` → `docker rm`

2. **Dangling Images**

   * `docker images -f "dangling=true" -q` → `docker rmi`

3. **Unused Volumes**

   * `docker volume ls -qf "dangling=true"` → `docker volume rm`

4. **Orphan Networks**

   * `docker network prune -f`

Each step first checks for targets before attempting removal.

---

## 🤝 Contributing

1. Fork the repo
2. Create a branch:

   ```bash
   git checkout -b feature/YourFeature
   ```
3. Commit your changes:

   ```bash
   git commit -m "Add awesome feature"
   ```
4. Push to your branch:

   ```bash
   git push origin feature/YourFeature
   ```
5. Open a Pull Request

---

## 📄 License

Distributed under the **MIT License**. See [LICENSE](LICENSE).

---

## ✍️ Author

**Arshad Rahman**

* GitHub: [@arshad-rahman](https://github.com/arshad-rahman)
* LinkedIn: [arshad-rahman-mp](https://www.linkedin.com/in/arshad-rahman-mp)

---

<p align="center">Made with ❤️ and 🐳</p>
