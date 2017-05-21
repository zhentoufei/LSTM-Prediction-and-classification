# -*- coding: utf-8 -*-  
from matplotlib import pyplot  
import scipy as sp  
import numpy as np  
from sklearn.datasets import load_files  
from sklearn.cross_validation import train_test_split  
from sklearn.feature_extraction.text import  CountVectorizer  
from sklearn.feature_extraction.text import  TfidfVectorizer  
from sklearn.naive_bayes import MultinomialNB  
from sklearn.metrics import precision_recall_curve  
from sklearn.metrics import classification_report  
from keras.utils import np_utils

def WriteFile(FileToWritePath, ContentOfFile):
    csvfile = file(FileToWritePath,'wb')
    writer = csv.writer(csvfile)
    writer.writerows(ContentOfFile)
    csvfile.close()
def ReadAllFile():
    print 'start read!'
    subject101 = np.loadtxt(open("nw//subject101.txt","rb"),dtype=str,delimiter=" ")
    subject102 = np.loadtxt(open("nw//subject102.txt","rb"),dtype=str,delimiter=" ")
    subject103 = np.loadtxt(open("nw//subject103.txt","rb"),dtype=str,delimiter=" ")
    subject104 = np.loadtxt(open("nw//subject104.txt","rb"),dtype=str,delimiter=" ")
    subject105 = np.loadtxt(open("nw//subject105.txt","rb"),dtype=str,delimiter=" ")
    subject106 = np.loadtxt(open("nw//subject106.txt","rb"),dtype=str,delimiter=" ")
    subject107 = np.loadtxt(open("nw//subject107.txt","rb"),dtype=str,delimiter=" ")
    subject108 = np.loadtxt(open("nw//subject108.txt","rb"),dtype=str,delimiter=" ")
    subject109 = np.loadtxt(open("nw//subject109.txt","rb"),dtype=str,delimiter=" ")
    print 'end read!'
    data=np.concatenate((subject108,subject105,subject103,subject106,subject101,subject102,subject104,subject107,subject109))
    print data.shape
    #data=np.concatenate((subject101,subject102))
    X_train=data[0:data.shape[0],3:data.shape[1]]
    y_train=data[0:data.shape[0],1]
    X_test=data[1000000:data.shape[0],3:data.shape[1]]
    y_test=data[1000000:data.shape[0],1]
    print('X_train shape:',X_train.shape,'x_test shape: ', X_test.shape)
    print 'Finish ReadAllFile!'
    return X_train[0:1000],y_train[0:1000],X_test[0:1000],y_test[0:1000]

def normalize(X_train,X_test):
    print 'start normalization!'
    X_train, X_test = X_train.astype('float32'), X_test.astype('float32')
    X_mean, X_std = np.mean(X_train), np.std(X_train)
    X_train, X_test = (X_train - X_mean) / X_std, (X_test - X_mean) / X_std
    print 'end normalization!'
    return X_train,X_test

def onehotCategory(y_train,y_test):
    print 'start onehotCategory!'
    Y_train = np_utils.to_categorical(y_train,25).astype('float32')
    Y_test = np_utils.to_categorical(y_test,25).astype('float32')
    print 'end onehotCategory!'
    return Y_train,Y_test

def countListEle(list):
    mylist = list.tolist()
    myset = set(mylist) 
    for item in myset: 
         print mylist.count(item), " of ", item, " in list"

x_train,y_train,x_test,y_test=ReadAllFile()
# x_train, x_test = x_train.astype('float32'), x_test.astype('float32')
# y_train, y_test = y_train.astype('float32'), y_test.astype('float32')
#x_train,y_test=normalize(x_train,x_test)
#y_train,y_test=onehotCategory(y_train,y_test)    
#调用MultinomialNB分类器  
# x_train = np.random.randint(5, size=(6, 100))
# y_train = np.array([1, 2, 3, 4, 5, 6])
# x_test = x_train[2:3]
# y_test = y_train[2:3]
# clf = MultinomialNB().fit(x_train, y_train)  
# doc_class_predicted = clf.predict(x_test)  
      
# #print(doc_class_predicted)  
# #print(y)  
# print(np.mean(doc_class_predicted == y_test))  
  
# #准确率与召回率  
# precision, recall, thresholds = precision_recall_curve(y_test, clf.predict(x_test))  
# answer = clf.predict_proba(x_test)[:,1]  
# report = answer > 0.5  
# print(classification_report(y_test, report, target_names = ['neg', 'pos']))  