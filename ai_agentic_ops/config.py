"""
Global Configuration for Agentic AI Platform Engineering Suite
"""

import os
from dataclasses import dataclass
from dotenv import load_dotenv

load_dotenv()

@dataclass
class AgentConfig:
    openai_api_key: str = os.getenv("OPENAI_API_KEY", "mock-sk-demo-key-for-local-simulation")
    openai_model: str = os.getenv("OPENAI_MODEL", "gpt-4o")
    azure_subscription_id: str = os.getenv("AZURE_SUBSCRIPTION_ID", "11111111-2222-3333-4444-555555555555")
    azure_resource_group: str = os.getenv("AZURE_RESOURCE_GROUP", "rg-hub-networking-prod")
    slack_webhook_url: str = os.getenv("SLACK_WEBHOOK_URL", "")
    log_level: str = os.getenv("LOG_LEVEL", "INFO")
    simulation_mode: bool = os.getenv("SIMULATION_MODE", "true").lower() == "true"

config = AgentConfig()
