;; Team 77
;; - Tobias Pucher (S5751659)
;; - Matthias Heiden (S5751616)

(clear-all)

(define-model tutor-model
    
(sgp :esc t :lf .05 :trace-detail medium)

;; how does mental column-addition work?
;; the goal is to add two numbers
;; for this we use smaller chunks that represent the basic
;; addition operations so that we can add the numbers up
;; columnwise from lowest to highest with respect to the carry

;; Add Chunk-types here
(chunk-type add-digits a b sumDigit carry sum)
;; a + b = sum + carry

;; a1a0 + b1b0 = sum1sum0 + carry
(chunk-type add-numbers a1 a0 b1 b0 sum1 sum0 carry state) 
;; represents column-wise addition of two 2-digit numbers

;; Add Chunks here
;; addition knowledge for two digits (a,b) and carry
;; and additions for adding a carry of 1 to possible results
(add-dm
(c-add-d00 ISA add-digits a 0 b 0 sumDigit 0 carry 0 sum 0)
(c-add-d01 ISA add-digits a 0 b 1 sumDigit 1 carry 0 sum 1)
(c-add-d02 ISA add-digits a 0 b 2 sumDigit 2 carry 0 sum 2)
(c-add-d03 ISA add-digits a 0 b 3 sumDigit 3 carry 0 sum 3)
(c-add-d04 ISA add-digits a 0 b 4 sumDigit 4 carry 0 sum 4)
(c-add-d05 ISA add-digits a 0 b 5 sumDigit 5 carry 0 sum 5)
(c-add-d06 ISA add-digits a 0 b 6 sumDigit 6 carry 0 sum 6)
(c-add-d07 ISA add-digits a 0 b 7 sumDigit 7 carry 0 sum 7)
(c-add-d08 ISA add-digits a 0 b 8 sumDigit 8 carry 0 sum 8)
(c-add-d09 ISA add-digits a 0 b 9 sumDigit 9 carry 0 sum 9)
(c-add-d10 ISA add-digits a 1 b 0 sumDigit 1 carry 0 sum 1)
(c-add-d11 ISA add-digits a 1 b 1 sumDigit 2 carry 0 sum 2)
(c-add-d12 ISA add-digits a 1 b 2 sumDigit 3 carry 0 sum 3)
(c-add-d13 ISA add-digits a 1 b 3 sumDigit 4 carry 0 sum 4)
(c-add-d14 ISA add-digits a 1 b 4 sumDigit 5 carry 0 sum 5)
(c-add-d15 ISA add-digits a 1 b 5 sumDigit 6 carry 0 sum 6)
(c-add-d16 ISA add-digits a 1 b 6 sumDigit 7 carry 0 sum 7)
(c-add-d17 ISA add-digits a 1 b 7 sumDigit 8 carry 0 sum 8)
(c-add-d18 ISA add-digits a 1 b 8 sumDigit 9 carry 0 sum 9)
(c-add-d19 ISA add-digits a 1 b 9 sumDigit 0 carry 1 sum 10)
(c-add-d20 ISA add-digits a 2 b 0 sumDigit 2 carry 0 sum 2)
(c-add-d21 ISA add-digits a 2 b 1 sumDigit 3 carry 0 sum 3)
(c-add-d22 ISA add-digits a 2 b 2 sumDigit 4 carry 0 sum 4)
(c-add-d23 ISA add-digits a 2 b 3 sumDigit 5 carry 0 sum 5)
(c-add-d24 ISA add-digits a 2 b 4 sumDigit 6 carry 0 sum 6)
(c-add-d25 ISA add-digits a 2 b 5 sumDigit 7 carry 0 sum 7)
(c-add-d26 ISA add-digits a 2 b 6 sumDigit 8 carry 0 sum 8)
(c-add-d27 ISA add-digits a 2 b 7 sumDigit 9 carry 0 sum 9)
(c-add-d28 ISA add-digits a 2 b 8 sumDigit 0 carry 1 sum 10)
(c-add-d29 ISA add-digits a 2 b 9 sumDigit 1 carry 1 sum 11)
(c-add-d30 ISA add-digits a 3 b 0 sumDigit 3 carry 0 sum 3)
(c-add-d31 ISA add-digits a 3 b 1 sumDigit 4 carry 0 sum 4)
(c-add-d32 ISA add-digits a 3 b 2 sumDigit 5 carry 0 sum 5)
(c-add-d33 ISA add-digits a 3 b 3 sumDigit 6 carry 0 sum 6)
(c-add-d34 ISA add-digits a 3 b 4 sumDigit 7 carry 0 sum 7)
(c-add-d35 ISA add-digits a 3 b 5 sumDigit 8 carry 0 sum 8)
(c-add-d36 ISA add-digits a 3 b 6 sumDigit 9 carry 0 sum 9)
(c-add-d37 ISA add-digits a 3 b 7 sumDigit 0 carry 1 sum 10)
(c-add-d38 ISA add-digits a 3 b 8 sumDigit 1 carry 1 sum 11)
(c-add-d39 ISA add-digits a 3 b 9 sumDigit 2 carry 1 sum 12)
(c-add-d40 ISA add-digits a 4 b 0 sumDigit 4 carry 0 sum 4)
(c-add-d41 ISA add-digits a 4 b 1 sumDigit 5 carry 0 sum 5)
(c-add-d42 ISA add-digits a 4 b 2 sumDigit 6 carry 0 sum 6)
(c-add-d43 ISA add-digits a 4 b 3 sumDigit 7 carry 0 sum 7)
(c-add-d44 ISA add-digits a 4 b 4 sumDigit 8 carry 0 sum 8)
(c-add-d45 ISA add-digits a 4 b 5 sumDigit 9 carry 0 sum 9)
(c-add-d46 ISA add-digits a 4 b 6 sumDigit 0 carry 1 sum 10)
(c-add-d47 ISA add-digits a 4 b 7 sumDigit 1 carry 1 sum 11)
(c-add-d48 ISA add-digits a 4 b 8 sumDigit 2 carry 1 sum 12)
(c-add-d49 ISA add-digits a 4 b 9 sumDigit 3 carry 1 sum 13)
(c-add-d50 ISA add-digits a 5 b 0 sumDigit 5 carry 0 sum 5)
(c-add-d51 ISA add-digits a 5 b 1 sumDigit 6 carry 0 sum 6)
(c-add-d52 ISA add-digits a 5 b 2 sumDigit 7 carry 0 sum 7)
(c-add-d53 ISA add-digits a 5 b 3 sumDigit 8 carry 0 sum 8)
(c-add-d54 ISA add-digits a 5 b 4 sumDigit 9 carry 0 sum 9)
(c-add-d55 ISA add-digits a 5 b 5 sumDigit 0 carry 1 sum 10)
(c-add-d56 ISA add-digits a 5 b 6 sumDigit 1 carry 1 sum 11)
(c-add-d57 ISA add-digits a 5 b 7 sumDigit 2 carry 1 sum 12)
(c-add-d58 ISA add-digits a 5 b 8 sumDigit 3 carry 1 sum 13)
(c-add-d59 ISA add-digits a 5 b 9 sumDigit 4 carry 1 sum 14)
(c-add-d60 ISA add-digits a 6 b 0 sumDigit 6 carry 0 sum 6)
(c-add-d61 ISA add-digits a 6 b 1 sumDigit 7 carry 0 sum 7)
(c-add-d62 ISA add-digits a 6 b 2 sumDigit 8 carry 0 sum 8)
(c-add-d63 ISA add-digits a 6 b 3 sumDigit 9 carry 0 sum 9)
(c-add-d64 ISA add-digits a 6 b 4 sumDigit 0 carry 1 sum 10)
(c-add-d65 ISA add-digits a 6 b 5 sumDigit 1 carry 1 sum 11)
(c-add-d66 ISA add-digits a 6 b 6 sumDigit 2 carry 1 sum 12)
(c-add-d67 ISA add-digits a 6 b 7 sumDigit 3 carry 1 sum 13)
(c-add-d68 ISA add-digits a 6 b 8 sumDigit 4 carry 1 sum 14)
(c-add-d69 ISA add-digits a 6 b 9 sumDigit 5 carry 1 sum 15)
(c-add-d70 ISA add-digits a 7 b 0 sumDigit 7 carry 0 sum 7)
(c-add-d71 ISA add-digits a 7 b 1 sumDigit 8 carry 0 sum 8)
(c-add-d72 ISA add-digits a 7 b 2 sumDigit 9 carry 0 sum 9)
(c-add-d73 ISA add-digits a 7 b 3 sumDigit 0 carry 1 sum 10)
(c-add-d74 ISA add-digits a 7 b 4 sumDigit 1 carry 1 sum 11)
(c-add-d75 ISA add-digits a 7 b 5 sumDigit 2 carry 1 sum 12)
(c-add-d76 ISA add-digits a 7 b 6 sumDigit 3 carry 1 sum 13)
(c-add-d77 ISA add-digits a 7 b 7 sumDigit 4 carry 1 sum 14)
(c-add-d78 ISA add-digits a 7 b 8 sumDigit 5 carry 1 sum 15)
(c-add-d79 ISA add-digits a 7 b 9 sumDigit 6 carry 1 sum 16)
(c-add-d80 ISA add-digits a 8 b 0 sumDigit 8 carry 0 sum 8)
(c-add-d81 ISA add-digits a 8 b 1 sumDigit 9 carry 0 sum 9)
(c-add-d82 ISA add-digits a 8 b 2 sumDigit 0 carry 1 sum 10)
(c-add-d83 ISA add-digits a 8 b 3 sumDigit 1 carry 1 sum 11)
(c-add-d84 ISA add-digits a 8 b 4 sumDigit 2 carry 1 sum 12)
(c-add-d85 ISA add-digits a 8 b 5 sumDigit 3 carry 1 sum 13)
(c-add-d86 ISA add-digits a 8 b 6 sumDigit 4 carry 1 sum 14)
(c-add-d87 ISA add-digits a 8 b 7 sumDigit 5 carry 1 sum 15)
(c-add-d88 ISA add-digits a 8 b 8 sumDigit 6 carry 1 sum 16)
(c-add-d89 ISA add-digits a 8 b 9 sumDigit 7 carry 1 sum 17)
(c-add-d90 ISA add-digits a 9 b 0 sumDigit 9 carry 0 sum 9)
(c-add-d91 ISA add-digits a 9 b 1 sumDigit 0 carry 1 sum 10)
(c-add-d92 ISA add-digits a 9 b 2 sumDigit 1 carry 1 sum 11)
(c-add-d93 ISA add-digits a 9 b 3 sumDigit 2 carry 1 sum 12)
(c-add-d94 ISA add-digits a 9 b 4 sumDigit 3 carry 1 sum 13)
(c-add-d95 ISA add-digits a 9 b 5 sumDigit 4 carry 1 sum 14)
(c-add-d96 ISA add-digits a 9 b 6 sumDigit 5 carry 1 sum 15)
(c-add-d97 ISA add-digits a 9 b 7 sumDigit 6 carry 1 sum 16)
(c-add-d98 ISA add-digits a 9 b 8 sumDigit 7 carry 1 sum 17)
(c-add-d99 ISA add-digits a 9 b 9 sumDigit 8 carry 1 sum 18)
(c-add-c00 ISA add-digits a 0 b 0 sumDigit 0 carry 0 sum 0)
(c-add-c01 ISA add-digits a 0 b 1 sumDigit 1 carry 0 sum 1)
(c-add-c02 ISA add-digits a 0 b 2 sumDigit 2 carry 0 sum 2)
(c-add-c03 ISA add-digits a 0 b 3 sumDigit 3 carry 0 sum 3)
(c-add-c04 ISA add-digits a 0 b 4 sumDigit 4 carry 0 sum 4)
(c-add-c05 ISA add-digits a 0 b 5 sumDigit 5 carry 0 sum 5)
(c-add-c06 ISA add-digits a 0 b 6 sumDigit 6 carry 0 sum 6)
(c-add-c07 ISA add-digits a 0 b 7 sumDigit 7 carry 0 sum 7)
(c-add-c08 ISA add-digits a 0 b 8 sumDigit 8 carry 0 sum 8)
(c-add-c09 ISA add-digits a 0 b 9 sumDigit 9 carry 0 sum 9)
(c-add-c010 ISA add-digits a 0 b 10 sumDigit 0 carry 1 sum 10)
(c-add-c011 ISA add-digits a 0 b 11 sumDigit 1 carry 1 sum 11)
(c-add-c012 ISA add-digits a 0 b 12 sumDigit 2 carry 1 sum 12)
(c-add-c013 ISA add-digits a 0 b 13 sumDigit 3 carry 1 sum 13)
(c-add-c014 ISA add-digits a 0 b 14 sumDigit 4 carry 1 sum 14)
(c-add-c015 ISA add-digits a 0 b 15 sumDigit 5 carry 1 sum 15)
(c-add-c016 ISA add-digits a 0 b 16 sumDigit 6 carry 1 sum 16)
(c-add-c017 ISA add-digits a 0 b 17 sumDigit 7 carry 1 sum 17)
(c-add-c018 ISA add-digits a 0 b 18 sumDigit 8 carry 1 sum 18)
(c-add-c019 ISA add-digits a 0 b 19 sumDigit 9 carry 1 sum 19)
(c-add-c10 ISA add-digits a 1 b 0 sumDigit 1 carry 0 sum 1)
(c-add-c11 ISA add-digits a 1 b 1 sumDigit 2 carry 0 sum 2)
(c-add-c12 ISA add-digits a 1 b 2 sumDigit 3 carry 0 sum 3)
(c-add-c13 ISA add-digits a 1 b 3 sumDigit 4 carry 0 sum 4)
(c-add-c14 ISA add-digits a 1 b 4 sumDigit 5 carry 0 sum 5)
(c-add-c15 ISA add-digits a 1 b 5 sumDigit 6 carry 0 sum 6)
(c-add-c16 ISA add-digits a 1 b 6 sumDigit 7 carry 0 sum 7)
(c-add-c17 ISA add-digits a 1 b 7 sumDigit 8 carry 0 sum 8)
(c-add-c18 ISA add-digits a 1 b 8 sumDigit 9 carry 0 sum 9)
(c-add-c19 ISA add-digits a 1 b 9 sumDigit 0 carry 1 sum 10)
(c-add-c110 ISA add-digits a 1 b 10 sumDigit 1 carry 1 sum 11)
(c-add-c111 ISA add-digits a 1 b 11 sumDigit 2 carry 1 sum 12)
(c-add-c112 ISA add-digits a 1 b 12 sumDigit 3 carry 1 sum 13)
(c-add-c113 ISA add-digits a 1 b 13 sumDigit 4 carry 1 sum 14)
(c-add-c114 ISA add-digits a 1 b 14 sumDigit 5 carry 1 sum 15)
(c-add-c115 ISA add-digits a 1 b 15 sumDigit 6 carry 1 sum 16)
(c-add-c116 ISA add-digits a 1 b 16 sumDigit 7 carry 1 sum 17)
(c-add-c117 ISA add-digits a 1 b 17 sumDigit 8 carry 1 sum 18)
(c-add-c118 ISA add-digits a 1 b 18 sumDigit 9 carry 1 sum 19)
(c-add-c119 ISA add-digits a 1 b 19 sumDigit 0 carry 2 sum 20)


;; define the number digits: a1a0 + b1b0 = sum1sum0 (sum1 includes last carry)
(g0 ISA add-numbers a1 9 a0 9 b1 9 b0 9 sum1 nil sum0 nil carry nil state nil)
)

;; Add productions here

;; initial production for adding two 2-digit numbers
(p init-adding
=goal>
    isa add-numbers
    sum0 nil
    carry nil
    a0 =a0
    b0 =b0 
==>
=goal> ;; set to process first digit
    sum0 "waiting"
+retrieval> ;; retrieve the first digit sum
    isa add-digits
    a =a0
    b =b0
)


(p process-s0-no-carry ;; zero carry
=goal>
    ISA add-numbers
    sum0 "waiting"
    sum1 nil 
    a0 =a0 
    b0 =b0 
    a1 =a1 ;; to prepare next step
    b1 =b1
=retrieval> ;; digit sum retrieval contains carry information
    isa add-digits
    a =a0
    b =b0
    sumDigit =s 
    carry 0 ;; important matching criteria
==>
=goal>
    ISA add-numbers
    sum0 =s
    sum1 "waiting" ;; process next digit
    carry nil ;; no carry for next digit
+retrieval>
    isa add-digits
    a =a1 ;; request sum for next digit processing
    b =b1
)

(p process-s0-carry
=goal>
    ISA add-numbers
    sum0 "waiting"
    sum1 nil
    a0 =a0
    b0 =b0
    a1 =a1 ;; to prepare next step
    b1 =b1
=retrieval>
    isa add-digits
    a =a0
    b =b0
    sumDigit =s
    carry 1 ;; important matching criteria
==>
=goal>
    ISA add-numbers
    sum0 =s
    sum1 "waiting"
    carry 1
+retrieval> ;;retrieve sum of next digit
    isa add-digits
    a =a1
    b =b1
)


;; processes the first digit of the sum, no carry-in to respect
(p process-s1-no-carry-in
=goal>
    ISA add-numbers
    sum1 "waiting"
    carry nil
=retrieval>
    isa add-digits
    sum =s ;; take sum of a1+b1
==>
=goal>
    ISA add-numbers
    sum1 =s ;;set the sum directly (including carry) because no more steps needed
    state "done" ;; next step is is done 
)


;; processes the second digit of the sum with carry-in from prev. sum-digit
;; the carry-in is added to the sum of the second digit
(p process-s1-carry-in
=goal>
    ISA add-numbers
    sum1 "waiting"
    carry 1
=retrieval>
    isa add-digits
    sum =s ;; sum of a1+b1 (carry included)
==>
=goal>
    ISA add-numbers
    carry nil
    ;; next step process s1 again but without carry
+retrieval>
    isa add-digits
    a 1 ;; 1 must be "a" because of how dm add chunkes are defined
    b =s 
)

;; done has also matching pattern for no carry formating in output
(p done-s1
=goal>
    state "done"
    sum1 =s1
    sum0 =s0
==>
-goal> ;;clear goal
    !output! (=s1 =s0) ;; s1 includes carry if happened, output result and stop
)

;; Specify a chunk to place in the goal buffer when the model starts to run.
(goal-focus g0)

)