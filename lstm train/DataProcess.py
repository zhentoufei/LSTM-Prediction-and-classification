import numpy as np
import matplotlib.pyplot as plt
import numpy as np
from keras.callbacks import Callback
from keras.datasets import mnist
from keras.layers import Dense, LSTM,Dropout
from keras.models import Sequential
from keras.utils import np_utils
from keras.optimizers import Adadelta
import csv
class AccHistory(Callback):
    def on_train_begin(self, logs={}):
        self.losses = []

    def on_batch_end(self, batch, logs={}):
        self.losses.append(logs.get('acc'))


class LossHistory(Callback):
    def on_train_begin(self, logs={}):
        self.losses = []

    def on_batch_end(self, batch, logs={}):
        self.losses.append(logs.get('loss'))

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

	#data=np.concatenate((subject101,subject102))
	X_train=data[0:data.shape[0],3:data.shape[1]]
	y_train=data[0:data.shape[0],1]
	X_test=data[1000000:data.shape[0],3:data.shape[1]]
	y_test=data[1000000:data.shape[0],1]
	print('X_train shape:',X_train.shape,'x_test shape: ', X_test.shape)
	print 'Finish ReadAllFile!'
	return X_train,y_train,X_test,y_test

def normalize(X_train,X_test):
	print 'start normalization!'
	X_train = X_train.reshape(X_train.shape[0], X_train.shape[1], 1)
	X_test = X_test.reshape(X_test.shape[0], X_test.shape[1], 1)
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
X_train,y_train,X_test,y_test=ReadAllFile()
X_train,X_test=normalize(X_train,X_test)
Y_train,Y_test=onehotCategory(y_train,y_test)


'''model_LSTM.add(LSTM(128, input_shape=(X_train.shape[1], 1),inner_init='normal'))
model_LSTM.add(Dropout(0.5))
model_LSTM.add(Dense(input_dim=128,  
				output_dim=Y_train.shape[1], 
				activation='softmax'))
model_LSTM.compile(optimizer='rmsprop', loss='categorical_crossentropy', metrics=['accuracy'])'''
print 'Create Model!'
batch_size=400
nb_epoch=5


model_LSTM = Sequential()
model_LSTM.add(LSTM(batch_size,input_shape=(X_train.shape[1],1), return_sequences=True))
model_LSTM.add(Dropout(0.5))
model_LSTM.add(LSTM(batch_size))
model_LSTM.add(Dropout(0.5))
model_LSTM.add(Dense(input_dim=batch_size, output_dim=25,init='uniform',activation='softmax'))  
#rmsprop=Adadelta(lr=0.00001,rho=0.9,epsilon=1e-6)
model_LSTM.compile(optimizer='rmsprop', loss='categorical_crossentropy',metrics=['accuracy'])
model_LSTM.summary()
acc_LSTM = AccHistory()
loss_LSTM = LossHistory()
print 'Start fit'

model_LSTM.fit(X_train, Y_train, nb_epoch=nb_epoch, batch_size=batch_size, callbacks=[acc_LSTM, loss_LSTM],verbose=1)
json_string = model_LSTM.to_json()
open('my_model_architecture.json','w').write(json_string)    
model_LSTM.save_weights('my_model_weights.h5') 

score_LSTM = model_LSTM.evaluate(X_test, Y_test, batch_size=batch_size, verbose=1)

print 'Start figure'
# plot results
plt.figure(1, figsize=(10, 10))
plt.title('Accuracy on training dataset')
plt.xlabel('Iterations, batch size ' + str(batch_size))
plt.ylabel('Classification accuracy')
plt.plot(acc_LSTM.losses, color='k', label='LSTM')
plt.savefig('mnist_plstm_lstm_comparison_acc.png', dpi=100)

plt.figure(2, figsize=(10, 10))
plt.title('Loss on MNIST training dataset')
plt.xlabel('Iterations, batch size ' + str(batch_size))
plt.ylabel('Categorical cross-entropy')
plt.plot(loss_LSTM.losses, color='k', label='LSTM')
plt.savefig('mnist_plstm_lstm_comparison_loss.png', dpi=100)

accInfo=[]
for info in acc_LSTM.losses:
	ele=[]
	ele.append(info)
	accInfo.append(ele)
WriteFile('accInfo.csv', accInfo)
lossInfo=[]
for info in loss_LSTM.losses:
	ele=[]
	ele.append(info)
	lossInfo.append(ele)
WriteFile('lossInfo.csv', lossInfo)
# Compare test performance
print('Test score LSTM:', score_LSTM[0])

#y_train=[1,2,2]
#Y_train = np_utils.to_categorical(y_train,4)