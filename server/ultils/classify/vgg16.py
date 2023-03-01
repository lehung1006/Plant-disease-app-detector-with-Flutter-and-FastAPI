from keras.models import load_model
import numpy as np
import base64
from tensorflow.keras.preprocessing import image
import os

IMGDIR = "./server/ultils/classify/images/"


def read_labels():
    c = 0
    labels = {}
    with open('./server/ultils/classify/labels.txt') as f:
        for line in f:
            labels[c] = line.strip()
            c += 1
    return labels


labels = read_labels()


def convert_img(imgbase64):
    # convert base64 to image
    imgdata = base64.b64decode(imgbase64)
    # resize image to 224x224
    img = image.load_img(imgdata, target_size=(224, 224))
    # convert image to array
    img = image.img_to_array(img)
    # add 1 more dimension
    img = np.expand_dims(img, axis=0)
    # normalize
    img = img/255
    return img


def get_model():
    model = load_model('./server/ultils/classify/model.h5', compile=False)
    return model


def classify(img):

    test_image = image.load_img(
        IMGDIR + img, target_size=(224, 224))
    test_image = image.img_to_array(test_image)
    test_image = np.expand_dims(test_image, axis=0)
    model = get_model()
    # predict
    prediction = model.predict(test_image)
    # get label
    label = labels[np.argmax(prediction)]
    # delete image
    os.remove(IMGDIR + img)

    return label
