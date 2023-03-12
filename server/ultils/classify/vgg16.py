from keras.models import load_model
import numpy as np
import base64
from tensorflow.keras.preprocessing import image
import os

IMGDIR = "./ultils/classify/images/"


def read_labels():
    c = 0
    labels = {}
    with open('./ultils/classify/labels.txt') as f:
        for line in f:
            labels[c] = line.strip()
            c += 1
    return labels


labels = read_labels()




def get_model():
    model = load_model('./ultils/classify/model.h5', compile=False)
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
