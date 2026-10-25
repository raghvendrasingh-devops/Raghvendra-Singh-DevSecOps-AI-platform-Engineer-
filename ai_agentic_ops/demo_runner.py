"""
Agentic AI DevSecOps Platform Suite - Interactive Showcase Runner
===================================================================
Run this script to simulate how Autonomous AI Agents observe, triage,
review, and heal enterprise cloud infrastructure in real-time.

Usage:
  python demo_runner.py
"""

import sys
from rich.console import Console
from rich.panel import Panel
from sre_incident_triager import AutonomousSRETriager, SREIncident
from iac_pr_reviewer_agent import IaCPRReviewerAgent
from self_healing_agent import SelfHealingOpsAgent

console = Console()

def main():
    console.print(Panel.fit(
        "[bold cyan]🤖 Welcome to the Autonomous Agentic AI Platform Suite[/bold cyan]\n"
        "[dim]Created by Raghvendra Singh | Lead DevSecOps & Cloud Architect[/dim]",
        border_style="magenta"
    ))

    console.print("\n[bold yellow]Select a demonstration module to run:[/bold yellow]")
    console.print("1. 🚨 Run Autonomous SRE Incident Triager (KQL + Azure Alert)")
    console.print("2. 📝 Run Agentic IaC Pull Request Reviewer (Terraform Security & FinOps)")
    console.print("3. ⚡ Run Autonomous Self-Healing Infrastructure Agent")
    console.print("4. 🌟 Run Full Operational Simulation (All 3 Agents)")

    choice = input("\nEnter choice [1-4] (Default: 4): ").strip() or "4"

    if choice in ("1", "4"):
        console.rule("[bold red]Module 01: SRE Incident Triager")
        triager = AutonomousSRETriager(simulation_mode=True)
        incident = SREIncident(
            incident_id="INC-AZ-99021",
            service_name="AKS Microservices & Hub Azure Firewall",
            alert_rule="SNAT Port Exhaustion & DNS Failure Alert",
            timestamp="2026-10-25T19:15:00Z",
            kql_logs_sample="AzureDiagnostics | where Category == 'AzureFirewallNetworkRule' | where Action_s == 'Deny'"
        )
        res = triager.analyze_incident(incident)
        triager.print_incident_report(res)

    if choice in ("2", "4"):
        console.rule("[bold cyan]Module 02: IaC Pull Request Reviewer")
        reviewer = IaCPRReviewerAgent()
        sample_diff = "+ resource azurerm_storage_account 'tfstate' { public_network_access_enabled = true }"
        res = reviewer.review_diff(sample_diff)
        console.print(Panel(res["markdown_comment"], title="Automated GitHub Review Comment", border_style="cyan"))

    if choice in ("3", "4"):
        console.rule("[bold green]Module 03: Autonomous Self-Healing")
        healer = SelfHealingOpsAgent()
        event = {
            "resource_id": "/subscriptions/.../virtualMachineScaleSets/vmss-app-tier",
            "instance_id": "vmss-app-tier_3",
            "reason": "Failed 3 consecutive HTTP 503 health probe checks"
        }
        healer.handle_unhealthy_event(event)

    console.print("\n[bold magenta]🎉 Simulation Complete! Zero human intervention required.[/bold magenta]\n")

if __name__ == "__main__":
    main()
