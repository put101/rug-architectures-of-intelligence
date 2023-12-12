# Team 77
# - Tobias Pucher (S5751659)
# - Matthias Heiden (S5751616)

import nengo

model = nengo.Network()
with model:
    
    # Now build your own model, consisting of one stimulus node and three ensembles, a, b, and c:
    #
    stim = nengo.Node(0)
    
    a = nengo.Ensemble(n_neurons=100, dimensions=1)
    b = nengo.Ensemble(n_neurons=100, dimensions=1)
    c = nengo.Ensemble(n_neurons=100, dimensions=1)
    
    # Connect the stimulus and ensembles as follows:
    # - stimulus to a is a simple connection without transformations or functions.
    # - a to b calculates the square of a centered around 0: a*a - .5.
    # - b to c is a connection that only gives half input to c, by specifying transform=.5.
    # - make c into a simple memory by specifying a recurrent connection from c to c. 
    #   As in tutorial 11, set the synaptic constant of this connection to 100 ms. 
    #
    def centered_square(x):
        return x * x - .5;

    nengo.Connection(stim, a)
    nengo.Connection(a, b, function=centered_square)
    nengo.Connection(b, c, transform=.5)
    nengo.Connection(c, c, synapse=.1)