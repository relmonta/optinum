## A. Problèmes sans contraintes

Les problèmes de minimisation sans contraintes à résoudre sont les suivants :

###### Problème 1

``\hspace*{1.5cm}`` ``\begin{aligned} f_{1}: \mathbb{R}^{3} & \rightarrow \mathbb{R} \\ \left(x_{1}, x_{2}, x_{3}\right) & \mapsto 2\left(x_{1}+x_{2}+x_{3}-3\right)^{2}+\left(x_{1}-x_{2}\right)^{2}+\left(x_{2}-x_{3}\right)^{2} \end{aligned}``

On cherchera à minimiser ``f_{1}`` sur ``R^{3}`` , en partant des points suivants: ``\\``

``\hspace*{2cm}`` ``x_{011}=\left[\begin{array}{c} 1 \\ 0 \\ 0 \end{array}\right], \quad x_{012}=\left[\begin{array}{c} 10 \\ 3 \\ -2.2 \end{array}\right]``

###### Problème 2

``\hspace*{1.5cm}`` ``\begin{aligned} f_{2}: \mathbb{R}^{2} & \rightarrow \mathbb{R} \\ \left(x_{1}, x_{2}\right) & \mapsto 100\left(x_{2}-x_{1}^{2}\right)^{2}+\left(1-x_{1}\right)^{2} \end{aligned}``

On cherchera à minimiser ``f_{2}`` sur ``R^{2}`` , en partant des points suivants:``\\`` 


``x_{0 2 1}=\left[\begin{array}{c} -1.2 \\ 1 \end{array}\right]\\``

``x_{0 2 2}=\left[\begin{array}{c} 10 \\ 0 \end{array}\right]\\``

``x_{023}=\left[\begin{array}{c} 0 \\ \frac{1}{200}+\frac{1}{10^{12}} \end{array}\right]\\``



## B. Cas tests pour le calcul du pas de Cauchy

On considère des fonctions quadratiques de la forme ``q(s)=s^{\top} g+\frac{1}{2} s^{\top} H s``

###### Quadratique 1

``g=\left[\begin{array}{l} 0 \\ 0 \end{array}\right]\\``

``H=\left[\begin{array}{ll} 7 & 0 \\ 0 & 2 \end{array}\right]\\``

###### Quadratique 2
``g=\left[\begin{array}{l} 6 \\ 2 \end{array}\right]\\``

``H=\left[\begin{array}{ll} 7 & 0 \\ 0 & 2 \end{array}\right]\\``


###### Quadratique 3

``g=\left[\begin{array}{l} -2 \\ 1 \end{array}\right]\\``

``H=\left[\begin{array}{ll} -2 & 0 \\ 0 & 10 \end{array}\right]\\``
