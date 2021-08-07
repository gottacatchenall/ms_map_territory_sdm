using NeutralLandscapes
using Plots
using Measures
using Distributions

sz = 500
sdm = zeros(500,500)

numlevels = 5


# these shouldn't be spaced linearly. 
for i in 1:sz
    sdm[i,:] .= ceil((i/sz)*numlevels)
end

sdm = sdm ./ sum(sdm)

heatmap(sdm, frame=:box, size=(500,400), margin=10mm)


numgenerations = 1
nreps = 50
abundances = [10, 50, 100]

sdmminval = min(sdm...);

abd = []
lowzonefreq = []

for ab in abundances
    for r in 1:nreps
        lowzonecount = 0
        for g in 1:numgenerations
            thiscts = zeros(sz,sz)
            for i in 1:ab
                obscell = rand(Categorical(vec(sdm)))
                thiscts[obscell] += 1
            end

            # how many times was the species seen in the lowest probability zone? 
            for i in 1:sz, j in 1:sz
                if sdm[i,j] == sdmminval && thiscts[i,j] > 0 
                    lowzonecount += 1
                end
            end
        end
        push!(lowzonefreq,  lowzonecount/(numgenerations*ab))
        push!(abd, ab)
    end
end


scatter(abd, lowzonefreq, ylim=(0,0.05), alpha=0.3)



f(N, ϵ, λ) = (1.0 - (ϵ/λ))^N


function buildscatter(ϵ, λ; 
    Ns=[10^i for i in 0:0.1:4])
    return Ns, map(N -> f(N, ϵ, λ), Ns)
end


using ColorSchemes


function makeplot(ϵ; cs=ColorSchemes.Paired_5)

    plt = plot(title="ϵ = $ϵ", xlims=(1,10^4),ylims=(0,1), legend=:none, dpi=300, frame=:box)

    styl = (ms=5, msw=1.5, mc=:white, lw=1.5)
    for (i,λ) in  enumerate([0.5, 1, 3, 5])
        Ns, probs = buildscatter(ϵ,λ)
        plot!(plt, Ns, probs, lc = cs[i]; styl...)
        scatter!(plt, Ns, probs, msc=cs[i]; styl...)
    end
    plt
end

using Measures 

fnt = font(20, "Roboto")
plt1, plt2 ,plt3, plt4 = makeplot(0.25), makeplot(0.1), makeplot(0.05), makeplot(0.01)

plot(plt1, plt2,plt3,plt4, fontfmaily=fnt,xlabel="Number individuals", margin=5mm,ylabel="Probability not seen at any location with p < ϵ", size=(1000,1000), dpi=300, xaxis=:log10, xticks=[10^i for i in 1:4], layout=grid(2,2))

savefig("cool.png")