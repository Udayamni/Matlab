close all
clear all
clc
syms   z s T
store = 1;
T =1;
po = [0 1 0  ; 0 1 1 ];
poles = po;
a = size(poles);
A = zeros (a(1) , a(2));
for i = 1: a(1)
A(i,:) = poles(i,:);
c = size(A);
c0 = c(2);
c1= c(2)-1;
 for i = 1: c0
b = s^c1;
var = A(i);
d(i) = b*var;
 c1 = c1-1;
 end
 e = 0;
 for i = 1:c0
 e = e+ d(i);
 end
 
store = e * store;

end
 X(s) = 1/store
 
 
 store2 = 0;
    poles = po;
    a = size(poles);
    A = zeros (a(1) , a(2));

    for i = 1: a(1)
        store3 = 0;
        store4 = 0;
        A(i,:) = poles(i,:);
        a = A(i,:);
        root2 = roots(a);
        root2_act = root2(1);
        rootsi = size(roots(a));
        rootsize = rootsi(1);
        c = size(a);
        c0 = c(2);
        c1= c(2)-1;
        for i = 1: c0
            b = s^c1;
            var = a(i);
            d(i) = b*var;
            c1 = c1-1;
        end
        e = 0;
        for i = 1:c0
            e = e + d(i);
        end
        store3 = e;

  
        if rootsize > 1
            trry = diff((e*X(s) * z /(z- exp(T .*s))), s ,(rootsize-1));
            k1 = (1/factorial(rootsize-1)) * limit (trry ,s , root2_act);
        else
            k1 = limit ((e*X(s) * z /(z- exp(T .*s))), s , root2_act );
        end

        store2 = store2 + k1;
    end 
    pretty(store2)
