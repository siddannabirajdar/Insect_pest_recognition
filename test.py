import numpy as np
import cv2
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.image import ImageDataGenerator, img_to_array, load_img, array_to_img
import random,os,glob
import matplotlib.pyplot as plt
import keras
from keras.preprocessing import image

dir_path = 'C:/Users/Hp/OneDrive/Desktop/Testing/dataset/'
img_list = glob.glob(os.path.join(dir_path, '*/*.jpg'))
print(len(img_list))


train=ImageDataGenerator(horizontal_flip=True,
                         vertical_flip=True,
                         validation_split=0.1,
                         rescale=1./255,
                         shear_range = 0.1,
                         zoom_range = 0.1,
                         width_shift_range = 0.1,
                         height_shift_range = 0.1,)

test=ImageDataGenerator(rescale=1/255,
                        validation_split=0.1)

train_generator=train.flow_from_directory(dir_path,
                                          target_size=(300,300),
                                          batch_size=32,
                                          class_mode='categorical',
                                          subset='training')

test_generator=test.flow_from_directory(dir_path,
                                        target_size=(300,300),
                                        batch_size=32,
                                        class_mode='categorical',
                                        subset='validation')

labels = (train_generator.class_indices)
print(labels)

labels = dict((v,k) for k,v in labels.items())
print(labels)

model = load_model('trained_model.h5')

img_path = 'C:/Users/Hp/OneDrive/Desktop/Testing/kk.jpg'

img = image.load_img(img_path, target_size=(300, 300))
img = image.img_to_array(img, dtype=np.uint8)
img=np.array(img)/255.0

plt.title("Loaded Image")
plt.axis('off')
plt.imshow(img.squeeze())

p=model.predict(img[np.newaxis, ...])
if p[0][0] >= 0.4:
        print("Maximum Probability: ",np.max(p[0], axis=-1))
        predicted_class = labels[np.argmax(p[0], axis=-1)]
        print("Classified:",predicted_class)
else:
        print("Invalid")


