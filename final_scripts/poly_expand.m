function x2 = poly_expand(x,p)

[n_var, n_measurements] = size(x);

x2 = [];

for j=1:n_var
    for i=1:p
        x2 = [x2; x(j,:).^i];
    end 
end

x2 = [ones(1,n_measurements); x2];