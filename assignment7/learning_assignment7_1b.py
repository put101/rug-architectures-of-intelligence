import nengo
import numpy as np

model = nengo.Network()
with model:

    # stimulus node, with fast sine
    stim = nengo.Node(lambda t: np.sin(t*2*np.pi))

    # non-learning part
    pre = nengo.Ensemble(n_neurons=10, dimensions=1)
    post = nengo.Ensemble(n_neurons=10, dimensions=1)
    nengo.Connection(stim, pre)  # stim -> pre
    nengo.Connection(pre, post)  # pre -> post

    # learning part:
    # build a model that learns connection weights between two
    # ensembles, instead of calculating optimal weights like we did up to now.

    pre_learning = nengo.Ensemble(n_neurons=10, dimensions=1)
    post_learning = nengo.Ensemble(n_neurons=10, dimensions=1)

    # create a connection between the two ensembles
    nengo.Connection(stim, pre_learning)

    learning_connection = nengo.Connection(pre_learning.neurons, post_learning.neurons,
                                           transform=np.identity(10))

    # build model without actually running it
    with nengo.simulator.Simulator(model, progress_bar=False) as weights_sim:
        pass

    # get weights and print
    weights = weights_sim.data[learning_connection].weights
    print("weights")
    print(weights)
