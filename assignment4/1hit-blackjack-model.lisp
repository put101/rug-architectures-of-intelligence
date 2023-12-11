(clear-all)

(define-model 1-hit-model
    
  ;; do not change these parameters
  (sgp :esc t :bll .5 :ol t :sim-hook "1hit-bj-number-sims" 
       :cache-sim-hook-results t :er t :lf 0)
  
  ;; adjust these as needed
  (sgp :v nil :ans .2 :mp 15 :rt -5)
  
  ;; This type holds all the game info 
  (chunk-type game-state
     mc1 mc2 mc3 mstart mtot mresult oc1 oc2 oc3 ostart otot oresult state)
  
  ;; This chunk-type should be modified to contain the information needed
  ;; for your model's learning strategy
  (chunk-type learned-info  mstart ostart action)
  
  ;; Declare the slots used for the goal buffer since it is
  ;; not set in the model defintion or by the productions.
  ;; See the experiment code text for more details.
  (declare-buffer-usage goal game-state :all)
  
  ;; Create chunks for the items used in the slots for the game
  ;; information and state
  (define-chunks win lose bust retrieving start results)
    
  ;; Provide a keyboard for the model's motor module to use
  (install-device '("motor" "keyboard"))
  
  ;; Condition: Match on start state and value in MC1 (first model card).
  ;; Action: Set goal buffer state to 'retrieving' and try to remember a move.
  (p start
     =goal>
       isa game-state
       state start
       mstart =ms
       ostart =os
  ==>
     =goal>
       state retrieving
     +retrieval>
       isa learned-info
       mstart =ms
       ;; Remove any existing value from the buffer
     - action nil
  )

  ;; Condition: Failed to remember a move
  ;; Action: Press h with a probability of 0.5 or s with a probability of 0.5
  (p cant-remember-game-hit
    =goal>
      isa game-state
      state retrieving
    ?retrieval>
      buffer  failure
    ?manual>
      state free
  ==>
    =goal>
      state nil
    +manual>
      cmd press-key
      key "h"
  )
  
  ;; Condition: Failed to remember a move
  ;; Action: Press h with a probability of 0.5 or s with a probability of 
  (p cant-remember-game-stay
    =goal>
      isa game-state
      state retrieving
    ?retrieval>
      buffer  failure
    ?manual>
      state free
  ==>
    =goal>
      state nil
    +manual>
      cmd press-key
      key "s"
  )
  
  ;; Condition: Retrieving state, and could remember a move
  ;; Action: Press the key with the action that was remembered
  (p remember-game
     =goal>
       isa game-state
       state retrieving
     ;; Successfully retrieved information
     =retrieval>
       isa learned-info
       action =act ;; action that was remembered
     ?manual>
       state free
  ==>
     =goal>
       state nil
     ;; Press the key with the action that was retrieved
     +manual>
       cmd press-key
       key =act
     
     ;; overwrite action and its purpose is to have the production modify the chunk in a buffer
     ;; - The difference between the overwrite and modification operators is that with the overwrite 
     ;;   action only the slots and values specified in the overwrite action will remain in the chunk 
     ;;   in the buffer – all other slots and values are erased
     ;; 
     ;; Why is this needed? To prevent that chunk from merging back into declarative memory 
     ;; and strengthening the chunk which was retrieved. The chunk which was retrieved 
     ;; may not be the best action to take in the current situation either because it was retrieved
     ;; due to noise or because the model does not yet have enough experience to accurately determine 
     ;; the best move
     @retrieval>
  )

  ;; Condition: When we won the game and know the result. And we did hit.
  ;; Action: Learn the combination of opponents score and our score and the action we took (hit)
  (p results-should-hit-win
     =goal>
       isa game-state
       state results
       mresult win
       mstart  =ms
       ostart  =os
       - mc3 nil ;; did hit
     ?imaginal>
       state free
    ==>
     =goal>
       state nil
     +imaginal> ;; learn this combination
       isa learned-info
       mstart =ms
       ostart =os
       action "h"
  )

  ;; Condition: When we won the game and know the result. And we did stay.
  ;; Action: Learn the combination of opponents score and our score and the action we took (stay)
  (p results-should-stay-win
     =goal>
       isa game-state
       state results
       mresult win
       mstart =ms
       ostart =os
       mc3 nil ;; did stay
     ?imaginal>
       state free
    ==>
     =goal>
       state nil
     +imaginal>
       isa learned-info
       mstart =ms
       ostart =os
       action "s"
  )

  ;; Condition: We know the result (game lost)
  ;; Action: Don't learn anything. We only want to remember combinations that lead to 
  ;;         a win (positive reinforcement). There are way too many combinations that lead to a loss.
  (p results-no-act-if-lose
     =goal>
       isa game-state
       state results
       mresult lose
     ?imaginal>
       state   free
    ==>
     =goal>
       state nil
	   +imaginal>
       isa learned-info
       mstart nil
       ostart nil
       action nil
  )

  ;; Clear the imaginal chunk if the buffer is full
  (p clear-new-imaginal-chunk
      ?imaginal>
        state free
        buffer full
      ==>
      -imaginal>
  )
)