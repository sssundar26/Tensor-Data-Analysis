figure;title("Emission loadings");
hold on
for ii = 1:3
 plot(B(:,ii))
end
figure;title("Excitation loadings");
hold on
for ii = 1:3
 plot(C(:,ii))
end