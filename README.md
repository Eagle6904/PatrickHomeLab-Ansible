# Ansible Playbook Index (Patrick Lab)

## How to run (from ~/ansible)
- Audit: `make audit`
- Baseline: `make baseline`

## playbooks/audit.yml
Purpose: Read-only audit (hostname, uptime, disk)
Safe anytime: Yes
Command:
ansible-playbook playbooks/audit.yml

## playbooks/baseline.yml
Purpose: Updates + common packages + ensure SSH running
Safe anytime: Yes (idempotent)
Command:
ansible-playbook playbooks/baseline.yml
