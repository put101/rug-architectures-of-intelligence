;; Team 77
;; - Tobias Pucher (S5751659)
;; - Matthias Heiden (S5751616)

(clear-all)

(define-model subitize

(sgp :seed (123456 0))
(sgp :v t)
(sgp :show-focus t 
     :visual-num-finsts 10 
     :visual-finst-span 10)

(chunk-type count count step)
(chunk-type number number next vocal-rep)

(add-dm (zero isa number number zero next one vocal-rep "zero")
        (one isa number number one next two vocal-rep "one")
        (two isa number number two next three vocal-rep "two")
        (three isa number number three next four vocal-rep "three")
        (four isa number number four next five vocal-rep "four")
        (five isa number number five next six vocal-rep "five")
        (six isa number number six next seven vocal-rep "six")
        (seven isa number number seven next eight vocal-rep "seven")
        (eight isa number number eight next nine vocal-rep "eight")
        (nine isa number number nine next ten vocal-rep "nine")
        (ten isa number number ten next eleven vocal-rep "ten")
        (eleven isa number number eleven)
        (goal isa count step start)

        (start)
        (encode isa chunk)
        (respond isa chunk) 
        (done isa chunk)
)

; Start point for the model, retrieve unattended letter and start counting with zero
; next step is find-location
(P find-unattended-letter
   =goal>
      ISA         count
      step        start
 ==>
   +visual-location>
      :attended    nil
   =goal>
      step        find-location
      count       zero
)

; Attend each letter one-by-one.
(P attend-letter
   =goal>
      ISA         count
      step        find-location
      count       =num           ; Get the next number by retrieving the corresponding chunk from DM
   =visual-location>
   ?visual>
      state       free
==>
   =goal>
      step        encode
   +visual>
      cmd         move-attention ; attention gets visual object given this location
      screen-pos  =visual-location
   +retrieval>
       number   =num             ; Retrieve the number chunk from DM that is equal to our current count;
                                 ; count has no information on next number, so we have to retrieve number to get number.next
)

; Encode the letter by increasing the count and
; the RHS updates the goal count by one and clears the location chunk and requests an unattended letter 
; when this block is received then the attend-letter will fire and the cycle continues
; but if this retrieval fails because all letters have been attended, then find-location will not match
; instead the start-respond production will match on this buffer-failure and reporting will begin)
(P encode-letter
   =goal>
      ISA         count
      step        encode
      count       =num
   =visual>
   =retrieval>
      number    =num
      next      =num_next           ; Bind next number to 'num_next'
==>
   ;; Update count and find the next letter. 
   =goal>
      ISA         count
      step        find-location     ; step to find next unattended letter
      count        =num_next
   +visual-location>
      :attended    nil              ; request parameter: vision module should try to find the location of an object
                                    ; that the model has not yet looked at (=not attended)
)

; No more letters can be found, so start responding.
; This production will match when the retrieval of the next number fails, because all letters have been attended.
(P start-respond
   =goal>
      ISA         count
      count       =num
   ; Can't find more elements
   ?visual-location>
      buffer      failure
==>
   =goal>
      step        respond
   +retrieval>
      number      =num ; request the number associated to the current cound (to get the vocal-rep)
)

; Respond by placing the vocal-rep representation of the count into the vocal buffer via speak command
(P do-respond
   =goal>
      ISA         count
      step        respond
   =retrieval>
      vocal-rep   =vocal       ; get the vocal-rep for the count number
   ?vocal>   
      state       free
==>
   +vocal>
      ISA         speak
      cmd         speak
      string      =vocal
   -goal>                     ; clear goal buffer to stop the model, no production will match on cleared goal
)

(goal-focus goal)

)
