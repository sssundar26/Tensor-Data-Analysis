addpath('tensor_toolbox-v3.1')  
train_file=load("train_lab.mat");
y_train=train_file.train;
test_file=load("test_lab.mat");
y_test=test_file.test;
x_train=tenones([500 500 3 28]);
for n=1:28
    file_name='train'+string(n)+'.jpg';
    image=tensor(double(imread(file_name)));
    x_train(:,:,:,n)=image;
end
train_transform=tucker_als(x_train,[10 10 3 28]);
G=ttm(train_transform.core,train_transform.U(4),4);
G_train= double(tenmat(G,4));
model=TreeBagger(100,G_train,y_train,Method="classification");
x_test=tenones([500 500 3 12]);
for n=1:12
    image='Test'+string(n)+'.jpg';
    x_test(:,:,:,n)=tensor(double(imread(image)));
end
A1=cell2mat(train_transform.U(1))';
A2=cell2mat(train_transform.U(2))';
A3=cell2mat(train_transform.U(3))';
x_test=ttm(x_test,A1,1);
x_test=ttm(x_test,A2,2);
x_test=ttm(x_test,A3,3);
x_test=double(tenmat(x_test,4));
prediction=cell2mat(predict(model,x_test));
accuracy=0;
for i=1:12
    if string(y_test(i))==prediction(i)
        accuracy=accuracy+1;
    end
end
disp(accuracy)

