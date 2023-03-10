% Row model

include "alldifferent.mzn";

int: n; % number of queens
array[1..n] of var 1..n: q; %variables & domains 

%column attack constraints
constraint alldifferent(q)::domain;
%diagonal attack constraints
%constraint forall(i,j in 1..n where i<j)
%          (abs(rows[i]-rows[j]) != abs(i-j));
%USING GLOBAL CONSTRAINTS:
constraint alldifferent([q[i]+i | i in 1..n])::domain;
constraint alldifferent([q[i]-i | i in 1..n])::domain;

%Search
solve satisfy; 

