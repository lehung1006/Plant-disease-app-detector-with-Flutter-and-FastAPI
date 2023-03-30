from config import settings
import motor.motor_asyncio
import base64
from io import BytesIO
from PIL import Image
from os import listdir


def get_db():
    client = motor.motor_asyncio.AsyncIOMotorClient(settings.DATABASE_URL)
    database = client[settings.MONGO_INITDB_DATABASE]
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
