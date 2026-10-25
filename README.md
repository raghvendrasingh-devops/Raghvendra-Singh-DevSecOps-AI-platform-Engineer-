<div align="center">

  <!-- DYNAMIC ANIMATED BANNER -->
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2,30&height=220&section=header&text=RAGHVENDRA%20SINGH&fontSize=42&fontAlignY=38&animation=fadeIn&fontColor=ffffff&desc=Lead%20DevSecOps%20%7C%20Cloud%20Architect%20%7C%20Agentic%20AI%20Platform%20Engineer&descSize=18&descAlignY=62&descAlign=50" width="100%" alt="Header Banner" />

  <!-- TYPING SVG ANIMATION -->
  <a href="https://git.io/typing-svg">
    <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=20&duration=3000&pause=1000&color=00F5FF&center=true&vCenter=true&multiline=true&width=820&height=85&lines=Architecting+Enterprise+Cloud+Landing+Zones+(Azure+CAF);Automating+Zero-Trust+DevSecOps+Pipelines+%26+IaC+at+Scale;Leading+100%2B+Workload+Enterprise+Migrations+(On-Prem+to+Cloud);Engineering+Autonomous+Agentic+AI+for+Self-Healing+Infrastructure;Optimizing+FinOps%2C+Governance%2C+High-Availability+%26+Disaster+Recovery" alt="Typing SVG" />
  </a>

  <br/>

  <!-- QUICK SOCIAL / CONNECT BADGES -->
  <p align="center">
    <a href="mailto:raghvendrasingh.devops@gmail.com"><img src="https://img.shields.io/badge/Email-raghvendrasingh.devops%40gmail.com-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email" /></a>
    <a href="https://linkedin.com/in/raghvendra-singh-devops"><img src="https://img.shields.io/badge/LinkedIn-Connect%20Professionally-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn" /></a>
    <a href="https://github.com/raghvendrasingh-devops"><img src="https://img.shields.io/badge/GitHub-raghvendrasingh--devops-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub" /></a>
    <a href="#"><img src="https://img.shields.io/badge/Status-Available%20for%20Architecture%20%26%20Leadership-00C853?style=for-the-badge&logo=statuspage&logoColor=white" alt="Status" /></a>
  </p>

</div>

---

### ⚡ The Mission Control Manifesto

```yaml
identity:
  name: "Raghvendra Singh"
  callsign: "The Bhakua Engineer" # The battle-hardened engineer who turns chaos into rock-solid code
  role: "Lead DevSecOps Architect & Autonomous AI Platform Engineer"
  core_philosophy: "If it breathes, automate it. If it moves, secure it. If it costs, optimize it. If it breaks, let AI heal it."
  mission: "Designing resilient, zero-trust cloud landing zones, automated CI/CD pipelines, and agentic AI systems that scale to millions of users without breaking production."
```

---

## 🛰️ Executive Capability Matrix

| Pillar | Architecture Scope & Mastery | Core Stack & Methodologies |
| :--- | :--- | :--- |
| **🏛️ Cloud Architecture & CAF** | Multi-Tenant Hierarchy, Management Groups, Landing Zone Subscriptions, Platform vs Application boundaries | Azure CAF, Entra ID, Azure Policy & Initiatives, PIM, RBAC |
| **🌐 Enterprise Networking** | Hub-and-Spoke Topology, Centralized Inspection, IPAM / CIDR Planning, Controlled Egress | Azure Firewall, ExpressRoute, S2S VPN, Private DNS, Private Endpoints, UDRs |
| **🛡️ DevSecOps & IaC Engine** | Immutable Infrastructure, Remote State Security, Shift-Left SAST/DAST, Branch Governance | Terraform Enterprise, TFLint, Checkov, TruffleHog, Infracost, Terratest |
| **🚀 Enterprise Migration** | 100+ Workload Mass Migration (On-Prem Datacenter to Cloud), Cutover & Hypercare Playbooks | 6R Migration Strategy, Azure Migrate, RACI Matrices, Zero Downtime Cutover |
| **🤖 Agentic AI for Platforms** | Autonomous Incident Triaging Agents, GitOps Bot Reviewers, LLMOps Infrastructure | LangChain, LlamaIndex, Python, Auto-healing KQL Agents, OpenAI API |
| **💰 FinOps & Governance** | Unit Cloud Economics, Idle Asset Reclaim, RI / Savings Plan Planning, Backup & DR | Azure Advisor, Infracost, KQL, LRS/ZRS/GRS, VMSS, RTO/RPO Tuning |
| **👔 Leadership & Delivery** | Vendor Management, SOW, RFP/RFI Evaluation, Team KT Transitions, Presales & POCs | Agile/Scrum, Architecture Governance Board, SOP Creation, Stakeholder KT |

---

<div align="center">
  <h2>📊 Real-Time Operations & GitHub HUD</h2>

  <table align="center" border="0">
    <tr>
      <td align="center">
        <img src="https://github-readme-stats.vercel.app/api?username=raghvendrasingh-devops&show_icons=true&theme=tokyonight&hide_border=true&bg_color=0d1117&title_color=00f5ff&text_color=c9d1d9&icon_color=ff7b72" width="410" alt="GitHub Stats" />
      </td>
      <td align="center">
        <img src="https://github-readme-streak-stats.herokuapp.com/?user=raghvendrasingh-devops&theme=tokyonight&hide_border=true&background=0d1117&stroke=00f5ff&ring=ff7b72&fire=ff7b72&currStreakLabel=00f5ff" width="410" alt="Streak Stats" />
      </td>
    </tr>
    <tr>
      <td align="center" colspan="2">
        <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=raghvendrasingh-devops&layout=compact&theme=tokyonight&hide_border=true&bg_color=0d1117&title_color=00f5ff&text_color=c9d1d9" width="450" alt="Top Languages" />
      </td>
    </tr>
  </table>
</div>

---

## 🏗️ Deep-Dive Architecture Modules

```
                                  [ MICROSOFT ENTRA ID TENANT ]
                                                 │
                                     [ TENANT ROOT GROUP ]
                   ┌─────────────────────────────┼─────────────────────────────┐
                   │                             │                             │
          [ PLATFORM MG ]               [ LANDING ZONES MG ]             [ SANDBOX MG ]
         ┌─────────┼─────────┐            ┌──────┴──────┐                      │
         │         │         │            │             │               [ Isolation / POC ]
     [MGMT]   [CONNECT]  [IDENTITY]     [CORP]       [ONLINE]
        │          │         │            │             │
        │          │         │            │             │
     Log Anal.    HUB     Entra Domain   Spoke 01    Spoke 02
    Automation  Firewall  Controller     (Prod DB)   (App Service)
                GW / ER
```

<details>
<summary><b>📐 Module 01: Enterprise Scale Landing Zones & Azure CAF Architecture (Click to expand)</b></summary>
<br/>

### 1. Management Group & Tenant Hierarchy
* **Tenant Root Group**: Global guardrails applying fundamental deny policies (e.g., prevent non-allowed regions, enforce resource tagging).
* **Platform Management Group**:
  * `Management MG`: Centralized Log Analytics Workspaces, Automation Accounts, Azure Backup Vaults.
  * `Connectivity MG`: Hub Virtual Network, Azure Firewall, ExpressRoute / VPN Gateways, Centralized Private DNS Zones.
  * `Identity MG`: Active Directory Domain Controllers, Key Vaults, Identity Federation infrastructure.
* **Landing Zones Management Group**:
  * `Corp (Corporate)`: Internal workloads with non-public routing, hybrid connectivity back to on-prem via HUB.
  * `Online`: Internet-facing workloads fronted by Azure Front Door / Application Gateway with WAF policies.
* **Sandbox & Decommissioned MGs**: Strict spending budgets, auto-kill policies for idle resources, and isolated lifecycle boundaries.

### 2. Policy-Driven Governance & Security Initiatives
* **Enforced Initiatives**: Custom CIS Azure Foundations benchmark + ISO 27001 initiatives.
* **Policy Exemptions**: Governed workflow requiring architectural justification, business impact analysis, risk owner sign-off, and expiration timers.
* **RBAC Role Matrix**: Custom RBAC definitions strictly aligned with principle of least privilege (JIT / PIM with approval workflows).

</details>

---

<details>
<summary><b>🌐 Module 02: Zero-Trust Hub-and-Spoke Networking & Security Fabric (Click to expand)</b></summary>
<br/>

### 1. Networking Topologies & Controlled Traffic
* **Hub Virtual Network**: Centralized routing nexus hosting Azure Firewall Premium (IDPS & TLS Inspection), VPN/ExpressRoute Gateways, and Bastion hosts.
* **Spoke Virtual Networks**: Independent application environments (Dev, UAT, Prod) isolated with no inter-spoke routing except via Hub Firewall inspection.
* **Controlled Egress & UDRs (User-Defined Routes)**: All `0.0.0.0/0` outbound internet traffic forced through the central Azure Firewall private IP.
* **Private Link & Private Endpoints**:
  * Zero public IP exposure for Azure SQL, Storage Accounts, Key Vaults, and Cosmos DB.
  * Centralized Private DNS Zones linked across all Spokes for seamless zero-trust name resolution.

### 2. IPAM & CIDR Strategy
* Non-overlapping address space allocation between on-premises datacenters (`10.0.0.0/16`), Cloud Hub (`172.16.0.0/20`), and Cloud Spokes (`172.16.16.0/20` ... `172.16.240.0/20`).
* Subnet segmentation: GatewaySubnet, AzureFirewallSubnet, AzureFirewallManagementSubnet, BastionSubnet, PrivateEndpointSubnet, ApplicationSubnet, DatabaseSubnet.

</details>

---

<details>
<summary><b>⚙️ Module 03: Production-Hardened Terraform Enterprise & IaC Standards (Click to expand)</b></summary>
<br/>

### 1. Terraform Security & State Management
* **Remote State Hardening**: State files stored in geo-redundant Azure Storage with TLS 1.3 enforcement, Customer Managed Keys (CMK), Private Endpoints, and strictly scoped RBAC (No static storage keys).
* **State Locking**: Enforced via Azure Blob Lease to prevent concurrent apply race conditions.

### 2. Quality & Security Pipeline Guardrails
* **Linting & Formatting**: `terraform fmt -check`, `tflint --recursive` with cloud rule plugins.
* **Static Analysis & Security (SAST)**: `tfsec` and `checkov` scanning for CIS benchmark violations and open security groups.
* **Secret Leak Prevention**: Integrated `trufflehog` and `GitGuardian` scanning pre-commit and in CI.
* **FinOps Pre-Apply Cost Checks**: `infracost diff` automated comments on Pull Requests showing exact dollar deltas before approvals.
* **Automated Drift Detection**: Scheduled cron pipelines executing `terraform plan -detailed-exitcode` with Slack/Teams alerts on configuration drift.

</details>

---

<details>
<summary><b>🔄 Module 04: Enterprise DevSecOps CI/CD Delivery Pipeline (Click to expand)</b></summary>
<br/>

```
[ Feature Branch ] ──► [ Pull Request ] ──► [ Security & Test ] ──► [ Infracost & Plan ]
                                                      │                      │
[ Blue / Green Deploy ] ◄── [ Manual Approval Gate ] ◄┴──────────────────────┘
          │
          ▼
[ Smoke Tests & Observability Check ] ──► (Success) ──► [ Tag Release ]
                                      └──► (Failure) ──► [ Automated Rollback ]
```

### 1. Branching Strategy & Branch Policies
* **Trunk-Based Development**: Short-lived feature branches (< 24 hours lifecycle).
* **Branch Protection Rules**:
  * Direct commits to `main` strictly prohibited (`No Delete`, `No Force Push`).
  * Minimum 2 senior code reviewers + Mandatory Code Owners sign-off.
  * 100% passing status checks on SAST, Unit Tests, and Container Vulnerability Scans.

### 2. Standardized Multi-Stage Pipeline Templates
* **Stage 1: Validate & Lint**: Syntax validation, spell checks, YAML/Terraform linting.
* **Stage 2: Security & Compliance**: SonarQube quality gate, Trivy container image scanning, Snyk SCA dependency audit.
* **Stage 3: Build & Package**: Deterministic artifacts with cryptographic SHA256 verification.
* **Stage 4: IaC Dry-Run**: `terraform plan` execution + Infracost breakdown.
* **Stage 5: Environment Promotion**: Staging/UAT automated canary deployment -> Manual architectural approval -> Production deployment.
* **Stage 6: Automated Rollback**: Synthetic post-deployment health check failures automatically trigger instant rollback to previous stable commit state.

</details>

---

<details>
<summary><b>🚚 Module 05: 100+ Enterprise Application Migration Framework (Click to expand)</b></summary>
<br/>

```
  ┌──────────────┐      ┌──────────────┐      ┌──────────────┐      ┌──────────────┐
  │ 01.DISCOVERY │ ───► │  02.WAVE     │ ───► │  03.PILOT    │ ───► │  04.CUTOVER  │
  │ & ASSESSMENT │      │  PLANNING    │      │  MIGRATION   │      │  & HYPERCARE │
  └──────────────┘      └──────────────┘      └──────────────┘      └──────────────┘
```

### 1. The 6R Migration Strategy Matrix
* **Rehost (Lift & Shift)**: Azure Migrate for legacy workloads needing rapid datacenter evacuation.
* **Replatform**: Moving legacy SQL servers to Azure SQL Managed Instance / Azure App Services.
* **Refactor / Re-architect**: Breaking monolithic services into containerized microservices on AKS (Azure Kubernetes Service).
* **Retire / Repurchase**: Decommissioning redundant applications or transitioning to SaaS.

### 2. Battle-Tested Checklists
* **Pre-Migration Readiness Checklist**:
  * Network bandwidth & ExpressRoute throughput stress testing.
  * Database schema compatibility assessment (DMA - Data Migration Assistant).
  * Identity sync validation (Entra Connect sync health & latency).
  * Rollback playbook documentation with clear trigger metrics.
* **Cutover Window Protocol (Go-Live Weekend)**:
  * Maintenance mode activation & final delta data synchronization.
  * DNS TTL reduction to 60 seconds prior to migration window.
  * Smoke test execution (Database integrity, API endpoints, Third-party integrations).
  * Formal Go/No-Go architecture review meeting at T-minus 2 hours.
* **Hypercare Support**: 14-day 24x7 War Room, intensive telemetry monitoring, and performance tuning.

</details>

---

<details>
<summary><b>💵 Module 06: FinOps Cloud Unit Economics Engine (Click to expand)</b></summary>
<br/>

* **Idle & Orphaned Asset Reclamation**:
  * Automated identification and deletion scripts for unattached Managed Disks, orphaned Public IPs, and idle Load Balancers.
  * Cost impact: Instant 15-25% reduction in dormant cloud waste.
* **Workload Right-Sizing**:
  * Telemetry-driven analysis of CPU/Memory utilization over 90-day cycles using Azure Monitor & KQL.
  * Downscaling oversized VM SKUs and adjusting Premium SSD tiering (bursting capabilities vs provisioned IOPS).
* **Automated Non-Prod Scheduling**:
  * Azure Automation runbooks and Logic Apps powering automated shutdown/startup of Dev/Test environments outside business hours (Saving 65% on non-prod compute).
* **Commitment-Based Cost Reductions**:
  * Calculating Reserved Instances (1-year vs 3-year RI) and Azure Savings Plans coverage for baseline production compute.
* **Log Ingestion & Data Retention Optimization**:
  * KQL log audit on Log Analytics: Filtering high-volume, low-value debug logs; configuring data caps and tiered retention (Hot to Archive).

</details>

---

<details>
<summary><b>🛡️ Module 07: High Availability, Disaster Recovery & SRE Observability (Click to expand)</b></summary>
<br/>

* **Resilience Topologies**:
  * Storage Redundancy: LRS for dev, ZRS for high-availability prod, GRS / RA-GRS for geo-disaster tolerance.
  * Compute Scale: Virtual Machine Scale Sets (VMSS) with custom autoscale rules across Availability Zones.
  * Traffic Engineering: Azure Front Door / Traffic Manager active-active or active-passive failover.
* **RTO & RPO Objectives**:
  * Tier 1 Mission-Critical: RTO < 15 mins, RPO < 5 mins (Automated geo-failover).
  * Tier 2 Business-Critical: RTO < 2 hours, RPO < 30 mins.
* **Modern SRE Observability Stack**:
  * Centralized telemetry with Azure Monitor, OpenTelemetry, Prometheus, and Grafana.
  * Custom KQL Queries for real-time security threat hunting and anomalous spike detection.
  * PagerDuty & Microsoft Teams alerting integration with automated diagnostic runbooks attached to alerts.

</details>

---

<details>
<summary><b>🤖 Module 08: Agentic AI for Cloud Platforms & Operations (Click to expand)</b></summary>
<br/>

```
                           [ ALERT / PR / METRIC TRIGGER ]
                                          │
                                          ▼
                      [ AUTONOMOUS DEVOPS REASONING AGENT ]
                                          │
                  ┌───────────────────────┼───────────────────────┐
                  ▼                       ▼                       ▼
          [ Tool: KQL Runner ]    [ Tool: GitOps Bot ]    [ Tool: Azure CLI ]
                  │                       │                       │
          Diagnose Outage         Review IaC Drift        Execute Healing Action
```

* **Autonomous Incident Triage Agent**:
  * Ingests Azure Monitor alerts -> Executes live KQL queries against Log Analytics -> Identifies root-cause error stack -> Posts executive incident brief into Teams/Slack.
* **AI IaC Pull Request Reviewer**:
  * Evaluates Terraform diffs against CIS benchmarks, corporate naming conventions, and security policies before human eyes see the code.
* **Self-Healing Infrastructure Agent**:
  * Monitors VM health metrics and synthetic HTTP checks. When degradation occurs, securely calls Azure Resource Graph and automation runbooks to cycle pods/nodes safely.
* **Natural Language Ops Assistant**:
  * Translates engineer intent ("Spin up a secure sandbox spoke with 2 private subnets and a Linux VM") into validated, policy-compliant Terraform code modules.

</details>

---

<details>
<summary><b>💼 Module 09: Executive Leadership, Presales & Vendor Management (Click to expand)</b></summary>
<br/>

* **Presales, RFP/RFI & Architecture Proposals**:
  * Authoring winning technical proposals, SOWs (Scope of Work), and architecture design blueprints for multi-million-dollar cloud enterprise RFPs.
  * Developing rapid Proof-of-Concepts (POCs) demonstrating tangible business ROI, migration velocity, and security posture.
* **Vendor & Commercial Governance**:
  * Technical evaluation matrices for selecting Cloud Providers, Observability tools, and Security solutions.
  * Milestone delivery signoffs, commercial SLA accountability, and risk mitigation registers.
* **Knowledge Transfer (KT) & Engineering Transformation**:
  * Comprehensive documentation delivery: System Architecture Diagrams, SOPs, Disaster Recovery Runbooks, and RACI matrices.
  * Conducting deep-dive technical workshops, masterclasses, and interviewing & mentoring senior cloud engineers.

</details>

---

## 💻 Tech Stack & Engineering Toolkit

<div align="center">

| Category | Technologies & Tools |
| :--- | :--- |
| **Cloud Platforms** | <img src="https://img.shields.io/badge/Microsoft_Azure-0089D6?style=flat-square&logo=microsoft-azure&logoColor=white"/> <img src="https://img.shields.io/badge/AWS-232F3E?style=flat-square&logo=amazon-aws&logoColor=white"/> <img src="https://img.shields.io/badge/Hybrid_Cloud-4A154B?style=flat-square&logo=databricks&logoColor=white"/> |
| **Infrastructure as Code** | <img src="https://img.shields.io/badge/Terraform-7B42BC?style=flat-square&logo=terraform&logoColor=white"/> <img src="https://img.shields.io/badge/Terragrunt-1D2935?style=flat-square&logo=terraform&logoColor=white"/> <img src="https://img.shields.io/badge/Bicep-0078D4?style=flat-square&logo=microsoft&logoColor=white"/> <img src="https://img.shields.io/badge/Ansible-EE0000?style=flat-square&logo=ansible&logoColor=white"/> |
| **DevSecOps & CI/CD** | <img src="https://img.shields.io/badge/Azure_DevOps-0078D7?style=flat-square&logo=azure-devops&logoColor=white"/> <img src="https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat-square&logo=github-actions&logoColor=white"/> <img src="https://img.shields.io/badge/GitLab_CI-FC6D26?style=flat-square&logo=gitlab&logoColor=white"/> |
| **Security & Compliance** | <img src="https://img.shields.io/badge/Defender_for_Cloud-005BA1?style=flat-square&logo=microsoft&logoColor=white"/> <img src="https://img.shields.io/badge/Checkov-2C3437?style=flat-square&logo=bridgecrew&logoColor=white"/> <img src="https://img.shields.io/badge/TruffleHog-FF6F00?style=flat-square&logo=securityscorecard&logoColor=white"/> <img src="https://img.shields.io/badge/SonarQube-4E9BCD?style=flat-square&logo=sonarqube&logoColor=white"/> |
| **Containers & Orchestration** | <img src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white"/> <img src="https://img.shields.io/badge/Kubernetes_(AKS)-326CE5?style=flat-square&logo=kubernetes&logoColor=white"/> <img src="https://img.shields.io/badge/Helm-0F1689?style=flat-square&logo=helm&logoColor=white"/> <img src="https://img.shields.io/badge/ArgoCD-EF6B55?style=flat-square&logo=argo&logoColor=white"/> |
| **Observability & SRE** | <img src="https://img.shields.io/badge/Azure_Monitor-0078D4?style=flat-square&logo=microsoft&logoColor=white"/> <img src="https://img.shields.io/badge/KQL-008AD7?style=flat-square&logo=azure-data-explorer&logoColor=white"/> <img src="https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white"/> <img src="https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white"/> |
| **AI & Automation** | <img src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white"/> <img src="https://img.shields.io/badge/LangChain-1C3C3C?style=flat-square&logo=langchain&logoColor=white"/> <img src="https://img.shields.io/badge/OpenAI_API-412991?style=flat-square&logo=openai&logoColor=white"/> <img src="https://img.shields.io/badge/Bash_Shell-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white"/> |
| **FinOps & Cost Mgmt** | <img src="https://img.shields.io/badge/Infracost-00D084?style=flat-square&logo=infracost&logoColor=white"/> <img src="https://img.shields.io/badge/Azure_Cost_Management-0078D4?style=flat-square&logo=microsoft-azure&logoColor=white"/> <img src="https://img.shields.io/badge/FinOps_Foundation-323330?style=flat-square&logo=linux-foundation&logoColor=white"/> |

</div>

---

## ⚡ Battle-Tested Production Snippets

<details>
<summary><b>🛡️ Terraform Production Snippet: Secure Enterprise Azure Storage for Remote State</b></summary>

```hcl
# Production Hardened Remote State Storage Account
resource "azurerm_storage_account" "tfstate" {
  name                            = "sttfstateprodsec001"
  resource_group_name             = azurerm_resource_group.rg_mgmt.name
  location                        = azurerm_resource_group.rg_mgmt.location
  account_tier                    = "Standard"
  account_replication_type        = "GRS" # Geo-Redundant for DR
  min_tls_version                 = "TLS1_2"
  enable_https_traffic_only       = true
  allow_nested_items_to_be_public = false # Zero Public Exposure
  public_network_access_enabled   = false # Private Endpoint Only

  blob_properties {
    versioning_enabled  = true
    change_feed_enabled = true
    delete_retention_policy {
      days = 30
    }
  }

  tags = {
    Environment = "Management-Platform"
    ManagedBy   = "Terraform"
    Compliance  = "ZeroTrust-Level3"
  }
}
```
</details>

<details>
<summary><b>🔍 KQL Telemetry Snippet: Real-Time Azure Firewall Denied Inbound Traffic Detection</b></summary>

```kql
// Detect Anomalous Inbound Connection Drops on Azure Firewall
AzureDiagnostics
| where Category == "AzureFirewallNetworkRule"
| where Action_s == "Deny"
| parse msg_s with Protocol " request from " SourceIP ":" SourcePort " to " TargetIP ":" TargetPort ". Action: " Action
| summarize DeniedAttempts = count() by SourceIP, TargetIP, TargetPort, bin(TimeGenerated, 5m)
| where DeniedAttempts > 25
| order by DeniedAttempts desc
```
</details>

<details>
<summary><b>🤖 Agentic AI Ops Snippet: Autonomous SRE Diagnostic Triager (Python)</b></summary>

```python
import os
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

def autonomous_incident_triager(alert_title: str, kql_telemetry_dump: str) -> str:
    """Agentic AI SRE Engine: Evaluates live telemetry logs and generates instant root-cause analysis."""
    system_prompt = (
        "You are an Elite Enterprise Site Reliability Agent. "
        "Analyze the provided infrastructure alert and KQL query results. "
        "Output: 1. Root Cause Analysis 2. Immediate Remediation Command 3. Severity Level."
    )
    
    response = client.chat.completions.create(
        model="gpt-4o",
        messages=[
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": f"Alert: {alert_title}\nTelemetry Data:\n{kql_telemetry_dump}"}
        ],
        temperature=0.2
    )
    return response.choices[0].message.content
```
</details>

---

<div align="center">

  ## 🤝 Connect, Collaborate & Build

  Whether you are executing a 100+ application datacenter migration, architecting a greenfield Azure CAF Landing Zone, or building next-generation Agentic AI DevOps workflows — let's build something world-class together.

  <p align="center">
    <a href="mailto:raghvendrasingh.devops@gmail.com">
      <img src="https://img.shields.io/badge/Start%20a%20Conversation-raghvendrasingh.devops%40gmail.com-00F5FF?style=for-the-badge&logo=minutemailer&logoColor=black"/>
    </a>
    &nbsp;&nbsp;
    <a href="https://linkedin.com/in/raghvendra-singh-devops">
      <img src="https://img.shields.io/badge/LinkedIn-Raghvendra%20Singh-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/>
    </a>
  </p>

  <br/>

  <!-- FOOTER CAPSULE -->
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=30,2,0&height=120&section=footer" width="100%" alt="Footer Banner" />

  <sub>Crafted with passion, zero-trust discipline, and bleeding-edge DevOps & AI engineering.</sub>

</div>