from bson.objectid import ObjectId
import motor.motor_asyncio
import base64
from io import BytesIO
from PIL import Image
from os import listdir
MONGO_DETAILS = "mongodb+srv://hancao509:ZFusyatSnBhLssxy@plants.m72durs.mongodb.net/?retryWrites=true&w=majority"
def get_db():
    client = motor.motor_asyncio.AsyncIOMotorClient(MONGO_DETAILS)
    database = client.Plants
    return database


def get_image(imagepath):
    res = []
    for f in listdir(imagepath):
        img = Image.open(imagepath + '/' + f)
        if img.mode != 'RGB':
            img = img.convert('RGB')
        im_file = BytesIO()
        img.save(im_file, format="JPEG")
        im_bytes = im_file.getvalue()
        im_b64 = base64.b64encode(im_bytes)
        res.append(im_b64)
        img.close()
    return res
