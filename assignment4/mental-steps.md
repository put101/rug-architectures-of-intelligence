# Mental steps the model takes

1. can I remember a similar situation and the action I took? 
   1. -> If so, make that action.
   2. -> If not then I should stay. 
2. On feedback: is there some pattern in the cards, actions, and results which indicates the action I should have taken?
   1.  -> If so create a memory of the situation for this game and the action to take. 
   2.  -> Otherwise, just wait for the next hand to start.

Things to improve for those two main steps:
1. The information which it considers when making its initial choice
2. How it interprets the feedback at the end of the hand so that it creates chunks which have appropriate information about the actions it should take based on the information that is available
   Current:
   Better:


if winner: 
   store it
else:
   clear without harvesting