# AWS + Snowflake Practice Project — Setup Guide

**Project folder:** `dbt_aws_snowflake_practice`  
**Platform:** macOS (`zsh`)  
**Purpose:** A living record of project setup steps, terminal commands, and troubleshooting.

> **Where we are:** Git initialization was confirmed, but the repository originally had no files or commits. The commands below show how to complete and verify the setup. Check off each item only after it succeeds on your Mac. **dbt installation is intentionally not included yet.**

## Progress checklist

- [ ] Git repository initialized and `main` selected
- [ ] GitHub remote configured and verified
- [ ] `.gitignore` created **before** adding project files
- [ ] `README.md` and this setup guide added
- [ ] First commit created and pushed to GitHub
- [ ] Python version checked
- [ ] `.venv` created and activated
- [ ] Virtual environment verified

---

## 1. Git: create and initialize the repository

### 1.1 Open the project folder

If the folder does **not** already exist:

```bash
mkdir dbt_aws_snowflake_practice
cd dbt_aws_snowflake_practice
```

If it already exists, **do not recreate it**. Just enter it:

```bash
cd /path/to/dbt_aws_snowflake_practice
```

Check where you are:

```bash
pwd
ls -la
```

### 1.2 Initialize Git and select the branch

```bash
git init
git branch -M main
git status
```

If Git is already initialized, `git init` is safe but unnecessary. `git status` should say `On branch main`.

### 1.3 Connect to GitHub

Your remote URL previously appeared as:

```text
https://github.com/mazecracks/dbt_snowfalke_aws.git
```

**Check the spelling** of `snowfalke` on GitHub; it differs from `snowflake` in your local project folder. Use the URL of the repository that actually exists.

First check whether a remote is already set:

```bash
git remote -v
```

If **no** `origin` remote is listed, add it:

```bash
git remote add origin https://github.com/mazecracks/dbt_snowfalke_aws.git
```

If `origin` exists but points to the wrong URL, update it instead:

```bash
git remote set-url origin <CORRECT_GITHUB_REPOSITORY_URL>
```

Verify again:

```bash
git remote -v
```

---

## 2. `.gitignore`: protect local and generated files

Create `.gitignore` **before** running `git add .`, so the local Python environment and potential credentials do not get staged.

From the project root, create or edit `.gitignore` and add:

```gitignore
# Python virtual environment
.venv/

# Python-generated files
__pycache__/
*.py[cod]

# macOS
.DS_Store

# Local environment variables and sensitive keys
.env
.env.*
!.env.example
*.pem
*.key

# Future dbt-generated folders / local credentials
target/
dbt_packages/
logs/
profiles.yml
```

Check the file:

```bash
cat .gitignore
```

**Important:** `.gitignore` does not remove sensitive files that Git already tracks. Check `git status` before committing, and never commit AWS keys, Snowflake passwords, or other secrets.

---

## 3. First files, commit, and push

### 3.1 Create a README if needed

If you do not have a `README.md` yet:

```bash
echo "# dbt AWS Snowflake Practice Project" > README.md
```

Save this guide in the project root as `SETUP_GUIDE.md`.

### 3.2 Add files and create the first commit

```bash
git add .gitignore README.md SETUP_GUIDE.md
git status
git commit -m "Initial project setup and documentation"
```

Check that the commit exists:

```bash
git log -1 --oneline
```

### 3.3 Push the branch

```bash
git push -u origin main
```

On later commits, `git push` will normally be enough.

### Troubleshooting: `src refspec main does not match any`

This error occurred earlier because the project folder contained only `.git/`. The output showed `No commits yet` and `nothing to commit`. A Git branch with no commit cannot be pushed. Create and commit an actual file, then push again.

If Git reports `nothing to commit`, run:

```bash
ls -la
git status
```

If the remote GitHub repository already has its own commits, a push may require reconciling the histories first; do **not** force-push without checking.

---

## 4. Python virtual environment (`venv`)

### 4.1 Check Python

```bash
python3 --version
```

You should see a Python version; the exact number will depend on your installation.

### 4.2 Create the virtual environment

From the project root:

```bash
python3 -m venv .venv
```

This creates `.venv/`, which is ignored by Git because of Section 2.

### 4.3 Activate it on macOS (`zsh`)

```bash
source .venv/bin/activate
```

Your prompt should now contain `(.venv)`. If Anaconda was already active, the prompt may show both `(.venv)` and `(base)`.

### 4.4 Verify the environment

```bash
which python
python --version
python -m pip --version
```

The `which python` path should end with:

```text
.../dbt_aws_snowflake_practice/.venv/bin/python
```

To leave the environment later:

```bash
deactivate
```

To use it again in a new terminal, return to the project root and run `source .venv/bin/activate`.

---

## 5. Current project layout

After completing the steps above:

```text
dbt_aws_snowflake_practice/
├── .git/             # Git metadata (do not edit manually)
├── .gitignore        # Exclusions for Git
├── .venv/            # Local Python environment (not committed)
├── README.md         # Project overview
└── SETUP_GUIDE.md    # This living guide
```

## 6. How we will update this guide

As we complete each new task:

1. Add the step and its tested commands to `SETUP_GUIDE.md`.
2. Mark the corresponding checklist entry complete.
3. Record any error and its working fix.
4. Save, commit, and push the updated guide:

   ```bash
   git add SETUP_GUIDE.md
   git commit -m "Update setup guide"
   git push
   ```

## 7. Future sections — not started

- [ ] Install and verify dbt
- [ ] Initialize the dbt project
- [ ] Configure Snowflake connection securely
- [ ] Check the connection and run an initial model
- [ ] Add AWS ingestion steps

**Next documentation update:** Continue from the virtual environment setup when ready.
