# 📘 GitHub Notes

## 🔹 What is Git?

Git is a **distributed version control system** that tracks changes in source code and helps multiple developers collaborate.

### Key Features:

- Tracks file changes
- Supports branching & merging
- Works offline
- Fast and reliable

---

## 🔹 What is GitHub?

GitHub is a **cloud platform** that hosts Git repositories and adds collaboration features.

### Provides:

- Repository hosting
- Pull requests & code review
- Issues & project boards
- CI/CD via GitHub Actions

---

## 📂 Repository (Repo)

A repository is a project folder that contains:

- Source code
- Git history
- README.md
- Config files

Create repo:

- On GitHub UI
- Or using Git CLI

---

## 📥 Clone a Repository

```bash
git clone <repo-url>
```

Downloads repo to local machine.

---

## 📌 Git Basic Workflow

```text
Working Directory → Staging → Commit → Push
```

Commands:

```bash
git status
git add .
git commit -m "message"
git push origin main
```

---

## 🌿 Branching

Branch = separate line of development

Create branch:

```bash
git branch feature
git checkout feature
```

Or:

```bash
git checkout -b feature
```

Merge branch:

```bash
git checkout main
git merge feature
```

---

## 🔁 Pull Latest Changes

```bash
git pull origin main
```

---

## 🔀 Pull Requests (PR)

Used to merge code into main branch with review.

Flow:

1. Create branch
2. Push branch
3. Open PR on GitHub
4. Review & merge

---

## 🐞 Issues

Used to track:

- Bugs
- Tasks
- Feature requests

Can assign, label, and link to PRs.

---

## 🍴 Fork

Creates a personal copy of another repo.

Used in open-source contributions.

---

## ⚙️ GitHub Actions (CI/CD)

Automates:

- Testing
- Building
- Deployment

Workflow file:

```
.github/workflows/main.yml
```

Example use cases:

- Run tests on every push
- Auto deploy app

---

## 📝 README.md

Project documentation file written in Markdown.

Should include:

- Project description
- Setup instructions
- Tech stack
- Usage

---

## 🚫 .gitignore

Specifies files Git should ignore.

Example:

```
node_modules/
.env
dist/
```

---

## 🏷️ Tags & Releases

Used to mark versions.

Create tag:

```bash
git tag v1.0
git push origin v1.0
```

---

## 🔐 Authentication Methods

- HTTPS + token
- SSH key (recommended)

Check SSH:

```bash
ssh -T git@github.com
```

---

## 👥 GitHub Permissions

| Role     | Access       |
| -------- | ------------ |
| Read     | View only    |
| Write    | Push code    |
| Maintain | Manage repo  |
| Admin    | Full control |

---

## 📋 Common Git Commands Cheat Sheet

```bash
git init
git clone
git status
git add .
git commit -m "msg"
git push
git pull
git branch
git checkout
git merge
git log
git reset
git stash
```

---

## ✅ Best Practices

- Commit frequently
- Write clear messages
- Use branches
- Review PRs
- Keep README updated

---

## 🚀 Typical GitHub Workflow

1. Fork repo
2. Clone locally
3. Create branch
4. Make changes
5. Commit & push
6. Create PR
7. Merge

---

## 📦 Useful GitHub Features

- Stars ⭐
- Watch 👀
- Discussions 💬
- Projects 📊

---

## 🎯 Summary

GitHub helps developers:

- Collaborate efficiently
- Track code changes
- Automate workflows
- Manage projects

---

✨ Great for full‑stack development, DevOps, and open‑source work!
