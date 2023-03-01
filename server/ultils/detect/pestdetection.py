import torch
import os
from tensorflow.keras.preprocessing import image
DIR_REPO = './server/ultils/detect/yolov5/'
DIR_MODEL = './server/ultils/detect/best.pt'
DIR_IMG = './server/ultils/detect/images/'


def get_model():
    model = torch.hub.load(DIR_REPO, 'custom', path=DIR_MODEL, source='local')
    return model


def detect(imgname):
    model = get_model()
    img = image.load_img(DIR_IMG + imgname, target_size=(416, 416))
    results = model(img)
    results.save()
    if len(results.xyxy[0]) > 0:
        return True
    return False
