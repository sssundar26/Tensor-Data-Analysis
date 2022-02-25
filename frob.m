function norm = frob(x)
    norm=0;
    for i =1:size(x,1)  
        for j =1:size(x,2)
            for k = 1:size(x,3)
                norm = norm + (x(i,j,k)^2);
            end
        end
    end
    norm=sqrt(norm);
end