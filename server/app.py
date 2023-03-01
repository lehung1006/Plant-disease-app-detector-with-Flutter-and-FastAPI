from fastapi import FastAPI

from server.routes.plant import router as PlantRouter

app = FastAPI()

app.include_router(PlantRouter, tags=["Plant"], prefix="/plant")


@app.get("/", tags=["Root"])
async def read_root():
    return {"message": "Welcome to this Plants app!"}



