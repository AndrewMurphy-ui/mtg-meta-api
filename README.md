### mtg-archetype-trends-api
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/fba020a0-b20a-47c8-9c07-d0d15c6f904f" />

### Overview
MTG Archetype Trends API is a Python-based backend service for tracking **archetype-level metagame trends** in *Magic: The Gathering*.

Rather than presenting static meta snapshots, the system focuses on **directional change**—identifying which cards are being adopted or cut within specific archetypes over time. The API is designed to support downstream tools, automation, and decision-making workflows.

This project emphasizes backend engineering fundamentals: clear system boundaries, outcome-driven workflows, stable API contracts, and reproducible data pipelines.

---

## Current Capabilities

At its current stage, the project provides:

- A structured Python backend codebase
- A FastAPI application with a health check endpoint
- Modular ingestion and analysis logic prepared for API exposure
- Clear separation between application code, scripts, data, SQL, and tests

This establishes a production-oriented foundation rather than a one-off analysis script.

---

## Planned Capabilities (In Progress)

The intended backend workflow is:

1. MTG deck or frequency data is ingested
2. Data is validated and normalized
3. Time-windowed meta statistics are computed
4. Results are stored and reused
5. Clients retrieve results via API endpoints or exports

Planned features include:

- Archetype trend endpoints (e.g. `/meta/archetypes/{format}/{archetype}/trends`)
- Global card trend endpoints
- Persistent storage using a database
- Background processing for scheduled analysis jobs
- CLI tooling for automation and integration
- Expanded automated testing and CI

---

## Analysis Pipeline & Workflow Design

The system is intentionally designed as a **multi-stage analysis pipeline**, with explicit outcomes at each stage. This reflects real production environments, where not all data paths succeed and systems must respond differently depending on conditions.

### Pipeline Stages

1. **Ingestion**
   - Decklists are ingested from external sources.
   - Each record is associated with a format, archetype, and event date.

2. **Validation**
   - The system verifies that sufficient data exists for analysis.
   - Minimum sample thresholds are enforced to prevent misleading trends.

3. **Analysis**
   - Card inclusion rates are computed for both the current and baseline windows.
   - Deltas are calculated to determine trend direction (↑ ↓ →).

4. **Publication**
   - Results are exposed through API endpoints.
   - Metadata includes confidence and validation status.

---

### Outcome-Based Workflow

Rather than assuming a single “happy path,” the pipeline explicitly models **different outcomes**:

- **Pass**
  - Data meets validation thresholds.
  - Analysis proceeds and results are returned normally.

- **Warn**
  - Data is present but below ideal confidence levels.
  - Results are returned with warnings indicating reduced reliability.

- **Fail**
  - Data is insufficient or invalid.
  - Analysis is halted and a structured error response is returned.

Example responses:

```json
{
  "status": "ok",
  "confidence": "high",
  "results": { ... }
}
{
  "status": "warn",
  "confidence": "low",
  "reason": "insufficient sample size (18 decks)",
  "results": { ... }
}
{
  "status": "fail",
  "error": "not enough data to compute trends"
}
```
## API Overview

### Health Check


GET /health

```json
{
  "status": "ok"
}

```



### Archetype Trends (Stub)

```text 
GET /meta/trends?format=modern&archetype=izzet-murktide&window_days=30
```
```json
{
  "status": "ok",
  "format": "modern",
  "archetype": "izzet-murktide",
  "window_days": 30,
  "baseline_days": 30,
  "confidence": "low",
  "cards": [
    { "name": "Lightning Bolt", "delta": 0.12, "trend": "up" },
    { "name": "Spell Pierce", "delta": -0.08, "trend": "down" },
    { "name": "Counterspell", "delta": 0.00, "trend": "flat" }
  ]
}
```


