
(clear-all)

(define-model addition

(sgp :esc t :lf .05)

(chunk-type number number next)
(chunk-type add arg1 arg2 sum count)

(add-dm
 (zero isa number number zero next one)
 (one isa number number one next two)
 (two isa number number two next three)
 (three isa number number three next four)
 (four isa number number four next five)
 (five isa number number five next six)
 (six isa number number six next seven) ;; ERR: eight should be seven
 (seven isa number number seven next eight)
 (eight isa number number eight next nine)
 (nine isa number number nine next ten)
 (ten isa number number ten)
 (test-goal ISA add arg1 two arg2 three)) ;; ERR: goal never focused / used, and number should be adjusted, e.g 2+3

(P initialize-addition
   =goal>
      ISA add ;; ERR: missing the optional keyword "isa" for provided optional chunk-type add
      arg1        =num1
      arg2        =num2
      sum         nil
  ==>
   =goal> ;; ERR: syntax missing ">"
      ISA         add
      sum         =num1
      count       zero
   +retrieval>
      ISA         number
      number      =num1
)

(P terminate-addition
   =goal>
      ISA         add
      count       =num
      arg2        =num ;; ERR: arg2 should be arg1, so =num2 is wrong for the termination logic of addition
      sum         =answer ;; ERR: typo, should be sum 
  ==>
   =goal>
      ISA         add
      count       nil
      !output!   =answer ;; ERR: missing !output! for the answer to actually be printed

)

(P increment-count ;; ERR: use correct name for the production, logic does increment the count not the sum
   =goal>
      ISA         add
      sum         =sum
      count       =count
   =retrieval>
      ISA         number
      number      =count ;; ERR: we want to retrive the next count, not the next sum
      next        =newcount
==>
   =goal>
      ISA         add
      count       =newcount
   +retrieval>
      ISA        number
      number     =sum
)

(P increment-sum
   =goal>
      ISA         add
      sum         =sum
      count       =count
    - arg2        =count
   =retrieval>
      ISA         number
      number      =sum ;; ERR: match on the exact chunk (number and next number) given our current sum
      next        =newsum
==>
   =goal>
      ISA         add
      sum         =newsum
   +retrieval>
      ISA         number
      number      =count
   
)

(goal-focus test-goal) ;; ERR: focus added for the goal (goal module function)

) ;; ERR: missing ) for define-model