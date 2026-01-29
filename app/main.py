from fastapi import FastAPI

app = FastAPI(title="MTG Meta API")

@app.get("/health")
def health():
    return {"status": "ok"}
