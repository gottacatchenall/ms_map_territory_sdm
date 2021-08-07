using NeutralLandscapes
using StatsBase

sz = 500

mat = rand(DiamondSquare(0.1), sz,sz)
rel = mat ./ sum(mat)

plot(sort(vec(rel))[end:-1:begin])
xaxis!("locations ranked by probability ")
yaxis!("Probability of occurence P(X)")









loc_dist  = countmap(samples)
