file=load("aminoacid.mat");
X=file.X;
Y=file.Y;
convergence=0;
iter=0;
I=5;
J=201;
K=61;
R=3;
A=abs(rand(I,R));
B=abs(rand(J,R));
C=abs(rand(K,R));
X1=double(tenmat(X,1));  
X2=double(tenmat(X,2));  
X3=double(tenmat(X,3));  
while convergence==0
     iter=iter+1;
     V= (B'*B).*(C'*C);
     A =(X1*khatrirao(C,B))*inv(V'*V)*V';
     A=normc(A);
     V= (A'*A).*(C'*C);
     B =(X2*khatrirao(C,A))*inv(V'*V)*V';
     B=normc(B);
     V= (A'*A).*(B'*B);
     C =(X3*khatrirao(B,A))*inv(V'*V)*V';
     C=normc(C);
     if iter>500
         convergence=1;
     end
end
Y=normc(Y);

