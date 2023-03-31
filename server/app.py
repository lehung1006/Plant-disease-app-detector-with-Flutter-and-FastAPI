from fastapi import FastAPI
from routes import plant, leafdisease, pest, auth, user

app = FastAPI()

app.include_router(plant.router, prefix="/plants", tags=["Plants"])
app.include_router(leafdisease.router,
                   prefix="/leafdiseases", tags=["Leafdisease"])
app.include_router(pest.router, prefix="/pests", tags=["Pest"])
app.include_router(auth.router, prefix="/auth", tags=["Auth"])
app.include_router(user.router, prefix="/user", tags=["User"])


@app.get("/", tags=["Root"])
async def read_root():
    return {"message": "Welcome to this Plants app!"}
