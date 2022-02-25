addpath('tensor_toolbox-v3.1')  
train_file=load("train_lab.mat");
y_train=train_file.train;
test_file=load("test_lab.mat");
y_test=test_file.test;
x_train=tenones([500 500 28]);
for n=1:28
    image='train'+string(n)+'.jpg';
    x_train(:,:,n)=rgb2gray(imread(image));
end
train_transform=tucker_als(x_train,[10 10 28]);
G=ttm(train_transform.core,train_transform.U(3),3);
G_train= double(tenmat(G,3));
model=TreeBagger(100,G_train,y_train,Method="classification");
x_test=tenones([500 500 12]);
for n=1:12
    image='Test'+string(n)+'.jpg';
    x_test(:,:,n)=rgb2gray(imread(image));
end
A1=cell2mat(train_transform.U(1))';
A2=cell2mat(train_transform.U(2))';
x_test=ttm(x_test,A1,1);
x_test=ttm(x_test,A2,2);
x_test=double(tenmat(x_test,3));
prediction=cell2mat(predict(model,x_test));
accuracy=0;
for i=1:12
    if string(y_test(i))==prediction(i)
        accuracy=accuracy+1;
    end
end