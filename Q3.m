I = load('ATT.mat');
M = ones(56,46,20);
A = tensor(M);
for j =1:20
 A(:,:,j) = I.A(:,:,j);
end
A_norm=norm(A);
R=[30 30 20];
threshold = 2e-5;
max = 100;
ord = [1:3];
U = cell(3,1);
for n = 1:3
 U{n} = rand(size(A,n),R(n));
end
 x = 0;
for i = 1:max
 x_old = x;
 for n = ord(1:end)
 u = ttm(A, U, -n, 't');
 U{n} = nvecs(u,n,R(n));
 end
 core = ttm(u, U, n, 't');
 error_iter = sqrt( A_norm^2 - norm(core)^2 );
 x = 1 - (error_iter / A_norm); 
 change = abs(x_old - x);
 if (i > 1) && (change < threshold)
 break;
 end
end
Tuck = ttensor(core, U);
A_norm=frob(A);
B = Tuck.core;
B_norm=frob(core);
error = sqrt(A_norm^2 - B_norm^2)/A_norm;
B_tenmat = tenmat(B,3);
A_tenmat = tenmat(A,3) ;
B_double = double(B_tenmat);
%10
abscore = abs(double(B_tenmat)) ;
[~,idx] = sort(abscore(:),'descend');
y = min(abscore(idx(1:1800))); 
B_10 = double(B_tenmat);
B_10(B_10<y&B_10>-y)=0;
B_norm_10=frob(B_10);
error_10 = sqrt(A_norm^2 - B_norm_10^2)/A_norm ;
m = ones(30,30,20);
B_new_10 = tensor(m);
for i = 1:20
 temp = B_10(i,:);
 temp = reshape(temp,[30,30]);
 B_new_10(:,:,i) = temp;
end
X_10 = ttensor(B_new_10,Tuck.u);
X_10 = full(X_10);
figure;
imshow(uint8(tenmat(X_10(:,:,5),1).data));
figure;
imshow(uint8(tenmat(X_10(:,:,10),1).data));
figure;
imshow(uint8(tenmat(X_10(:,:,15),1).data));

%20
y = min(abscore(idx(1:3600))); 
B_20 = double(B_tenmat);
B_20(B_20<y&B_20>-y)=0;
B_norm_20=frob(B_20);
error_20 = sqrt(A_norm^2 - B_norm_20^2)/A_norm ;
m = ones(30,30,20);
B_new_20 = tensor(m);
for i = 1:20
 temp = B_20(i,:);
 temp = reshape(temp,[30,30]);
 B_new_20(:,:,i) = temp;
end
X_20 = ttensor(B_new_20,Tuck.u);
X_20 = full(X_20);
figure;
imshow(uint8(tenmat(X_20(:,:,5),1).data));
figure;
imshow(uint8(tenmat(X_20(:,:,10),1).data));
figure;
imshow(uint8(tenmat(X_20(:,:,15),1).data));

%30
y = min(abscore(idx(1:5400))); 
B_30 = double(B_tenmat);
B_30(B_30<y&B_30>-y)=0;
B_norm_30 = frob(B_30);
error_30 = sqrt(A_norm^2 - B_norm_30^2)/A_norm ;
m = ones(30,30,20);
B_new_30 = tensor(m);
for i = 1:20
 temp = B_30(i,:);
 temp = reshape(temp,[30,30]);
 B_new_30(:,:,i) = temp;
end
X_30 = ttensor(B_new_30,Tuck.u);
X_30 = full(X_30);
figure;
%image(I.images{1}(:,:,1));
imshow(uint8(tenmat(X_30(:,:,5),1).data));
figure;
%image(I.images{1}(:,:,1));
imshow(uint8(tenmat(X_30(:,:,10),1).data));
figure;
%image(I.images{1}(:,:,1));
imshow(uint8(tenmat(X_30(:,:,15),1).data));

%40
y = min(abscore(idx(1:7200))); 
B_40 = double(B_tenmat);
B_40(B_40<y&B_40>-y)=0;
B_norm_40 = frob(B_40);
error_40 = sqrt(A_norm^2 - B_norm_40^2)/A_norm ;
m = ones(30,30,20);
B_new_40 = tensor(m);
for i = 1:20
 temp = B_40(i,:);
 temp = reshape(temp,[30,30]);
 B_new_40(:,:,i) = temp;
end
X_40 = ttensor(B_new_40,Tuck.u);
X_40 = full(X_40);
figure;
%image(I.images{1}(:,:,1));
imshow(uint8(tenmat(X_40(:,:,5),1).data));
figure;
%image(I.images{1}(:,:,1));
imshow(uint8(tenmat(X_40(:,:,10),1).data));
figure;
%image(I.images{1}(:,:,1));
imshow(uint8(tenmat(X_40(:,:,15),1).data));

%50
y = min(abscore(idx(1:9000))); 
B_50 = double(B_tenmat);
B_50(B_50<y&B_50>-y)=0;
B_norm_50 = frob(B_50);
error_50 = sqrt(A_norm^2 - B_norm_50^2)/A_norm;
m = ones(30,30,20);
B_new_50 = tensor(m);
for i = 1:20
 temp = B_50(i,:);
 temp = reshape(temp,[30,30]);
 B_new_50(:,:,i) = temp;
end
X_50 = ttensor(B_new_50,Tuck.u);
X_50 = full(X_50);
figure;
imshow(uint8(tenmat(X_50(:,:,5),1).data));
figure;
imshow(uint8(tenmat(X_50(:,:,10),1).data));
figure;
imshow(uint8(tenmat(X_50(:,:,15),1).data));


