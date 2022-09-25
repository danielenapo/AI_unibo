import numpy as np
import matplotlib.pyplot as plt


#calculating b from x_true

A_full=np.random.randn(10,10)
rel_err=np.zeros((8,))
for i in range(2,10):
    x_true=np.ones((i,))
    A=A_full[:i,:i]
    b=x_true@A

    #calculating x
    k_2=np.linalg.cond(A,2)
    k_inf=np.linalg.cond(A,np.inf)
    #print(f"condition number with 2-norm: {k_2}")
    #print(f"condition number with inf-norm: {k_inf}")
    x=np.linalg.solve(A,b)
    print(x)

    #calculating relative error 
    rel_err[i-2]=np.linalg.norm(x_true-x,2)/np.linalg.norm(x_true,2)
    #print(f"relative error: {rel_err[i]}")

#plotting

plt.plot(np.arange(2,10), rel_err)
plt.show()

