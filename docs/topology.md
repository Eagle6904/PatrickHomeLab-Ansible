#PatrickHomeLab Topology

This document describes the physical, logical, and service topology of the PatrickHomeLab infrastructure.

The lab is designed to simulate a small enterprise infrastructure environment including virtualization, automation, monitoring, and reverse proxy services.

## Infrastructure Nodes

| Node | Type | Role |
|-----|-----|-----|
| forge | Physical | Proxmox hypervisor |
| vault | Physical | NAS / NFS storage |
| media-01 | VM | Plex media server |
| proxy-01 | VM | Caddy reverse proxy |
| vpn-gateway | VM | WireGuard VPN gateway |
| monitor-01 | VM | Prometheus / Grafana monitoring |
| controller-01 | VM | Ansible automation controller |

#Visual
                     Internet
                        │
                Cloudflare DNS
                        │
                    Firewall
                        │
                 Managed Switch
                        │
        ┌────────────────────────────────┐
        │                                │
     Forge (Proxmox)                Vault (NFS)
        │
        ├── media-01 (Plex)
        ├── proxy-01 (Caddy)
        ├── vpn-gateway (WireGuard)
        ├── monitor-01 (Prometheus/Grafana)
        └── controller-01 (Ansible)

#Physical / VM 

Internet
   │
ISP Modem / Router (bridge mode if possible)
   │
Firewall (OPNsense / pfSense)
   │
Managed Switch
   │
─────────────── LAB NETWORK ───────────────
│
├─ Forge (Proxmox Hypervisor)
│    ├─ media-01 (Plex VM)
│    ├─ proxy-01 (Caddy reverse proxy)
│    ├─ vpn-gateway (WireGuard)
│    ├─ monitor-01 (Prometheus / Grafana)
│    └─ controller-01 (Ansible)
│
├─ Vault (NAS / NFS storage)
│
└─ Future node

#Logical

Users / Internet
       │
       ▼
Cloudflare DNS
       │
       ▼
proxy-01 (Caddy reverse proxy)
       │
       ├─ monitor-01 (Grafana / Prometheus)
       ├─ media-01 (Plex)
       └─ future services

#Internal Automation Layer:

controller-01
     │
     ▼
Ansible automation
     │
     ├─ forge
     ├─ media-01
     ├─ vault
     ├─ proxy-01
     ├─ vpn-gateway
     └─ monitor-01
#Monitoring Layor:

Node Exporter (all nodes)
        │
        ▼
Prometheus (monitor-01)
        │
        ▼
Grafana dashboards


Storage Layer:

Vault (NFS)
   │
   └─ media-01 mounts /mnt/media
