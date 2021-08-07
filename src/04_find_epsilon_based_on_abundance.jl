using NeutralLandscapes
using Plots
using Measures
using Distributions

f(N, ϵ, λ) = begin
    p = 1 - Float64(ϵ/λ)
    p > 0 && return p^N # conditional to deal with float instability with epsilon and low lambda
    return 0
end 


abd = [10^i for i in 0.0:0.1:9]


f(N, α)= begin
    p = 1 - Float64(α)
    p > 0 && return p^N # conditional to deal with float instability with epsilon and low lambda
    return 0
end 


function getmat(;
    abundances = [10^i for i in 0:0.001:4],
    alphas = [i for i in  0.00001:0.001:0.1])

    mat = zeros(length(abundances), length(epsilons))
    for (i,ab) in enumerate(abundances)
        for (j, alph) in enumerate(alphas)
            mat[i,j] = f(ab, alph)
        end
    end
    return abundances, alphas, mat
end

abundances, alphas, mat = getmat()

heatmap(mat)










