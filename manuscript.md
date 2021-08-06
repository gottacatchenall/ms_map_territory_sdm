---
bibliography: [references.bib]
---

> Nature does not prepare distributions, only states
>
> ET Jaynes, _Probability theory as logic_


A species distribution is not a property of nature. Species (controversies about
precise definition aside) are composed of discrete objects, individual
organisms, which occupy points in space and move through time.

A species distribution model (SDM) is a model which typically assigns a
probability $p$ to each coordinate$\vec{x}_i$ in space. But what is meant by
this value $p$? This is interpreted as the probability that a given individual
of the species will be observed there. But by assuming a distribution, we take
something that is discrete --- the finite number of individuals of a species
that exist in space --- and approximate it as continuous, effectively as if
there were infinitely many individuals of that species. Regardless of the
paradigm used to design the statistical model $f$, this is fundamentally a
_frequentist_ view of probability! A more appropriate way to view this would be
the probability you observe an individual at a location $\vec{x}$ as conditional
on there being $N$ total individuals of a given species,  $p = P(\vec{x} | N)$.


If we consider the purpose of an SDM instead to takes a set of observed points
$\mathbf{O} = \{\vec{o}_1, \vec{o}_2, \dots\}$ You want to predict the true
state, $\mathbf{X} = \{\vec{x}_1, \vec{x}_2, \dots\}$. Note that typically $|O|
\ll |X|$.

We train/fit some statistical model $f$ which maps locations and parameters to
predicted probability of observing a species, $p=f(\vec{x}_i, \theta)$.

As for loss functions, a useful species distribution should be that which when
we sample from it, it provides predictive capacity as to the true state of
locations $\mathbf{X}$ at time $t$.

You can also interpret SDMs through the lens of environmental state space, where
$E(\mathbf{O}) = \{\vec{e}_1 \}$  to probability of occurrence.


Jaynes on the mind-projection fallacy. You will find this everywhere in the
history of science. Quantum mechanics has an object that much like a species
distribution model: the wave function $\psi$ describing the probability of
observing a particle across space. Much like SDMs, this object caused people to
get caught up the idea that "probability" is a fixed property of nature rather
than an abstraction used describe what we can say about a system given a set of
information.

# References
