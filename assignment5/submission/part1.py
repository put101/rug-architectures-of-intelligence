# Team 77
# - Tobias Pucher (S5751659)
# - Matthias Heiden (S5751616)

import nengo
import numpy as np

model = nengo.Network()
with model:
    # =================================================================================================
    # Define the stimulus for the model as a sine wave, which
    # will can passed to the ensembles.
    #
    def sin_func(t):
        return np.sin(2*t)
    stim = nengo.Node(sin_func)

    # =================================================================================================
    # Define the ensembles (=a group of neurons that collectively represent a vector) for the model.
    #
    a = nengo.Ensemble(n_neurons=100, dimensions=1)
    b = nengo.Ensemble(n_neurons=100, dimensions=1)
    c = nengo.Ensemble(n_neurons=100, dimensions=1)
    # note: 2 dimensions, representing 2 values
    d = nengo.Ensemble(n_neurons=100, dimensions=2)

    # =================================================================================================
    # Connect the stimulus and ensembles:
    #

    # Connect stimulus to a
    nengo.Connection(stim, a)

    # Connect stimulus to d[0] (first dimension of d)
    nengo.Connection(stim, d[0])

    # a to b calculates the square of a centered around 0
    def centered_square(x):
        return x * x - .5
    nengo.Connection(a, b, function=centered_square)

    # b to c is a connection that only gives half input to c
    nengo.Connection(b, c, transform=.5)

    # c to c is a recurrent connection (simple memory)
    nengo.Connection(c, c, synapse=.1)

    # c to d[1] (second dimension of d)
    nengo.Connection(c, d[1])
