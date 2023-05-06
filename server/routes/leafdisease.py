from fastapi import APIRouter, HTTPException
import base64
from io import BytesIO
from PIL import Image
from database.leafdisease.leafdisease import (
    retrieve_leaf_diseaes,
    retrieve_leafdisease_by_id,
    retrieve_leafdisease_by_label,
)
from model.plant import (
    Im,
    ErrorResponseModel,
    ResponseModel,)
from utils.classify.leafdisease.leafdiseaseclassify import classify
CLASSIFYDIR = "./ultils/classify/images"

router = APIRouter()

@router.get("/", response_description="get all leafdisease: name and description")
async def get_leafdisease():
    leafdisease = await retrieve_leaf_diseaes()
    if leafdisease:
        return ResponseModel(leafdisease, "leafdisease data retrieved successfully")
    return ResponseModel(leafdisease, "Empty list returned")


@router.get("/leafdisease/", response_description="get info of leafdisease by id")
async def get_leafdisease_data_by_id(id: str):
    leafdisease = await retrieve_leafdisease_by_id(id)
    if leafdisease:
        return ResponseModel(leafdisease, "leafdisease data retrieved successfully")
    raise HTTPException(status_code=404, detail="leafdisease doesn't exist")


@router.get("/labels/", response_description="get all leafdisease: name and description")
async def get_leafdisease_by_label(label: str):
    leafdisease = await retrieve_leafdisease_by_label(label)
    if leafdisease:
        return ResponseModel(leafdisease, "leafdisease data retrieved successfully")
    raise HTTPException(status_code=404, detail="leafdisease doesn't exist")


@router.post("/leafdisease_classify", response_description="get all leafdisease: name and description")
async def leafdisease_classify(im: Im):
    img64 = im.dict()
    imgcode = img64['img']
    imgdata = base64.b64decode(imgcode)
    im_file = BytesIO(imgdata)
    img = Image.open(im_file)
    label = classify(img)
    if label == "Uknown":
        return ResponseModel({}, "Not sure")
    elif label == "NULL":
        return ResponseModel(None, "No leaf in picture")
    elif label =="healthy":
        return ResponseModel("", "healthy")
    else:
        leafdisease = await retrieve_leafdisease_by_label(label)
        return ResponseModel(leafdisease, "classify successfully")
