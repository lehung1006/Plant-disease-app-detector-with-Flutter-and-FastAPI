from fastapi import APIRouter, HTTPException
from PIL import Image
from io import BytesIO
import base64
from database.pests.pests import (
    retrieve_pests,
    retrieve_pest_by_id,
    retrieve_pest_by_label
)
from model.plant import (
    Im,
    ResponseModel,
)
from utils_model.detect.pestdetection import detect

router = APIRouter()


@router.get("/", response_description="get all pests: name and description")
async def get_pests():
    pests = await retrieve_pests()
    if pests:
        return ResponseModel(pests, "Pests data retrieved successfully")
    return ResponseModel(pests, "Empty list returned")


@router.get("/pest/", response_description="get info of pest by id")
async def get_pest_data_by_id(id: str):
    pest = await retrieve_pest_by_id(id)
    if pest:
        return ResponseModel(pest, "Pest data retrieved successfully")
    raise HTTPException(status_code=404, detail="Pest doesn't exist")


@router.post("/detection", response_description="pest detection")
async def pest_detection(im: Im):
    img64 = im.dict()
    imgcode = img64['img']
    imgdata = base64.b64decode(imgcode)
    im_file = BytesIO(imgdata)
    img = Image.open(im_file)
    im, res = detect(img)
    pests = []
    if len(res) > 0:
        for labels in res:
            tmp = []
            for label in labels:
                print(label)
                pest = await retrieve_pest_by_label(label)
                tmp.append(pest)
            pests.append(tmp)
        result = {
            'pests': pests,
            'image': im
        }
        # convert dict to json
        return ResponseModel(result, "Pest data retrieved successfully")

    return ResponseModel([], "Empty list returned")
