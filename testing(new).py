from tensorflow.keras.models import load_model
import os
from PIL import Image
import numpy as np
import streamlit as st
from tensorflow.keras.applications import Xception
from tensorflow.keras.preprocessing import image
from tensorflow.keras.applications.xception import preprocess_input
from tensorflow.keras.models import Model
from tensorflow.keras.layers import GlobalAveragePooling2D

import numpy as np
import cv2
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.image import ImageDataGenerator, img_to_array, load_img, array_to_img
import random,os,glob
import matplotlib.pyplot as plt
import keras
from keras.preprocessing import image

import mysql.connector
mydb = mysql.connector.connect(host="localhost", user="root", password="", database="insect_detection")
mycursor = mydb.cursor()
mycursor.execute("SELECT uploadimg FROM tbl_uploadimg ORDER BY id DESC LIMIT 1")
myresult = mycursor.fetchall()
testing = str(myresult)
testing = testing.replace('[(', '')
testing = testing.replace(',)]', '')
testing = testing.replace("'", "")

# Define the path to the folder containing the saved features file
feature_folder = 'C:\\xampp\\htdocs\\insect_detection\\featuresCollection'

# Initialize Xception model with pre-trained weights from ImageNet
base_model = Xception(weights='imagenet', include_top=False)

# Add a global average pooling layer on top of the base model
x = GlobalAveragePooling2D()(base_model.output)

# Define a new model with the custom global average pooling layer
feature_extraction_model = Model(inputs=base_model.input, outputs=x)

# Function to extract features from an image
def extract_features(img_path):
    img = image.load_img(img_path, target_size=(299, 299))  # Xception requires input size of (299, 299)
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    x = preprocess_input(x)
    features = feature_extraction_model.predict(x)
    return features

# Load the saved features from the dataset
dataset_features = np.load(os.path.join(feature_folder, "all_features.npy"))

# Function to compute similarity between two feature vectors
def compute_similarity(input_features, dataset_features):
    # Compute Euclidean distance between input features and dataset features
    distances = np.linalg.norm(input_features - dataset_features, axis=1)
    return distances

# Function to check if input image matches any of the stored features
def match_features(input_features, dataset_features, threshold_percentage):
    distances = compute_similarity(input_features, dataset_features)
    min_distance = np.min(distances)
    
    print(min_distance)
    
    # Calculate the maximum possible distance between feature vectors
    max_distance = np.sqrt(np.sum(np.square(input_features)) + np.sum(np.square(dataset_features), axis=1))
    
    # Calculate the threshold distance based on the specified percentage
    threshold_distance = max_distance * threshold_percentage
    
    # Check if a match is found based on the threshold distance
    if min_distance <= 7:
        result="Needed image"
    else:
        result="invalid"
    return result


img_path = 'C:/xampp/htdocs/insect_detection/images/'+ testing
# Display image and checkbox
uploaded_file =img_path

# Show prediction message and precautionary methods only when image is uploaded and matches
if uploaded_file is not None:
    # Load and preprocess the uploaded image
    img = image.load_img(uploaded_file, target_size=(299, 299))  # Xception requires input size of (299, 299)
    st.image(img, caption='Uploaded Image', use_column_width=True)

    # Extract features from the uploaded image
    input_features = extract_features(uploaded_file)

    # Specify the threshold percentage (e.g., 50%)
    threshold_percentage = 0.8

    # Check if input image matches any of the stored features
    min_distance = match_features(input_features, dataset_features, threshold_percentage)

if min_distance=='Needed image':
    dir_path = 'C:/xampp/htdocs/insect_detection/dataset'
    img_list = glob.glob(os.path.join(dir_path, '*/*.jpg'))
    #print(len(img_list))


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
    #print(labels)

    labels = dict((v,k) for k,v in labels.items())
    #print(labels)

    model = load_model('trained_model.h5')

    #img_path = 'C:/Users/Hp/OneDrive/Desktop/FINAL_PROJECT/dataset/AdultStage_5/03457.jpg'
    #print(img_path)

    img = image.load_img(img_path, target_size=(300, 300))
    img = image.img_to_array(img, dtype=np.uint8)
    img=np.array(img)/255.0

    plt.title("Loaded Image")
    plt.axis('off')
    plt.imshow(img.squeeze())

    p=model.predict(img[np.newaxis, ...])
    ##print(p[0][-1])
    ##
    ##if p[0][-1]>= 0.5:
    ##    printf("unknown")
    ##else:
    ##    predicted_class = labels[np.argmax(p[0], axis=-1)]
    ##    print("Classified:",predicted_class)

    #print("Maximum Probability: ",np.max(p[0], axis=-1))
    predicted_class = labels[np.argmax(p[0], axis=-1)]
    #print("Classified:",predicted_class)
    mydb = mysql.connector.connect(host="localhost",user="root",password="",database="insect_detection")
    mycursor = mydb.cursor()
    id="1"
    sql2 = "UPDATE tblresult SET outputresult = %s WHERE id = %s"
    val = (str(predicted_class),id)

    mycursor.execute(sql2, val)
    mydb.commit()
    
else:
    predicted_class="Invalid Input"
    mydb = mysql.connector.connect(host="localhost",user="root",password="",database="insect_detection")
    mycursor = mydb.cursor()
    id="1"
    sql2 = "UPDATE tblresult SET outputresult = %s WHERE id = %s"
    val = (str(predicted_class),id)
    mycursor.execute(sql2, val)
    mydb.commit()

import tensorflow as tf
from tensorflow.keras import models

# Load your trained model
model = models.load_model('trained_model.h5')

# Load and preprocess a sample image from your dataset
# For example, using TensorFlow's image preprocessing utilities
image_path = img_path
image = tf.keras.preprocessing.image.load_img(image_path, target_size=(300, 300))
image = tf.keras.preprocessing.image.img_to_array(image)
image = tf.expand_dims(image, axis=0)  # Add batch dimension
image = image / 255.0  # Normalize pixel values

# Extract feature maps from a specific layer
layer_name = 'conv2d_1'  # Example layer name
intermediate_layer_model = tf.keras.Model(inputs=model.input,
                                           outputs=model.get_layer(layer_name).output)
feature_maps = intermediate_layer_model.predict(image)

# Visualize feature maps
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

# Assuming feature_maps.shape[-1] is the number of feature maps
num_feature_maps = min(feature_maps.shape[-1], 16)  # Limit to 16 feature maps for a 4x4 grid
plt.figure(figsize=(10, 10))
for i in range(num_feature_maps):
    plt.subplot(4, 4, i + 1)
    plt.imshow(feature_maps[0, :, :, i], cmap='gray')  # Assuming grayscale images
    plt.axis('off')
plt.savefig('plot.png')