# PatrickHomeLab Change Log

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
