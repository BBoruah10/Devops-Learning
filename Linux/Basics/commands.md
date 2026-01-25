# 🐧 Linux Command Basics (Clean + Correct)

## 👤 System Info

```bash
whoami        # current user
pwd           # present working directory
hostname      # machine name
date          # current date & time
```

---

## 📁 Directory & Files

```bash
cd dir        # move into dir
cd .          # current directory
cd ..         # parent directory

mkdir dir     # create directory

ls            # list files
ls -l         # long details (permissions, size, date)
ls -a         # show hidden files
ls -t         # sort by modified time
ls -r         # reverse order
```

---

## 🔐 Permissions

```
r = 4   w = 2   x = 1
```

### Symbolic:

```bash
chmod +x file
chmod a+r file
chmod -w file
```

### Numeric:

```bash
chmod 755 file
chmod 644 file
```

---

### Permission Layout

```
-rwxr-xr--
 │ │ │
 │ │ └─ others
 │ └── group
 └─── user
```

### First Character

```
-  file
d  directory
l  link
```

---

## ⚙ Processes

```bash
ps aux
kill PID
pkill process_name
```

---

## 🔍 Search

```bash
grep "word" file
pgrep process
```

---

## 🔗 Pipes

```bash
ps aux | grep nginx
ls | wc -l
```

---

## 📄 Files & Editors

```bash
touch file

vim file
nano file

cat file
head file
head -n 5 file
tail file
tail -f file
```

---

## 📂 Logs Location

Most logs live in:

```bash
/var/log
```

### Examples:

```bash
/var/log/syslog
/var/log/nginx/
/var/log/docker.log
```

---

## 🔧 Services (systemd)

```bash
systemctl status service
systemctl start service
systemctl stop service
systemctl restart service
```

---

## 📜 System Logs

```bash
journalctl
journalctl -u service_name
journalctl -f
```
