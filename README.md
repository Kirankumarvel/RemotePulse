
# RemotePulse

RemotePulse: Automated Server Health Monitor 🚀

Monitor multiple remote servers for uptime, CPU load, and disk usage using SSH. Get real-time insights and automate checks effortlessly.

## 📌 Features

- ✔️ Monitor multiple remote servers using SSH
- ✔️ Fetch system uptime, CPU load, and disk usage
- ✔️ Automate the process using cron jobs
- ✔️ Extendable for notifications and logging

## 🛠️ Prerequisites

Before running the script, ensure you have:

- Linux/macOS (or Git Bash for Windows)
- SSH access to remote servers
- Public key authentication configured between local and remote servers

### Set Up SSH Key Authentication (If not configured)

Generate an SSH key:
```sh
ssh-keygen -t rsa -b 4096 -C "your.email@example.com"
```

Copy the key to remote servers:
```sh
ssh-copy-id user@remote-server-ip
```

Test SSH login:
```sh
ssh user@remote-server-ip
```

## 📂 Project Structure

```plaintext
📁 remote-pulse/
 ├── 📄 check_servers.sh  # Main script to monitor servers
 ├── 📄 servers.txt       # List of remote servers
 ├── 📄 README.md         # Project documentation
```

## 🚀 Installation & Setup

1️⃣ Clone the Repository
```sh
git clone https://github.com/Kirankumarvel/RemotePulse.git
cd remote-pulse
```

2️⃣ Add Remote Servers

Edit `servers.txt` and add one server per line:
```plaintext
server1.example.com
server2.example.com
192.168.1.100
```

3️⃣ Make the Script Executable
```sh
chmod +x check_servers.sh
```

## 🖥️ Running the Script

To check all listed servers:
```sh
./check_servers.sh
```

## 📝 Automate with Cron Jobs

To run the script daily at 9 AM:
```sh
crontab -e
```

Add this line at the bottom:
```sh
0 9 * * * /path/to/remote-pulse/check_servers.sh >> /var/log/server_status.log 2>&1
```

## 📜 Future Enhancements

- 🔹 Add email/Slack notifications for alerts
- 🔹 Store reports in a database for analysis
- 🔹 Implement a web-based dashboard for live monitoring

## 📌 Contributing

Feel free to submit issues, pull requests, and suggestions!

## 📃 License

MIT License © 2025 Kiran Kumar
