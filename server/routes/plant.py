from fastapi import APIRouter, Body, UploadFile, File
from fastapi.encoders import jsonable_encoder
import base64
from server.database import (
    add_plant,
    delete_plant,
    retrieve_plant,
    retrieve_plants,
    retrieve_plant_by_no,
    update_plant,
)
from server.models.plant import (
    ErrorResponseModel,
    ResponseModel,
    PlantSchema,
    UpdatePlantModel,
)
from server.ultils.classify.vgg16 import classify
from server.ultils.detect.pestdetection import detect
import uuid
CLASSIFYDIR = "./server/ultils/classify/images"
DETECTDIR = "./server/ultils/detect/images"
router = APIRouter()


@router.get("/", response_description="Plants retrieved")
async def get_plants():
    plants = await retrieve_plants()
    if plants:
        return ResponseModel(plants, "Plants data retrieved successfully")
    return ResponseModel(plants, "Empty list returned")


@router.get("/{no}", response_description="Plant data retrieved by no")
async def get_plant_data_by_no(no):
    plant = await retrieve_plant_by_no(no)
    if plant:
        return ResponseModel(plant, "Plant data retrieved successfully")
    return ErrorResponseModel("An error occurred.", 404, "Plant doesn't exist.")


@router.post("/classify/{image}", response_description="Predicted plant data retrieved")
async def predict_image(file: UploadFile = File(...)):
    file.filename = f"{uuid.uuid4()}.jpg"
    contents = await file.read()
    with open(f"{CLASSIFYDIR}/{file.filename}", "wb") as f:
        f.write(contents)
    plant = classify(file.filename)
    return ResponseModel(plant, "Plant data retrieved successfully")


@router.post('/detect/{image}', response_description="Predicted plant data retrieved")
async def detect_image(file: UploadFile = File(...)):
    file.filename = f"{uuid.uuid4()}.jpg"
    contents = await file.read()
    with open(f"{DETECTDIR}/{file.filename}", "wb") as f:
        f.write(contents)
    plant = detect(file.filename)
    return ResponseModel(plant, "Plant data retrieved successfully")
