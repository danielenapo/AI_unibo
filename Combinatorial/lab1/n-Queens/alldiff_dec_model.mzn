% Alldiff decomposition model

include "alldifferent.mzn";

int: n ; % number of queens
array [1..n] of var 1..n: q; % variables & domains 


% aldiff decomposition
%constraint forall(i, j in 1..n where i<j)(q[i]!= q[j]);
%constraint forall(i, j in 1..n where i<j)(q[i]+i!= q[j]+j);
%constraint forall(i, j in 1..n where i<j)(q[i]-i!= q[j]-j);

constraint alldifferent([q[i] | i in 1..n])::domain;
constraint alldifferent([q[i]+i | i in 1..n])::domain;
constraint alldifferent([q[i]-i | i in 1..n])::domain;



solve :: int_search(q, input_order, indomain_min)  satisfy;

