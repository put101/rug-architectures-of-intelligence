In a separate pdf file, show the outcomes of your model in a table or a figure, (i.e., what reaction times it predicts) and answer the following questions: 


## The reaction times produced by your subitizing model will probably not fit the human reaction times perfectly. In what way(s) do they differ from each other? Discuss absolute deviation of the reaction times, as well as the general pattern of times.

Observations increases in times for different patterns (number of letters)
- This can be seen as the average time increase for each new item in the range 1 to 4 items is (0.86-0.60)/4 = 65ms
- The average time increase for the rest of the items is (2.58 -0.86) / 6 = 28.6ms

Because the model is linear the average reactiontime increase of 18ms per item applies to all experiment sizes and is therefore fundamentally different than the real human model or "curve".

- The models reaction times for 1 letter is very human like.
- For patterns with smaller numbers the linear model gives worse reaction times than humans. 
- Then the model performs similar to humans for 5-7 letters and for 8-10 onwards the model starts to deviate from the human experiments in that it overestimates the reactionspeed. Therefore giving too low numbers compared to the orginal human experiment.  

## Why doesn't your model fit the data perfectly? That is, what do people do differently from your model?

- No duplicate counts: People need to keep track of what elements they already counted. 
- Humans can process small batches faster and more difficult scenarios with more letters show an increase in reaction time because counting needs to happen. So we think that for <=4 letters no counting happens and instead humans see the pattern (count) as one. 

- Small number of elements can be recognized as patterns by humans. Our current model just counts them linearly.
  - humans can recognize a smaller number of letters (counts) without overhead, i.e the time required for 1 to 4 letters is similar and more complex scenarios with 4+ letters show an increase in time (non-linear)
  - The devation for e.g 9 letters were rather small and the model worked very well. 

- For a larger amount of numbers humans reaction time also does not behave very linear. This can be due to the fact that humans have to make a "counting path" to follow, or think about which ones were already visited, which the model neglects with the parameters of finst set to 10, which we know is too high and the real number should be around 4 instead (to subitize small batches/patterns faster)

