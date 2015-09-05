function [sel_species]=select(species,eval)
%SELECT generate the selected chromosome.

[px,py] = size(species);
eval_table = eval./sum(eval);
eval_table = cumsum(eval_table);
possible = rand(px,1);
%possible
i=1;
sel_species = ones(px,py);
while i<=px
    mask = eval_table>possible(i);
    [~,id]=max(mask);
    sel_species(i,:) = species(id,:);
    i=i+1;
end
    