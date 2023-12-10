## Team 77
- Tobias Pucher (S5751659)
- Matthias Heiden (S5751616)

## Show the learning of your model in a graph

## Describe which information you store in memory, and explain why. Why don't you store more or less information?

ostart
mstart

More information: Can't remember as many games. 
Less information: Can't remember the details needed to win the games.

Sweet spot: Bell curve
![](https://i.kym-cdn.com/entries/icons/original/000/035/645/cover4.jpg)
- Left: To little information saved, can't win games
- Right: To much information saved, can only remember a few games. Not enough to win on average.

## Explain why you need partial matching for this model; explain what would happen if you could not use partial matching.

- Incremental learning
- Generalization

Aadapt to variations and still trigger relevant productions based on the available information.

Flexible Matching:
    In a dynamic environment like a poker game, the exact state of the game may not always match the conditions specified in the production rules. Partial matching allows the system to adapt to variations and still trigger relevant productions based on the available information.

Noise Tolerance:
    In real-world scenarios, there can be noise or uncertainty in the input data. Partial matching allows the system to handle situations where not all information is precise or complete. This is important for robustness in the face of imperfect or noisy data.

Incremental Learning:
    Partial matching supports incremental learning. As the model interacts with the environment and learns from experience, it may encounter new states or variations in the input. Partial matching allows the model to generalize its learned knowledge to similar but not identical situations.

Adaptability to Changes:
    If the game rules or conditions evolve over time, partial matching provides a level of adaptability. Productions can still be triggered even if there are modifications to the game state or the structure of the information stored in buffers.

Expressiveness:
    Partial matching enables the model to express rules and conditions in a more flexible and abstract manner. This can be beneficial for capturing complex patterns and relationships in the game dynamics.

## Partial matching is calculated across the slots in your retrieval request. What is the effect of specifying more slots in your request as compared to fewer?

## Discuss whether this is a plausible model of playing black jack, and why/why not.
