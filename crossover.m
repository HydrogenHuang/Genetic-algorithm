function [new_species]=crossover(species,pos_cros)
%CROSSOVER generate the species after crosovering

[px,py] = size(species);
new_species = species;
for i=1:2:px-1 %The nearby chromosome will crossover if possible
    if rand<pos_cros
        point = ceil(rand*py);%The crossover position can not be 0
        new_species(i,:) = [species(i,1:point),species(i+1,point+1:py)];
        new_species(i+1,:) = [species(i+1,1:point),species(i,point+1:py)];
    else
        new_species(i,:) = species(i,:);
        new_species(i+1,:) = species(i+1,:);
    end
end