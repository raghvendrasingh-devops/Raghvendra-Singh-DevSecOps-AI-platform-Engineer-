"""
Unit Tests for Autonomous Agentic AI Platform Suite
"""

import pytest
import sys
import os

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from ai_agentic_ops.sre_incident_triager import AutonomousSRETriager, SREIncident
from ai_agentic_ops.iac_pr_reviewer_agent import IaCPRReviewerAgent
from ai_agentic_ops.self_healing_agent import SelfHealingOpsAgent

def test_sre_incident_triager():
    triager = AutonomousSRETriager(simulation_mode=True)
    sample = SREIncident(
        incident_id="TEST-INC-01",
        service_name="AKS Microservices",
        alert_rule="SNAT Exhaustion Alert",
        timestamp="2026-10-25T19:30:00Z",
        kql_logs_sample="Deny Action count > 10"
    )
    result = triager.analyze_incident(sample)
    assert result["incident_id"] == "TEST-INC-01"
    assert "SEV-1" in result["severity"]
    assert len(result["immediate_remediation_commands"]) > 0

def test_iac_pr_reviewer_agent():
    reviewer = IaCPRReviewerAgent(simulation_mode=True)
    diff = "+ resource azurerm_storage_account 'tfstate' { public_network_access_enabled = true }"
    result = reviewer.review_diff(diff)
    assert result["status"] == "CHANGES_REQUESTED"
    assert result["findings_count"] >= 3
    assert "CRITICAL" in result["findings"][0]["severity"]

def test_self_healing_agent():
    healer = SelfHealingOpsAgent(simulation_mode=True)
    mock_event = {
        "resource_id": "/subscriptions/.../virtualMachineScaleSets/vmss-app",
        "instance_id": "vmss-app_1",
        "reason": "Health probe failure"
    }
    healer.handle_unhealthy_event(mock_event)
