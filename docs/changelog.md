# PatrickHomeLab Change Log

# Changelog

## 2026-03-07 — GitHub Integration and Repository Initialization

### Infrastructure Automation Repository
- Created initial Git repository for PatrickHomeLab automation
- Structured repository for Ansible infrastructure management

Directory structure:
- docs/ – documentation and architecture
- inventory/ – host inventory definitions
- playbooks/ – automation playbooks
- roles/ – reusable Ansible roles
- scripts/ – operational scripts
- templates/ – configuration templates

### GitHub Integration
- Created public repository: PatrickHomeLab-Ansible
- Connected controller-01 automation environment to GitHub
- Configured SSH authentication for secure Git operations

### Repository Hygiene
- Removed local system files from repository
  - .DS_Store
  - .vscode settings
- Implemented .gitignore rules

### CI Integration
- Enabled GitHub Actions
- Added ansible-lint workflow for automated code validation

### GitHub Account Update
- Renamed GitHub account from `Eagle6904` → `patrick-richardson`
- Updated repository remote URL on controller-01
- Verified SSH authentication and Git push access

### Current State
PatrickHomeLab automation repository is now:
- Version controlled
- Publicly accessible
- CI validated
- Ready for infrastructure automation expansion

### Patch Automation Improvements
- Updated `update.yml` playbook to support automated system patching
- Integrated weekly update workflow with reporting output

### Email Notification System
- Configured email reporting for update results
- Weekly patch job now sends a single summarized report instead of multiple messages
- Implemented monthly summary reporting that aggregates the previous four weekly patch reports and clears archived weekly entries after summary generation.
- Validated successful email delivery from controller-01

### Automation Validation
- Verified scheduled patch automation executed successfully via cron.
- Weekly update job ran at the configured time and day without manual intervention.
- Email notification delivered a single consolidated update report as designed.

Result:
Automated patch management workflow is functioning as intended and can operate unattended.

Purpose:
Provide visibility into patch results without needing to SSH into the infrastructure nodes.

## 2026-03-02
- Initialized structured documentation
## 2026-03-06 – Automation & Monitoring Improvements

### Objective
Implement automated patch management across all infrastructure nodes and configure notification reporting.

### Changes Implemented

**1. Ansible Update Playbook**
- Created `update.yml` playbook to:
  - run apt update
  - perform dist-upgrade
  - remove unused packages
  - check for reboot requirements
  - provide update summary output.

**2. Weekly Maintenance Script**
- Created `scripts/weekly_updates.sh`
- Logs results to:
  ~/ansible/logs/weekly_updates.log

**3. Cron Automation**
- Configured scheduled maintenance:
  
  Saturday – 21:00

- Cron executes the weekly update script on controller-01.

**4. Email Notification System**
- Installed and configured Postfix on controller-01.
- Configured Gmail SMTP relay using TLS and app password authentication.
- Verified successful mail delivery.

**5. Configuration Cleanup**
- Removed duplicate Postfix configuration entries.
- Eliminated `smtp_tls_security_level` override warnings.
- Verified clean Postfix configuration.

**6. Monitoring Verification**
- Confirmed controller-01 metrics visible in Prometheus and Grafana.
- Node Exporter confirmed operational.

### Infrastructure Impacted

| Node | Role |
|-----|-----|
forge | Proxmox hypervisor |
media | Plex server |
vault | NAS / NFS storage |
proxy | Caddy reverse proxy |
vpn | WireGuard gateway |
monitor | Prometheus / Grafana |
controller-01 | Ansible automation server |

### Result
Fully automated weekly patch management with logging and email reporting across the homelab infrastructure.

### Next Planned Improvements
- Prometheus Alertmanager integration
- Ansible repo backup sync to MacBook
- Monitoring managed via Ansible roles
