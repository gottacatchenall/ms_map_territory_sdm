using NeutralLandscapes
using Plots
using Measures
using Distributions

f(N, ϵ, λ) = begin
    p = 1 - Float64(ϵ/λ)
    p > 0 && return p^N # conditional to deal with float instability with epsilon and low lambda
    return 0
end 

using ColorSchemes

function getmat(λ;
    abundances = [10^i for i in 0:0.001:4],
    epsilons = [i for i in  0.00001:0.001:0.1])

    mat = zeros(length(abundances), length(epsilons))
    for (i,ab) in enumerate(abundances)
        for (j, ep) in enumerate(epsilons)
            mat[i,j] = f(ab, ep, λ)
        end
    end
    return abundances, epsilons, mat
end

abundances, epsilons, λ05 = getmat(10^-1)
abundances, epsilons, λ1 = getmat(10^-3)
abundances, epsilons, λ5 = getmat(10^-4)
abundances, epsilons, λ10 = getmat(10^-5)

sch = ColorScheme([ColorSchemes.thermal[1:200]...,  convert(RGB{Float64}, colorant"white"), convert(RGB{Float64}, colorant"white")])

plt005 = contourf(abundances, 
    epsilons, λ05', 
    title="λ=0.5",  
    xlabel="number of individuals", 
    ylabel="ϵ",
    lc=:white, 
    lw=0.5,
    colorbar=:none, 
    xaxis=:log10,
    xticks=[10^0, 10, 10^2, 10^3, 10^4],
    c=cgrad(sch, rev=true), frame=:box)

plt01 = contourf(abundances, epsilons, λ1', 
    title="λ=1",  
    xlabel="number of individuals", 
    ylabel="ϵ",
    lc=:white, 
    lw=0.5,
    colorbar=:none, 
    xaxis=:log10,
    xticks=[10^0, 10, 10^2, 10^3, 10^4],
    c=cgrad(sch, rev=true), frame=:box)
plt05 = contourf(abundances, epsilons, λ5', 
    title="λ=5",  
    xlabel="number of individuals", 
    ylabel="ϵ", 
    lc=:white, 
    lw=0.5,
    colorbar=:none,
    xaxis=:log10,
    xticks=[10^0, 10, 10^2, 10^3, 10^4],
    c=cgrad(sch, rev=true), frame=:box)
plt10 = contourf(abundances, epsilons, λ10',  
    title="λ=10", 
    xlabel="number of individuals", 
    ylabel="ϵ",
    lc=:white, 
    colorbar=:none, 
    lw=0.5,
    xaxis=:log10,
    xticks=[10^0, 10, 10^2, 10^3, 10^4],
    c=cgrad(sch, rev=true), 
    frame=:box)

cb = scatter([0,0], [0,1],c=cgrad(sch, rev=true),zcolor=[0,3], ticks=:none,clims=(0,1),xlims=(1,1.1), xshowaxis=false, yshowaxis=false, label="", colorbar_title="Probability no individuals are seen in any location with p < ϵ", grid=false)

using Measures
l =  @layout [grid(2, 2) a{0.01w}]

fnt = font(20, "Roboto")
plot(
    plt005, plt01, plt05, plt10, cb,
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