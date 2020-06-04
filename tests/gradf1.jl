#la gradient de la fonction f1
function gradf1(x)

y1 = 4*(x[1]+x[2]+x[3]-3) + 2*(x[1]-x[2])
y2 = 4*(x[1]+x[2]+x[3]-3) - 2*(x[1]-x[2]) +2*(x[2]-x[3])
y3 = 4*(x[1]+x[2]+x[3]-3) - 2*(x[2]-x[3])

y = [y1 y2 y3]'
return y
end
