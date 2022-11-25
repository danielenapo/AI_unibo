import numpy as np
e=1
while True:
    e=e/2
    if(1+e/2==1):
        break
print("computed emach:",e)
print("true emach (from np.finfo(float).eps):",np.finfo(float).eps)