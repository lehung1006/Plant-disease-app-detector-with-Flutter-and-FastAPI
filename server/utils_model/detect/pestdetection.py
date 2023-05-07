
from PIL import Image
from numpy.linalg import norm
import numpy as np
from utils_model.detect.featureextract import encode_image
import pickle
import torch
import cv2 as cv
import base64
from io import BytesIO
from config import settings


def get_model():
    model = torch.hub.load(settings.YOLO_REPO_PATH, 'custom',
                           path=settings.YOLO_WEIGHTS_PATH, source='local')
    return model


def get_labels(vec):
    labels = []
    db = []
    with open(settings.ENCODER_LABELS_PATH, 'rb') as f:
        labels = pickle.load(f)
    with open(settings.ENCODER_PATH, 'rb') as f:
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
    im = np.array(im)
    color = (46, 204, 113)
    thickness = 2  # set thickness to -1 to fill rectangle
    linetype = cv.LINE_AA
    i = 1
    res = []
    if len(results.xyxy[0]) > 0:
        cropimage = results.crop(save=False)
        for bbx in cropimage:
            # convert list tensor to numpy array
            print("confidence: ", bbx['conf'])
            img = Image.fromarray(cropimage[0]['im'])
            img = img.convert('RGB')
            vec = encode_image(img)
            res.append(get_labels(vec))
            xmin, ymin, xmax, ymax = bbx['box']
            xmin, ymin, xmax, ymax = int(xmin), int(ymin), int(xmax), int(ymax)
            im = cv.rectangle(im, (xmin, ymin), (xmax, ymax),
                              color, thickness, linetype)
            # create background for text
            im = cv.rectangle(im, (xmin, ymin-12), (xmin + 20, ymin),
                              color, -1, linetype)

            im = cv.putText(im, str(i), (xmin+5, ymin-2),
                            cv.FONT_HERSHEY_SIMPLEX, .4, (255, 255, 255), 1, cv.LINE_AA)
            i += 1
        im = cv.cvtColor(im, cv.COLOR_BGR2RGB)
        # convert numpy array to base64
        _, im = cv.imencode('.jpg', im)
        im = base64.b64encode(im)
        im = im.decode('utf-8')
        return im, res
    return [], []
