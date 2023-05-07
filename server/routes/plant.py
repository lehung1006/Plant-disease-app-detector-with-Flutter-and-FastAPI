from fastapi import APIRouter, HTTPException
import base64
from io import BytesIO
from PIL import Image
from database.plants.plants import (
    retrieve_plants,
    retrieve_plant_by_id,
    retrieve_plant_by_name,
)
from model.plant import (
    ErrorResponseModel,
    ResponseModel,
    Im
)
from utils.classify.plants.plantsclassify import classify
router = APIRouter()


@router.get("/", response_description="get all plants: name and description")
async def get_plants():
    plants = await retrieve_plants()
    if plants:
        return ResponseModel(plants, "Plants data retrieved successfully")
    return ResponseModel(plants, "Empty list returned")


@router.get("/plant/", response_description="get info of plant by id")
async def get_plant_data_by_id(id: str):
    plant = await retrieve_plant_by_id(id)
    if plant:
        return ResponseModel(plant, "Plant data retrieved successfully")
    raise HTTPException(status_code=404, detail="Plant doesn't exist")


@router.post("/plants_classify", response_description="plants classify")
async def classify_plants(im: Im):
    img64 = im.dict()
    imgcode = img64['img']
    imgdata = base64.b64decode(imgcode)
    im_file = BytesIO(imgdata)
    img = Image.open(im_file)
    label = classify(img)
    if label == "Unknown":
        return ResponseModel({}, "classify successfully")
    elif label == "NULL":
        return ResponseModel(None, "classify successfully")
    else:
        plant = await retrieve_plant_by_name(label)
        return ResponseModel(plant, "classify successfully")
