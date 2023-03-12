from fastapi import FastAPI

from routes.plants import router as PlantRouter
from routes.leafdisease import router as LeafDiseaseRouter
app = FastAPI()

app.include_router(PlantRouter, tags=["Plants"], prefix="")
app.include_router(LeafDiseaseRouter, tags=["APP"], prefix="")


@app.get("/", tags=["Root"])
async def read_root():
    return {"message": "Welcome to this Plants app!"}
