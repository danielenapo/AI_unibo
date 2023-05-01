the [[Pinhole Camera model]] might be too simplistic of a model. We need something more realistic.

# From 3D to 2D
The 3D **World Reference Model (WRF)** has to be projected in the **Camera Reference Model (CRM)**, and then in a 2D plane (the image plane).
![[Pasted image 20230501172900.png]]
## Extrinsic parameters
To pass from WRF to CRF we need to change the origin, performing **rototranslation**.
==6 PARAMETERS NEEDED:==
![[Pasted image 20230501173018.png]]
## Intrinsic parameters
==4 PARAMETERS NEEDED:==
![[Pasted image 20230501173142.png]]

# Projective space
The final model is non-linear:
![[Pasted image 20230501173341.png]]
We can make it linear by considering a virtual ==**Projective space**, equivalent of the euclidean space of the WRF==.

The generic vector $[x, y, z] ∈ R^{3}$ becomes $[x, y, z, 1] ∈ P^{3}$ , i.e. a fourth dimension is added to the vector. Moreover, the new vector can be multiplied by a constant k 6= 0 and can still represent the same original point from $R^{3}$ . In general, if a n-dimensional projective space vector is given, this will just be represented as a vector of n + 1 elements: $[x1, x2, . . . , xn+1]$. 
To shift from P3 to R3 it is necessary to divide every element by xn+1 (to get the 1 in the additional dimension) and than remove the last dimension.
In projective space, points are represented as lines. This allows the representation of points at infinity, i.e. when xn+1 = 0, while in R3 this is not possible.

![[Pasted image 20230501181004.png]]
## Intrinsic parametric matrix
![[Pasted image 20230501181054.png]]
The left 3x3 matrix of Pint is called **intrinsic parametric matrix**, often referred as **A**.
It's always upper right triangular.
Realistic models also include a 5th parameter, called **skew**, to take into account non orthogonalities between axes of the sensor.

## Extrinsic parameter matrix
![[Pasted image 20230501181331.png]]
This is also referred as **G**.
## Perspective projection matrix
Getting the two matrices together, we get the PPM, also referred as **P**:
![[Pasted image 20230501181404.png]]
P is a 3x4 full-rank matrix = $P_{int}G$

# Lens distorsion
PPM is based on [[Pinhole Camera model]], but real [[Lenses]] introduce distorsions to it.
We need to take into account their effect:
![[Pasted image 20230501182600.png]]

KINDS OF DISTORSIONS:
- **Radial distorsion** -> lens curvature (making straight lines curve)
	- **Barrel distorsion** -> straight lines bend outwards
	- **Pincushion distortion** -> straight line bend inwards
![[Pasted image 20230501183300.png]]
- **Tangential distorsion** -> misallignments and defects of the components

Lens distorsion is ==modeled through a non-linear transformation==.
![[Pasted image 20230501192607.png]]
L(r) is the **radial distorsion function**, proportional to the radius r (distance to the center of image in (0,0)).
![[Pasted image 20230501193602.png]]
This adds k new parameters to the complete camera model

# Complete camera model
![[Pasted image 20230501193654.png]]