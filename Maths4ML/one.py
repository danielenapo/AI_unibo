import numpy as np
import matplotlib.pyplot as plt


dim=50
A_full=np.random.randn(dim,dim)
rel_err=np.zeros((dim-2,))
k_2=np.zeros((dim-2,))
k_inf=np.zeros((dim-2,))

for i in range(2,dim):
    #calculating b from x_true
    x_true=np.ones((i,))
    A=A_full[:i,:i]
    b=x_true@A

    #calculating x
    k_2[i-2]=np.linalg.cond(A,2)
    k_inf[i-2]=np.linalg.cond(A,np.inf)
    x=np.linalg.solve(A,b)
    print(x)

    #calculating relative error 
    rel_err[i-2]=np.linalg.norm(x_true-x,2)/np.linalg.norm(x_true,2)

#PLOTTING
plt.figure(figsize=(10, 4))
#plotting relative error
plt.subplot(1, 2, 1)
plt.title("Relative error")
plt.xlabel("n")
plt.ylabel("Relative Error")
plt.plot(np.arange(2,dim), rel_err)
plt.grid()

#plotting condition numbers
plt.subplot(1, 2, 2)
plt.title("condition numbers")
plt.xlabel("n")
plt.ylabel("k")
plt.plot(np.arange(2,dim), k_2)
plt.plot(np.arange(2,dim), k_inf)
plt.legend(['k_2', 'k_inf'])
plt.grid()

plt.show()

