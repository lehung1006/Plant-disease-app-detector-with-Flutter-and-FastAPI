import os
f = open('D:/Plant-disease-detection-app-with-Flutter-and-FastAPI/server/ultils/classify/leafdisease/labels.txt', encoding='utf-8')
for l in f.readlines():
    foldername = l.strip()
    if not os.path.exists('D:/Plant-disease-detection-app-with-Flutter-and-FastAPI/server/images/leafdisease/' + foldername):
        os.mkdir('D:/Plant-disease-detection-app-with-Flutter-and-FastAPI/server/images/leafdisease/' + foldername)