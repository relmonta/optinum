## Exemples d'appels

Dans les exemples suivants appliqués sur les fonctions :
1. [`Algorithme_De_Newton`](@ref)
1. [`Pas_De_Cauchy`](@ref)
1. [`Gradient_Conjugue_Tronque`](@ref)
1. [`Regions_De_Confiance`](@ref)
1. [`Lagrangien_Augmente`](@ref)

nous allons utiliser la fonction suivante : ``\\``
``\begin{aligned}\hspace*{1.5cm} f: \mathbb{R}^{2} \quad &\rightarrow \mathbb{R} \\ \hspace*{1.5cm} \left(x_{1}, x_{2}\right) &\rightarrow 100\left(x_{2}-x_{1}^{2}\right)^{2}+\left(1-x_{1}\right)^{2} \end{aligned} \\``
dont le gradient est : ``\hspace*{0.5cm}`` 
`` \nabla f(x) = \left[\begin{array}{l} -400 x_{1}(x_{2}-x_{1}^{2})-2(1-x_{1}) & 200 (x_{2}-x_{1}^{2}) \end{array}\right]^{T} \\``
et la hessienne est : ``\hspace*{0.5cm}``
`` \nabla^2 f(x) = \left[ \begin{array}{cc} -400 (x_{2}-3 x_{1}^{2})+2 & -400 x_{1} \\ -400 x_{1} & 200 \end{array}\right]``

```@example 1
using Optinum
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
options = []
nothing # hide
```

### L'Algorithme de Newton

```@example 1
x0 = [1; 0]
output = Algorithme_De_Newton(f,gradf,hessf,x0,options)
println(output) # (xmin,f_min,flag,nb_iters)
nothing # hide
```

### Le pas de Cauchy

```@example 1
xk = [0; 0.5]
delta1 = 1
output = Pas_De_Cauchy(gradf(xk),hessf(xk),delta1)
println(output) # (sk, e)
nothing # hide
```

### Algorithme du Gradient Conjugué Tronqué

```@example 1
# deltak = options[1]
# max_iter = options[2]
# tol = options[3]
options = [1,5,1e-3]
xk = [0; 0.5]
sk = Gradient_Conjugue_Tronque(f(xk),gradf(xk),hessf(xk),options)
println(sk)
nothing # hide
```

### L'Algorithme des régions de confiance

```@example 1
algo="gct" # ou cauchy
x0 = [1; 0]
options = []
output = Regions_De_Confiance(algo,f,gradf,hessf,x0,options)
println(output)  # (xmin, fxmin, flag,nb_iters)
nothing # hide
```

### Algorithme du Lagrangien augmenté pour contraintes d’égalité

Dans cet exemple nous allons prendre la contrainte suivante : ``\\``
`` c(x) = x_{1}^2 + x_{2}^2 -1.5 = 0 \\``
dont le gradient est : ``\hspace*{0.5cm}`` 
`` \left[\begin{array}{l} 2x_{1} & 2 x_{2} \end{array}\right]^{T} \\``
et la hessienne est :``\hspace*{0.5cm}``
 `` \left[ \begin{array}{cc} 2 & 0 \\ 0 & 2 \end{array}\right]``

```@example 1
using LinearAlgebra
algo = "gct" # ou newton|gct
options = []
contrainte(x) =  (x[1]^2) + (x[2]^2) -1.5
grad_contrainte(x) = [2*x[1] ;2*x[2]]
hess_contrainte(x) = [2 0;0 2]
phi(x) = 0
output = Lagrangien_Augmente(algo,f,contrainte,gradf,hessf,grad_contrainte,hess_contrainte,(x)->grad_contrainte(x)',phi,x0,options)
println(output) # (xmin1,fxmin1,flag,nbiters)
```
