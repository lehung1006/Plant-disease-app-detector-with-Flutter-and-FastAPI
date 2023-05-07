from keras.models import load_model
import tensorflow as tf
import numpy as np
from tensorflow.keras.preprocessing import image
from tensorflow.keras.applications.vgg16 import preprocess_input


def get_extract_model():
    model = load_model('./utils_model/detect/featureextract.h5')
    model.layers.pop()
    model = tf.keras.Model(inputs=model.inputs,
                           outputs=model.layers[-1].output)
    return model


def encode_image(img):
    model = get_extract_model()
    img = img.resize((224, 224))
    # convert the image pixels to a numpy array
    x = image.img_to_array(img)
    # reshape data for the model
    x = np.expand_dims(x, axis=0)
    # prepare the image for the VGG model
    x = preprocess_input(x)
    # get features
    feature = model.predict(x)
    return feature
