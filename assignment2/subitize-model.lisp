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
      count       =num      ; TODO: Why do we need this? 
   =visual-location>
   ?visual>
      state       free
==>
   =goal>
      step        encode
   +visual>
      cmd         move-attention
      screen-pos  =visual-location
   +retrieval>
       number   =num    ; Retrieve number and bind to 'num'
)

(P encode-letter
   =goal>
      ISA         count
      step        encode
      count       =num
   =visual>
   =retrieval>
      number    =num
      next      =num_next   ; Bind next number to 'num_next'
==>
   ;; Update count and find the next letter. 
   =goal>
      ISA         count
      step        find-location
      count        =num_next
   +visual-location>
      :attended    nil
)

; No more letters can be found, so start responding.
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
      number      =num
)

; Respond by typing the count.
(P do-respond
   =goal>
      ISA         count
      step        respond
   =retrieval>
      vocal-rep   =vocal
   ?vocal>   
      state       free
==>
   +vocal>
      cmd         speak
      string      =vocal
   -goal>
)

(goal-focus goal)

)
