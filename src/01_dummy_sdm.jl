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