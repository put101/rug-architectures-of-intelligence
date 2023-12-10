(clear-all)

(define-model 1-hit-model 
    
  ;; do not change these parameters
  (sgp :esc t :bll .5 :ol t :sim-hook "1hit-bj-number-sims" 
       :cache-sim-hook-results t :er t :lf 0)
  
  ;; adjust these as needed
  (sgp :v nil :ans .2 :mp 10.0 :rt -60)
  
  ;; This type holds all the game info 
  
  (chunk-type game-state
     mc1 mc2 mc3 mstart mtot mresult oc1 oc2 oc3 ostart otot oresult state)
  
  ;; This chunk-type should be modified to contain the information needed
  ;; for your model's learning strategy
  
  (chunk-type learned-info mc1 action)
  
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
       MC1 =c
    ==>
     =goal>
       state retrieving
     +retrieval>
       isa learned-info
       MC1 =c
       ;; Remove any existing value from the buffer? 
     - action nil)

  ;; Condition: Retrieving state, but couldn't remember a move
  ;; Action: Reset the goal buffer and press 's'
  (p cant-remember-game
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
       key "s")
  
  (p remember-game
     =goal>
       isa game-state
       state retrieving
     =retrieval>
       isa learned-info
       action =act
     ?manual>
       state free
    ==>
     =goal>
       state nil
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
     @retrieval>)
  
  
  (p results-should-hit
     =goal>
       isa game-state
       state results
       mresult =outcome
       MC1 =c
     ?imaginal>
       state free
    ==>
     !output! (I =outcome)
     =goal>
       state nil
     +imaginal>
       MC1 =c 
       action "h")

  (spp results-should-hit :u 10)

  
  (p results-should-stay
     =goal>
       isa game-state
       state results
       mresult =outcome
       MC1 =c
     ?imaginal>
       state free
    ==>
     !output! (I =outcome)
     =goal>
       state nil
     +imaginal>
       MC1 =c 
       action "s") 
  
  (p clear-new-imaginal-chunk
     ?imaginal>
       state free
       buffer full
     ==>
     -imaginal>)
  )
