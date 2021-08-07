using NeutralLandscapes
using Plots
using Measures
using Distributions


f(N, α)= begin
    α > 0 || return 0
    p = 1 - Float64(α)
    p > 0 && return p^N # conditional to deal with float instability with epsilon and low lambda
    return 0
end 

using ColorSchemes

function getmat(α;
    abundances = [i for i in 1:5000],
    alphas = [i for i in  0.00001:0.001:0.3])

    mat = zeros(length(abundances), length(alphas))
    for (i,ab) in enumerate(abundances)
        for (j, alph) in enumerate(alphas)
            mat[i,j] = f(ab, alph)
        end
    end
    return abundances, alphas, mat
end


abundances, alphas, mat = getmat()

sch = ColorScheme([ColorSchemes.thermal[1:200]...,  convert(RGB{Float64}, colorant"white"), convert(RGB{Float64}, colorant"white")])

plt005 = contourf(abundances, 
    alphas, mat', 
    xlabel="number of individuals", 
    ylabel="α",
    lc=:white, 
    lw=0.5,
    xaxis=:log10,
    xticks=[10^0, 10, 10^2, 10^3, 10^4],
    c=cgrad(sch, rev=true), frame=:box)

cb = scatter([0,0], [0,1],c=cgrad(sch, rev=true),zcolor=[0,3], ticks=:none,clims=(0,1),xlims=(1,1.1), xshowaxis=false, yshowaxis=false, label="", colorbar_title="Probability no individuals are seen in any location with p < ϵ", grid=false)

using Measures
l =  @layout [grid(2, 2) a{0.01w}]

fnt = font(20, "Roboto")
plot(
    plt005,
    layout = l,
    font=fnt,
    size=(900,900), 
    dpi=300,
    margin=10mm)


savefig("neat.png")
 

l = 100
abundances, epsilons, mat = getmat(l)
contourf(abundances, epsilons, mat,  
    title="λ=$l", 
    xlabel="number of individuals", 
    ylabel="ϵ",
    lc=:white, 
    colorbar=:none, 
    lw=0.5,
    xaxis=:log10,
    c=cgrad(csch, rev=true), 
    frame=:box)


contourf(abundances, epsilons, λ05,  
    title="λ=10", 
    xlabel="number of individuals", 
    ylabel="ϵ",
    lc=:white, 
    colorbar=:none, 
    lw=0.5,
    xaxis=:log10,
    c=cgrad(csch, rev=true), 
    frame=:box)