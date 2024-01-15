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

    learning_connection = nengo.Connection(
        pre_learning, post_learning, transform=0, learning_rule_type=nengo.PES(learning_rate=1e-4))

    # error ensamble to base the training on
    error = nengo.Ensemble(n_neurons=10, dimensions=1)
    nengo.Connection(error, learning_connection.learning_rule)

    # calculate the error
    # -1 because we want the error to have the correct sign
    # also learn the square
    e0 = nengo.Connection(pre_learning, error, transform=-1, function=np.square)
    e1 = nengo.Connection(post_learning, error, transform=1)

    # build model without actually running it
    with nengo.simulator.Simulator(model, progress_bar=False) as weights_sim:
        pass

    # get weights and print
    weights = weights_sim.data[learning_connection].weights

    print("weights")
    print(weights)

    print(weights_sim.data[e0].weights)
    print(weights_sim.data[e1].weights)
