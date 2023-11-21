# Architectures of Intellince

**lecture 1**

1. general psychological theories of cognition
2. computational environments to develop models of intelligent human behaviour


the course will give
- insight into Architectures and scientific status
- experience modeling within such an Architecture 
- practice comparing simulation result to empirical data
- high-level architecture using ACT-r 
- low-level neural netowrk architecture Nengo


# Glossary
## cognition 
the mental action or process of acquiring knowledge and understanding through thought, experience, and the senses. similar: perception, awareness, learning
**What is cognition?**
"thinking" -> reasoning, planning, reading, reading, learning, listening, etc..

## cognitive architecture
**What is the point of architecture**? 
the complex or carefully designed structure of something.
A cognitive architecture is a specification of the structure of the brain at a level of abstraction that explains how it achieves the function of the mind.

**a unified theory of cognition (UTC)**
A single mechanism should explain multiple phenoma

it should explain:
- thinking and reasoning
- Memory (working memory, long-term memory)
- Vision
- Language
- Motor control
...



# theory
## Knowledge Representations

- declarative Knowledge

we are aware we know and can usually describe to others
"An atom is like a solar system"

- procedual Knowledge
we display in our behaviour, not conscious of it

My ultimate scientific question:
> How does cognition originate from the human brain?

## Allen Newell

His qustion:
> How can the human mind occur in the physical universe?
"I have got to know how the gears clank and how the pistons go"
=> cognitive architecture

## Different levels of abstraction
ACTR-R
high level, requires symbols, end-to-end functionality

Traditional connectionists
level of neurons (groups of neurons), no symbols, some function

Functional connectionists (Nengo, O'Reilly)
level of spiking neurons, end-to-end functionality

Human brain project
highly detailed neural level, no symbols, emergent functionality

# modeling


# ACT-R
"Adaptive Control of Thought - Rational"
Is a cognitive architecture

explains how brain achieves human cognition
- models allow to explain performace on task
- predict performace on other taks

## Goals of the project

The first goal:
### A unified theory of cognition
- find out how the human mind can occur in the physical universe
- explain as much as possible of human cognition using a single theory
- the theory should be precise enough to be implemented in a computer

It does this by:
- providing a computational simulation environment that implements the cognitive architecture (=physical theory)
- providing the general cognitive architecture, NOT the knowledge for doing a particual task (=cognitive model)

### Testable predictions

Predictions should be as fine-grained as possible

---

What is not the goal when writing a model in ACT-R? 
The goal is not to write the most efficient and "elegant" code, it is not a programming Language.

## First example models
### Modular Production system

#### declarative memory (chunks)
knowledge we are aware of
facts bots semantic and episodic

name
chunk-type
slots : values

What is a chunk / what not?
e.g large numbers might not be included in this memory..
It is your responsibility as the modeler to chose an appropriate form of knowledge representation!

#### procedural memory (productions)
- Sequences of skills and actions (often difficult to articulate)
- Productions in ACT-R
condition -> action rules
pattern matching on buffers
if the conditions match the buffers, the rule "fires", which takes 50 ms
only one production can fire at a time

if matches then fires changing state of buffers



#### buffers (can contain one chunk of information)

move information between modules
this movement is done by production rules
their actions can be thought of as tiny conveyor belts that move productions throughout the system.


