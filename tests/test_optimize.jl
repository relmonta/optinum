using JuMP
using GLPK
using Ipopt

n=20
m=100
b=rand(m)
A=rand(m,n)
# Définition du modèle (GLPK.optimizer est pour les problèmes lineaires )
model = Model(Ipopt.Optimizer)
# Définition des variables d'optimisation
@variable(model,x[i=1:n])
@variable(model ,R)
# Définition de la fonctionnelle à minimiser
@objective(model,Min,R) # le modèle,Min=minimiser, la fonction:f(x,R)=R
# Définition des contraintes
for i=1:m
    @constraint(model,sum(A[i,j]*x[j] for j=1:n)-b[i]-R<=0);   
    @constraint(model,sum(A[i,j]*x[j] for j=1:n)-b[i]+R>=0);
end
# Résolution
# Insérer votre code
status = optimize!(model)
# Résultats à optimalité
fstar = objective_value(model)
xstar = value.(x)
Rstar = value.(R)
#println("The function value at the solution is: ",Rstar, " or ",findmax(abs.(A*xstar-b)))


model = Model(GLPK.Optimizer)
# Définition des variables d'optimisation
@variable(model,x[i=1:n])
@variable(model ,R)
# Définition de la fonctionnelle à minimiser
@objective(model,Min,R) # le modèle,Min=minimiser, la fonction:f(x,R)=R
# Définition des contraintes
for i=1:m
    @constraint(model,sum(A[i,j]*x[j] for j=1:n)-b[i]-R<=0);
    @constraint(model,sum(A[i,j]*x[j] for j=1:n)-b[i]+R>=0);
end
# Résolution
# Insérer votre code
status = optimize!(model)
# Résultats à optimalité
fstar1 = objective_value(model)
xstar1 = value.(x)
Rstar1 = value.(R)
#println("The function value at the solution is: ",Rstar, " or ",findmax(abs.(A*xstar-b)))
