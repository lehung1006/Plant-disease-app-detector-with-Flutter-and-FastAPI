from keras.models import load_model
import numpy as np



def read_labels():
    labels = []
    with open('./ultils/classify/leafdisease/labels.txt') as f:
        for line in f:
            labels.append(line.strip())
    return labels


labels = read_labels()


def get_model():
    model = load_model('./ultils/classify/leafdisease/model.h5', compile=False)
    return model


def classify(img):
    model = get_model()
    img = img.resize((224, 224))
    x = np.array(img)
    x = np.expand_dims(x, axis=0)
    x = x/255.0
    pred = model.predict(x)
    return labels[np.argmax(pred)]
