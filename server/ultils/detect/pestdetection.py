
from os import listdir
import torch
import pickle
from ultils.detect.featureextract import encode_image
import numpy as np
from numpy.linalg import norm
from PIL import Image
DIR_REPO = './ultils/detect/yolov5/'
DIR_MODEL = './ultils/detect/best.pt'


def get_model():
    model = torch.hub.load(DIR_REPO, 'custom', path=DIR_MODEL, source='local')
    return model


def get_labels(vec):
    labels = []
    db = []
    with open('img_labels.pkl', 'rb') as f:
        labels = pickle.load(f)
    with open('img_ft.pkl', 'rb') as f:
        db = pickle.load(f)
    vec = np.array(vec)[0]
    db = np.array(db)
    db = db.reshape(db.shape[0], 102)
    cosines = np.dot(db, vec)/(norm(db, axis=1)*norm(vec))
    cos_lb = [(cosines[i], labels[i]) for i in range(len(cosines))]
    cos_lb.sort(reverse=True, key=lambda x: x[0])
    res = [i[1] for i in cos_lb[:5]]
    return list(set(res))


def detect(im):
    '''
    Detects objects in an image
    :param image: image to detect objects in
    :return: labels of objects detected'''
    model = get_model()
    results = model(im)
    if len(results.xyxy[0]) > 0:
        cropimage = results.crop(save=False)
        img = Image.fromarray(cropimage[0]['im'])
        img = img.convert('RGB')
        vec = encode_image(img)
        return get_labels(vec)
    return []
