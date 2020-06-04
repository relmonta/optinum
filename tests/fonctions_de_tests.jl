#function f1
function f(x)

y =  2*(x[1]+x[2]+x[3]-3)^2 + (x[1]-x[2])^2 + (x[2]-x[3])^2
return [y]
end

#la gradient de la fonction f1
function gradf1(x)

y1 = 4*(x[1]+x[2]+x[3]-3) + 2*(x[1]-x[2])
y2 = 4*(x[1]+x[2]+x[3]-3) - 2*(x[1]-x[2]) +2*(x[2]-x[3])
y3 = 4*(x[1]+x[2]+x[3]-3) - 2*(x[2]-x[3])

y = [y1 y2 y3]'
return y
end

#l'hessienne de la fonction f1
function hessf1(x)

y = [6 2 4;2 8 2;4 2 6]

return y
end
