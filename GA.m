function GA
clc;
%Initialize
px = 100;
py = 4;
pos_cros = 0.88;%Possibiity of crossover
pos_mut = 0.1;%Possibiity of mutation
species = rand(px,py).*10-5;%Range between -5 to 5

syms eval eval_table; 
syms last_best best_one;

%Evaluation
eval = evaluate(species);
last_best = max(eval);

for k=1:100
    
    %Selection
    sel_species = select(species,eval);
    
    %Crossover
    new_species = crossover(sel_species,pos_cros);
    
    %mutation
    new_species = mutate(new_species,pos_mut);
    
    %Evaluation
    species = new_species;
    eval = evaluate(species);
    [best, idx] = max(eval);
    if last_best<best
        last_best = best;
        best_one = species(idx,:);
    end
end

%Print the answer
fprintf('The best outcome is %f\n',last_best);
for i=1:py
    fprintf('x%d = %f\n',i,best_one(i));
end

function f = evaluate(val)
%EVALUATE calculate the fitness of each series of the chromosome.

[~,col]=size(val);
f = 1./(val.^2 * ones(col,1)+1);
