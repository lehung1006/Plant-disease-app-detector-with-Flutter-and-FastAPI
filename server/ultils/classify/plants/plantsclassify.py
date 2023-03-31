from keras.models import load_model
import numpy as np
from config import settings


def get_labels():
    labels = []
    with open(settings.PLANT_CLASSIFY_LABELS_PATH, "r", encoding="utf-8") as f:
        for line in f:
            labels.append(line.strip())
    return labels


labels = get_labels()


def get_model():
    model = load_model(
        settings.PLANT_CLASSIFY_MODEL_PATH, compile=False)
    return model


def classify(img):
    model = get_model()
    img = img.resize((224, 224))
    x = np.array(img)
    x = np.expand_dims(x, axis=0)
    x = x/255.0
    pred = model.predict(x)
    return labels[np.argmax(pred)]
