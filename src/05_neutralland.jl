using NeutralLandscapes
using Plots
using Distributions

sz = 100

m = rand(MidpointDisplacement(0.8), sz,sz)

mdist= m ./ sum(m)
nreplicates = 30
abundance = [10^i for i in 2:5]
dists = [] 

for ab in abundance
    realizeddist = zeros(sz,sz)
    for r in 1:nreplicates 
        thisdist = zeros(sz,sz)
        for s in 1:ab
            thisdist[rand(Categorical(vec(mdist)))] += 1
        end
        thisdist = thisdist ./ sum(thisdist)
        realizeddist .+= thisdist
    end
    realizeddist = realizeddist ./ nreplicates
    push!(dists, realizeddist)

end


plot(
heatmap(mdist, colorbar=:none, title="'true' SDM"),
heatmap(dists[1],colorbar=:none,title="Mean realized SDM with N = 100"),
heatmap(dists[2],colorbar=:none,title="Mean realized SDM with N = 1000" ),
heatmap(dists[3],colorbar=:none,title="Mean realized SDM with N = 1000"),
heatmap(dists[4],colorbar=:none,title="Mean realized SDM with N = 10000"),
)

