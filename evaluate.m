function f = evaluate(val)
%EVALUATE calculate the fitness of each series of the chromosome.

[~,col]=size(val);
f = 1./(val.^2 * ones(col,1)+1);