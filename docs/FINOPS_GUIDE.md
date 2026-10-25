# 💵 FinOps & Cloud Unit Economics Framework

## 1. Principles of Enterprise Cloud Cost Optimization
Cloud cost optimization is not about cutting infrastructure — it is about maximizing business value per dollar spent through continuous visibility, automated reclamation, and architectural right-sizing.

---

## 2. The 4 Cost Reduction Levers

### Lever 1: Automated Orphaned Asset Reclamation
- **Unattached Managed Disks**: Automatically tagged and queued for deletion after 7 days of non-attachment.
- **Orphaned Public IPs & NICs**: Reclaimed on every weekend cycle.
- **Estimated Savings**: **15% - 22%** reduction in baseline dormant waste.

### Lever 2: Workload Right-Sizing via Telemetry
- Azure Monitor telemetry evaluated over 90-day P95 utilization metrics.
- Over-provisioned compute SKUs downsized (e.g. from `Standard_D8s_v5` to `Standard_D4s_v5`).
- Moving non-prod disks from Premium SSD to Standard SSD.

### Lever 3: Scheduled Automation for Non-Production
- Azure Automation runbooks power scheduled auto-shutdown at 19:00 IST and auto-start at 08:00 IST on weekdays.
- Environments remain offline during weekends, reducing compute cost by **~65%** for Dev & UAT.

### Lever 4: Commitment-Based Discounts (RI & Savings Plans)
- 1-Year and 3-Year Reserved Instances applied to stable, 24x7 production AKS system pools and SQL databases.
- Projected savings: **Up to 45%** compared to Pay-As-You-Go rates.
