include "globals.mzn";

enum JOB;
enum TASK;
TASK: last = max(TASK);
array [JOB,TASK] of int: d;                   % task durations array
int: total = sum(i in JOB, j in TASK)(d[i,j]);% total duration
int: digs = ceil(log(10.0,int2float(total))); % digits for output


%decision and optimization variables and domains 
array[JOB, TASK] of var 0..total: s; %variable that indicate start time of a task t of job j
var 0..total: end;  %end is the dummy task (duration zero) -> MAKESPAN (end of the last task)

%precedence constraints between the successive tasks of each job 
constraint 
  forall(i in JOB) 
  (
    forall(j in TASK where j<last)
    (
      (s[i,j] + d[i, j] <= s[i,enum_next(TASK, j)]) /\ %ogni task deve finire prima che inizi la successiva
      (s[i, last]+ d[i, last] <=end) 
    )
  );
      
% disjunctive constraints  -> ensure no overlap of tasks of different jobs (machines can only run one task at a time)
/*
constraint
  forall(j in TASK)  %iterate over all tasks
  (
    disjunctive([s[i,j] | i in JOB], [d[i,j] | i in JOB]) %1st task cannot overlap to any other 1st task of other jobs (and so on) 
   );
*/
constraint
  forall(j in TASK)  %iterate over all tasks
  (
     forall(i,k in JOB where i<k)
     (
        my_disjunctive(s[i,j], d[i,j], s[k, j], d[k, j])
     )
 );
   

% disjunctive decomposition
predicate my_disjunctive(var int:s1, int:d1, var int:s2, int:d2) =
  s1+d1 <= s2 \/ s2 + d2 <= s1;


solve :: int_search(s, input_order, indomain_min) minimize end;


 output ["end = \(end)\n"] ++
       [ show_int(digs,s[i,j]) ++ " " ++ 
         if j == last then "\n" else "" endif |
         i in JOB, j in TASK ];
