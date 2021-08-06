---
bibliography: [references.bib]
---

> Nature does not prepare distributions, only states
>
> ET Jaynes


> I would warn you that I do not attribute to nature either beauty or deformity, order or confusion. Only in relation to our imagination can things be called beautiful or ugly, well-ordered or confused
>
> a common misquote attributed to Baruch Spinoza, assembled from
> translated pieces of Ethics Part I. 


Species do not have distributions. This may seem a radical claim, given the rise
of species distribution modeling as both a field of study and imperative for
ecosystem management over the last several decades. But, species are composed of
discrete objects---individual organisms that occupy points in space and which
move through time. The location of every individual organism of a particular
species at a particular time is an observable value, which we could feasibly
write down.

A species distribution is not some inherent property of nature that belongs to a
species, but a conceptual framework that we invoke because we know that our
sample of observed individuals is incomplete, and in many contexts these
individuals will continue to move post-observation. The goal of an species
distribution model (SDM) instead to takes a set of coordinates of observed
occurrence of a species $\mathbf{O} = \{\vec{o}_1, \vec{o}_2, \dots\}$ and to
best describe a distribution $D$ such that  the true coordinates, denoted
$\mathbf{X} = \{\vec{x}_1, \vec{x}_2, \dots\}$ are likely to have been drawn
from this distribution. Note that typically $|O| \ll |X|$, as is the reason we
don't try to measure the location every individual in the first place (that
being said, for charismatic megafauna that are nearly extinct, this _is_ what we
do, precisely because it is feasible).

Many approaches have been taken to design SDMs, but almost universally the
output of an SDM is a probability of occurrence, denoted $p(\vec{x}_i)$,
associated with each location $\vec{x}_i$ in space. This forms a distribution as
$\sum_{x_i} p(x_i) = 1$. This is often referred to in plain
language as "occurrence probability". But what is meant by this value $p$? Is it
the probability conditional on observing an individual that it will be observed
at that location? Or is it the probability that an observer would find an
individual of this species at location if they "look"?

This semantic confusion is a by-product of using a distribution as a tool to
model something that is discrete --- the finite number of individuals of a
species that exist in space --- and approximate it as continuous, effectively as
if there were infinitely many individuals of that species. Regardless of the
paradigm used to design the statistical model that associates occurrences with
probabilities as a function of environmental conditions, this is fundamentally a
_frequentist_ view of probability! A more appropriate way to view this would be
the probability you observe an individual at a location $\vec{x}$ as conditional
on there being $N$ total individuals of a given species across the entire
spatial domain,  $p = P(\vec{x} | N)$--- we illustrate this using a "sandbox"
SDM in the next section.

Jaynes on the mind-projection fallacy:

>  In studying probability theory, it was vaguely troubling to see reference to "Gaussian
random variables", or "stochastic processes", or "stationary time-series", or "disorder", as if the
property of being Gaussian, random, stochastic, stationary, or disorderly is a real property, like the
property of possessing mass or length, existing in Nature...
> As soon as the error had a definite name and description, it was much easier to recognize.
Once one has grasped the idea, one sees the Mind Projection Fallacy everywhere; what we have
been taught as deep wisdom, is stripped of its pretensions and seen to be instead a foolish non
sequitur. The error occurs in two complementary forms, which we might indicate thus:
>
> A): My own imagination -> Real property of Nature
>
> B): My own ignorance -> Nature is indeterminate

You will find this everywhere in the history of science. Quantum mechanics has
an object that much like a species distribution model: the wave function $\psi$
describing the probability of observing a particle across space. Much like SDMs,
this object caused people to get caught up the idea that "probability" is a
fixed property of nature rather than an abstraction used describe what we can
say about a system given a set of information.

# An illustration

Dare I say it, but this section may contain multiple integrals.

In practice, an SDM is described by an $n$x$m$ raster where the value of the
raster at an index $(x,y)$ is here denoted $A_{xy}$.

The goal in this section is to construct a figure where the x-axis is species
abundance $N$, and the y-axis is the probability that $N$ observations of this
species all occur in cells of the raster with a probability-value $A_{xy}$ that
is greater than some threshold $\rho$.

What is the probability that for a given observation of an individual, that this
observation occurs in a cell with a value above some threshold $\rho$?

$P(A_{xy} > \rho)$



**Figure 1**: sandbox sdm. Simulate probability of occurrence in region with
$p_min$. X-axis is true abundance, y-axis is probability that an individual will
be observed in the $p_min$ region of the SDM in $G$ generations, where the
realized locations of the $N$ individuals in generation $g$ is drawn from the
sandbox SDM.





# References
