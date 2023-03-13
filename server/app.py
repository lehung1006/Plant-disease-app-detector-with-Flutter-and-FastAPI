from fastapi import FastAPI
from routes.root import router as RootRouter
from routes.plants import router as PlantRouter
from routes.leafdisease import router as LeafDiseaseRouter
from routes.pest import router as PestRouter
app = FastAPI()
app.include_router(RootRouter, tags=["Root"], prefix="")
app.include_router(PlantRouter)
app.include_router(PestRouter)
app.include_router(LeafDiseaseRouter)


@app.get("/", tags=["Root"])
async def read_root():
    return {"message": "Welcome to this Plants app!"}
