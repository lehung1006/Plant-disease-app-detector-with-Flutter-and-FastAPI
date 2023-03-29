from fastapi import FastAPI
from routes import plant, leafdisease, pest

app = FastAPI()

app.include_router(plant.router, prefix="/plants", tags=["Plants"])
app.include_router(leafdisease.router,
                   prefix="/leafdiseases", tags=["Leafdisease"])
app.include_router(pest.router, prefix="/pests", tags=["Pest"])

@app.get("/", tags=["Root"])
async def read_root():
    return {"message": "Welcome to this Plants app!"}
