from routes.root import router
from database.plants.plants import (
    retrieve_plants,
    retrieve_plant_by_id,
)
from model.plant import (
    ErrorResponseModel,
    ResponseModel,
)


@router.get("/plants", response_description="get all plants: name and description")
async def get_plants():
    plants = await retrieve_plants()
    if plants:
        return ResponseModel(plants, "Plants data retrieved successfully")
    return ResponseModel(plants, "Empty list returned")


@router.get("/plants/plant/{id}", response_description="get info of plant by id")
async def get_plant_data_by_id(id: str):
    plant = await retrieve_plant_by_id(id)
    if plant:
        return ResponseModel(plant, "Plant data retrieved successfully")
    return ErrorResponseModel("An error occurred.", 404, "Plant doesn't exist.")


# @router.post("/classify", response_description="Predicted plant data retrieved")
# async def predict_image(img64: Item):
#     img64 = img64.dict()
#     imgcode = img64['img']
#     imgdata = base64.b64decode(imgcode)
#     filename = f"{uuid.uuid4()}.jpg"
#     with open(f"{CLASSIFYDIR}/{filename}", "wb") as f:
#         f.write(imgdata)
#     plant = classify(filename)
#     return ResponseModel(plant, "Plant data retrieved successfully")


# @router.post('/detect', response_description="Predicted plant data retrieved")
# async def detect_image(img64: Item):
#     img64 = img64.dict()
#     imgcode = img64['img']
#     imgdata = base64.b64decode(imgcode)
#     filename = f"{uuid.uuid4()}.jpg"
#     with open(f"{DETECTDIR}/{filename}", "wb") as f:
#         f.write(imgdata)
#     plant = detect(filename)
#     return ResponseModel(plant, "Plant data retrieved successfully")
