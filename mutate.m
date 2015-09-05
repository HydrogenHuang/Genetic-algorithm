function [new_species]=mutate(species,pos_mut)
%MUTATE change some gene in random point into random number.

[px,py] = size(species);
new_species = species;
for i=1:(px*py)
    if rand<pos_mut
        new_species(i) = rand*10-5;
    end
end