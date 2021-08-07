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
cs = ColorSchemes.Paired_5


function makeplt(ϵ)
    lambdas = [10^i for i in 0:0.2:9]
    pr107 = []
    pr106 = []
    pr105 = []
    pr104 = []
    pr103 = []

    for λ in lambdas
        push!(pr107, f(10^7, ϵ, λ))
        push!(pr106, f(10^6, ϵ, λ))
        push!(pr105, f(10^5, ϵ, λ))
        push!(pr104, f(10^4, ϵ, λ))
        push!(pr103, f(10^3, ϵ, λ))
    end



    plot(frame=:box, xaxis=:log10, xticks=[10^i for i in 0:9])
    plot!(lambdas, pr103, label="10^3", lw=3, c=cs[1])
    scatter!(lambdas, pr103, ms=4, mc=:white, msc=cs[1])

    plot!(lambdas, pr104, label="10^4", lw=3, c=cs[2])
    scatter!(lambdas, pr104, ms=4, mc=:white, msc=cs[2])

    plot!(lambdas, pr105, label="10^5", lw=3,c=cs[3])
    scatter!(lambdas, pr105, ms=4, mc=:white, msc=cs[3])


    plot!(lambdas, pr106, label="10^6", lw=3, c=cs[4])
    scatter!(lambdas, pr106, ms=4, mc=:white, msc=cs[4])

    plot!(lambdas, pr107, label="10^7", lw=3, c=cs[5])
    scatter!(lambdas, pr107, ms=4, mc=:white, msc=cs[5])
end


makeplt(0.01)