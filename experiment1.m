clc; 
clear all ;

n = input("Enter the number of buses: ");
z = zeros(n);
y = zeros(n);
Y = zeros(n);

for i=1:n
    for j=i+1:n
         if( i < j && i ~= j)
            fprintf("Enter the impedance for the z%d%d branch" , i , j);
            z(i,j) = input(": ");
         else 
             z(i,j) = 0 + 0i ;
         end
    end
end


for i=1:n
    for j=1:n
        if( i < j && i ~= j)
        y(i,j) = 1./z(i,j) ;
        end
    end 
end

sum = 0 + 0i;

for i=1:n
    for j=1:n
        if( i == j)
            for l=1:n
                for m=1:n
                    if(l ~= m && (l == i || m == i))
                      sum = sum +  y(l,m);
                    end   
                     
                end 
                Y(i,j) = sum + y(l,m);
            end
            sum = 0 + 0i ;
        end 
              
    end   
end



for i=1:n
    for j=1:n
       if i~= j
           Y(i,j) = -y(i,j);       
       end
    end
end


for j=1:n
    for i=1:n
        Y(i,j) = Y(j,i) ; 
    end 
end 

display("The Y bus is")
display(Y)










