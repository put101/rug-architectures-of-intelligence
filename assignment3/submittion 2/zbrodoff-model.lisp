;; Team 77
;; - Tobias Pucher (S5751659)
;; - Matthias Heiden (S5751616)

(clear-all)

(define-model zbrodoff
    
(sgp :show-focus t 
     :visual-num-finsts 10 
     :visual-finst-span 10)
(sgp :v t :esc t :lf 0.375 :bll 0.5 :ans 0.45 :rt 1.1 :ncnar nil)

(sgp :show-focus t)

;; (sgp :act t)

(chunk-type problem arg1 arg2 result)
(chunk-type goal state count target next-let next-num)
(chunk-type number number next visual-rep vocal-rep)
(chunk-type letter letter next visual-rep vocal-rep)

(add-dm
 (zero  ISA number number zero next one visual-rep "0" vocal-rep "zero")
 (one   ISA number number one next two visual-rep "1" vocal-rep "one")
 (two   ISA number number two next three visual-rep "2" vocal-rep "two")
 (three ISA number number three next four visual-rep "3" vocal-rep "three")
 (four  ISA number number four next five visual-rep "4" vocal-rep "four")
 (five  ISA number number five)
 (a ISA letter letter a next b visual-rep "a" vocal-rep "a")
 (b ISA letter letter b next c visual-rep "b" vocal-rep "b")
 (c ISA letter letter c next d visual-rep "c" vocal-rep "c")
 (d ISA letter letter d next e visual-rep "d" vocal-rep "d")
 (e ISA letter letter e next f visual-rep "e" vocal-rep "e")
 (f ISA letter letter f next g visual-rep "f" vocal-rep "f")
 (g ISA letter letter g next h visual-rep "g" vocal-rep "g")
 (h ISA letter letter h next i visual-rep "h" vocal-rep "h")
 (i ISA letter letter i next j visual-rep "i" vocal-rep "i")
 (j ISA letter letter j next k visual-rep "j" vocal-rep "j")
 (k ISA letter letter k next l visual-rep "k" vocal-rep "k")
 (l ISA letter letter l)
 (goal ISA goal)
 (attending) (read) (count) (counting) (encode) 
 (try-recall) ;; added new state for the retrival productions
 )

(set-visloc-default screen-x lowest)

;; ATTEND -> 
;; READ-FIRST -> ATTEND-> ENCODE-FIRST 
;; -> READ-SECOND -> ATTEND -> ENCODE-SECOND
;; -> READ-THIRD  -> ENCODE-THIRD

;; -> CANT-RECALL  -> START-COUNTING -> INITIALIZE-COUNTING -> UPDATE-RESULT <-> UPDATE-COUNT -> FINAL-ANSWER-YES/NO
;; or CAN-RECALL -> (skipping counting) FINAL-ANSWER-YES/NO

(P attend 
   =goal>
      ISA         goal
      state       nil
   =visual-location>
   ?visual>
       state      free
==>
   =goal>
      state       attending
   +visual>
      cmd         move-attention
      screen-pos  =visual-location
   )

(P read-first ;; attend the first letter and then attend to then read second
   =goal>
     ISA         goal
     state       attending
   =visual>
     ISA         visual-object
     value       =char
   ?imaginal>
     buffer      empty
     state       free   
==>
   +imaginal>
   +retrieval>
     isa         letter
     visual-rep  =char
   =goal>
     state       nil
   +visual-location> ;; prepare location for second
     ISA         visual-location
   > screen-x    current
     screen-x    lowest
   - value       "+"
   )

(p encode-first ;; use the first retrived letter and put it into imaginal arg1
   =goal>
     isa           goal
     state         attending
   =retrieval>
     letter        =let
     vocal-rep     =word
   =imaginal>
     arg1          nil
   ?vocal>
     preparation   free
==>
   +vocal>
     cmd           subvocalize
     string        =word
   =imaginal>
     arg1          =let
   =goal>
     state         read
   )

(P read-second ;; read second number and request its representation and attend then read third
   =goal>
     ISA         goal
     state       read
   =visual>
     ISA         visual-object
     value       =char
   =imaginal>
     isa         problem
    - arg1       nil
     arg2        nil
==>
   =imaginal>
   +retrieval>
     isa         number
     visual-rep  =char
   
   =goal>
     state       nil
   
   +visual-location> ;; prepare the location for third
     ISA         visual-location
     screen-x    highest
   )

(p encode-second 
   =goal>
     isa          goal
     state        attending
   =retrieval>
     number       =num
     vocal-rep    =word
   =imaginal>
    - arg1        nil
     arg2         nil
   ?vocal>
     preparation  free
   ==>
   +vocal>
     cmd          subvocalize
     string       =word
   =imaginal>
     arg2         =num
   =goal>
     state        read
   )

(P read-third ;; read third letter, request its representation and continue with encoding 
   =goal>
     ISA         goal
     state       read
   =imaginal>
     isa         problem
     arg1        =arg1
     arg2        =arg2
   =visual>
     ISA         visual-object
     value       =char
   ?visual>
     state       free
==>
   =imaginal>
   +retrieval>
     isa         letter
     visual-rep  =char
   =goal>
     state       encode
   +visual>
     cmd         clear
   )

(p encode-third
   =goal>
     isa          goal
     state        encode
     target       nil
   =retrieval>
     letter       =let
     vocal-rep    =word
   =imaginal>
     arg1         =a1
     arg2         =a2
   ?vocal>
     preparation  free
==>
   +vocal>
     cmd          subvocalize
     string       =word
   =goal>
     target       =let
     state        try-recall ;; Idea: Do not start counting but try to recall (retrieval) and start counting if failure to retrieve
   +retrieval> 
    arg1 =a1
    arg2 =a2
   =imaginal>
   )

(p can-recall ;; successful recall
  =goal>
    state try-recall
    target =let
  =imaginal>
    arg1 =a1
    arg2 =a2
  =retrieval> ;; retrieve chunk that counted the given args previously (result can differ from imaginal)
    isa problem
    arg1 =a1
    arg2 =a2
    result =prev_res ;; result is the chunk that counted the given args previously
==> ;; in the end result (imaginal) is compared to target (goal)
  =imaginal> ;; prevent harvest
    result =prev_res ;; will be compared to target in the final productions
  =goal>
    count =a2 ;; just to trigger the final productions
)

;; can't recall -> start counting
(p cant-recall
  =goal>
    isa goal
    state try-recall
  =imaginal>
    arg1 =a1
    arg2 =a2
  ?retrieval>
    buffer failure
==>
  =goal>
    state count ;; continue with counting
  =imaginal>
)

(P start-counting 
   =goal>
     ISA         goal
     state       count
   =imaginal>
     isa         problem
     arg1        =a
     arg2        =val
==>
   =imaginal>
     result      =a
   =goal>
     state       counting
   +retrieval>
     ISA         letter
     letter      =a
   )

(p initialize-counting
   =goal>
     isa         goal
     state       counting
     count       nil
   =retrieval>
     isa         letter
     letter      =l
     next        =new
     vocal-rep   =t
   ?vocal>
     state       free
==>
   +vocal>
     isa         subvocalize
     string      =t
   =goal>
     next-num    one
     next-let    =new
     count       zero
   +retrieval>
     isa         letter
     letter      =new
   )


(P update-result
   =goal>
     ISA         goal
     count       =val
     next-let    =let
     next-num    =n
   =imaginal>
     isa         problem
    - arg2       =val
   =retrieval>
     ISA         letter
     letter      =let
     next        =new
     vocal-rep   =txt
   ?vocal>
     state       free
==>
   =goal>
     next-let    =new
   +vocal>
     cmd         subvocalize
     string      =txt
   =imaginal>
     result      =let ;; updates the result to next-letter (problem chunk)
   +retrieval>
     ISA         number
     number      =n
   )

(P update-count
   =goal>
     ISA         goal
     next-let    =let
     next-num    =n
   =retrieval>
     ISA         number
     number      =val
     next        =new
     vocal-rep   =txt
   ?vocal>
     preparation free
==>
   +vocal>
     cmd         subvocalize
     string      =txt
   =goal>
     count       =val
     next-num    =new
   +retrieval>
     ISA         letter
     letter      =let
   )


(P final-answer-yes
   =goal>
     ISA         goal
     target      =let
     count       =val
   =imaginal>
     isa         problem
     result      =let
     arg2        =val
   
   ?manual>
     state       free
==>
   +goal>
     
   +manual>
     cmd         press-key
     key         "k"
   )

(P final-answer-no
    =goal>
     ISA         goal
     count       =val
   - target      =let
   =imaginal>
     isa         problem
     result      =let
     arg2        =val
   
   ?manual>
     state       free
==>
   +goal>
     
   +manual>
     cmd         press-key
     key         "d"
   )

(set-all-base-levels 100000 -1000)
(goal-focus goal)
)
