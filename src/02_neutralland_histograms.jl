using NeutralLandscapes
using StatsBase

sizes = 5:100

plot()
for sz in sizes

    mat = rand(DiamondSquare(0.1), sz,sz)
    rel = mat ./ sum(mat)

    plot!(sort(vec(rel))[end:-1:begin])
end

λ = 0.1
plot!(x-> λ*exp(-λ*x), ls=:dash, c=:gray9)
xaxis!(:log10,"locations ranked by probability")
yaxis!("Probability of occurence P(X)")







loc_dist  = countmap(samples)
