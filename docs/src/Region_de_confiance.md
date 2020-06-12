# Région de confiance

  L’introduction d’une région de confiance dans la méthode de Newton permet de garantir
la convergence globale de celle-ci, i.e. la convergence vers un optimum local quel que soit
le point de départ. Cela suppose certaines conditions sur la résolution locale des sous-
problèmes issus de la méthode, qui sont aisément imposables.

## Principe
  L’idée de la méthode des régions de confiance est d’approcher f par une fonction
modèle plus simple ![``m_{k}``](https://render.githubusercontent.com/render/math?math=m_%7Bk%7D) dans une région ![``R_{k}=\left\{x_{k}+s ;\|s\| \leq \Delta_{k}\right\}``](https://render.githubusercontent.com/render/math?math=R_%7Bk%7D%3D%5Cleft%5C%7Bx_%7Bk%7D%2Bs%20%3B%5C%7Cs%5C%7C%20%5Cleq%20%5CDelta_%7Bk%7D%5Cright%5C%7D) pour un ![\Delta_{k}](https://render.githubusercontent.com/render/math?math=%5CDelta_%7Bk%7D) fixé.
Cette région dite “de confiance” doit être suffisament petite pour que

``\hspace*{2.5cm}``![``m_{k}\left(x_{k}+s\right) \sim f\left(x_{k}+s\right)``](https://render.githubusercontent.com/render/math?math=m_%7Bk%7D%5Cleft(x_%7Bk%7D%2Bs%5Cright)%20%5Csim%20f%5Cleft(x_%7Bk%7D%2Bs%5Cright))

   Le principe est que, au lieu de résoudre l’équation : ![``f\left(x_{k+1}\right)=\min _{\|x\| \leq \Delta_{k}} f\left(x_{k}+s\right)``](https://render.githubusercontent.com/render/math?math=f%5Cleft(x_%7Bk%2B1%7D%5Cright)%3D%5Cmin%20_%7B%5C%7Cx%5C%7C%20%5Cleq%20%5CDelta_%7Bk%7D%7D%20f%5Cleft(x_%7Bk%7D%2Bs%5Cright))
on résout :

``\hspace*{2.5cm}``![``m_{k}\left(x_{k+1}\right)=\min _{\|x\| \leq \Delta_{k}} m_{k}\left(x_{k}+s\right)``](https://render.githubusercontent.com/render/math?math=m_%7Bk%7D%5Cleft(x_%7Bk%2B1%7D%5Cright)%3D%5Cmin%20_%7B%5C%7Cx%5C%7C%20%5Cleq%20%5CDelta_%7Bk%7D%7D%20m_%7Bk%7D%5Cleft(x_%7Bk%7D%2Bs%5Cright)) ``\hspace*{2.5cm}``(2.1)

Si la différence entre ``f(x_{k+1})`` et ``m_{k} (x_{k+1} )`` est trop grande, on diminue le ``∆_{k}`` (et
donc la région de confiance) et on résout le modèle (2.1) à nouveau. Un avantage de cette
méthode est que toutes les directions sont prises en compte. Par contre, il faut faire attention
à ne pas trop s’éloigner de x_{k} ; en général, la fonction m k n’approche proprement f que
sur une région proche de x_{k} .




