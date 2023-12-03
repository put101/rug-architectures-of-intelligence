## Team 77
- Tobias Pucher (S5751659)
- Matthias Heiden (S5751616)

---

In a separate pdf file, show the output of your model, and answer the following questions:

## What is the effect of manipulating the parameters below on the pattern of the results? Explain the reason behind it. It is useful to think in advance what the effect might be, instead of just trying it out. Of course, it is still a good idea to also try it out.

- Retrieval Threshold, τ (:rt, typical values -1.0 to 2.0)
- Latency Factor, F (:lf, typical values range from .1 to 2) 
- Activation noise, s (:ans  range 0.1-0.8)

## The model you constructed uses two strategies sequentially. First, it fires production rules that try to retrieve the answer from memory. If that retrieval fails, it fires production rules that calculate the answer through counting. This model is inspired by an older model from Gordon Logan. This original model executed both strategies (counting and retrieval) in parallel. That is, it attempted to retrieve the answer and, at the same time, it started to count. The final answer was provided by the strategy that finished first. Would it be possible to implement such a parallel strategy in ACT-R? If yes, what would such a model look like? If no, why is it not possible?

No. TODO: Was covered in the lecture

## If you think about how the brain processes information, do you think it could do counting and retrieval in parallel? What would be requirement for this?
