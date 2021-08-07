using NeutralLandscapes
using StatsBase

sizes = 5:100

plot()
for sz in sizes

    mat = rand(DiamondSquare(0.1), sz,sz)
    rel = mat ./ sum(mat)

    plot!(sort(vec(rel))[end:-1:begin], c = :grey50)
end

λ = 0.1
plot!(x-> 0.1*exp(-0.1*x), ls=:dash, lw=2, c=:blue)
plot!(x-> 0.05*exp(-0.05*x), ls=:dash, lw=2, c=:green)
plot!(x-> 0.01*exp(-0.01*x), ls=:dash, lw=2, c=:red)
plot!(x-> 0.005*exp(-0.005*x), ls=:dash, lw=2, c=:pink)

# from this i like lambda 10^-1 to 10^-5 as sim limits

xaxis!(:log10,"locations ranked by probability")
yaxis!("Probability of occurence P(X)")







loc_dist  = countmap(samples)
