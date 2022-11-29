#do not insert print, or tests
def fexp(L):
    if len(L)<2:
        return True
    res=True
    sum=0
    for i in range(len(L)):
        if L[i]>sum:
            sum+=L[i]
            continue
        res=False
    return res

print(fexp([0,1,3]))