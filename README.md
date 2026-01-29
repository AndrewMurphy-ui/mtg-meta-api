### mtg-archetype-trends-api
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/fba020a0-b20a-47c8-9c07-d0d15c6f904f" />

### Overview
MTG Meta API is a Python-based backend API for tracking Magic: The Gathering metagame trends.

The project is evolving from an offline data-analysis script into a service-oriented backend system. It processes MTG card or deck frequency data and exposes meta statistics through HTTP API endpoints that can be consumed by other tools or services.

This repository focuses on backend engineering fundamentals: clear project structure, separation of concerns, stable API contracts, and reproducible data workflows.

---

### What This Project Does (Current State)
At its current stage, the project provides:

- A structured Python codebase prepared for backend development
- A FastAPI application with a health check endpoint
- Modular analysis and data-processing logic ready to be exposed via APIs
- Clear separation between application code, scripts, data, SQL, and tests

This establishes the foundation for a production-style backend service.

---
## Current Capabilities

At its current stage, the project provides:

- A structured Python codebase prepared for backend development
- A FastAPI application with a health check endpoint
- Modular analysis and data-processing logic ready to be exposed via APIs
- Clear separation between application code, scripts, data, SQL, and tests

This establishes the foundation for a production-style backend service.


## Planned Capabilities (In Progress)

The intended backend workflow is:

1. MTG data (decklists or frequency data) is ingested
2. Data is validated and normalized
3. Meta statistics (card frequency, trends) are computed
4. Results are stored and reused
5. Clients retrieve results via API endpoints or exports
 
Planned features include:

- Meta statistics endpoints (e.g. `/meta/cards`, `/meta/archetypes`)
- Persistent storage using a database
- Background processing for analysis jobs
- CLI client for automation
- Expanded automated testing and CI


---

### API Overview

#### Health Check
```
GET /health
```

**Response**
```json
{
  "status": "ok"
}
```

---

### Project Structure
```text
mtg-meta-api/
├─ app/                # Application code (API, core logic)
│  ├─ main.py          # FastAPI entry point
│  └─ transfer.py
├─ scripts/            # Runner scripts / legacy entry points
│  └─ run_analysis.py
├─ data/               # Sample or static datasets
│  └─ cardfrequency.csv
├─ sql/                # Raw SQL queries
│  └─ cardcount.sql
├─ tests/              # Test files
│  └─ test_bias.py
├─ requirements.txt    # Python dependencies
└─ README.md
```

---

### Getting Started

#### Requirements
- Python 3.9+
- pip

#### Installation
```bash
pip install -r requirements.txt
```

#### Run the API Locally
```bash
uvicorn app.main:app --reload
```

The API will be available at:

http://127.0.0.1:8000/health  
http://127.0.0.1:8000/docs  

---

### Design Philosophy
This project prioritizes:
- Backend correctness over UI
- Clear system boundaries
- Automation-friendly workflows
- Incremental evolution from scripts to services

No frontend is required to demonstrate backend capability.

---

### Status
🚧 Active development

---

### License
MIT License

