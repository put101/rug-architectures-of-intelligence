(clear-all)

(define-model tutor-model
    
(sgp :esc t :lf .05 :trace-detail medium)

;; how does mental column-addition work?
;; the goal is to add two numbers
;; for this we use smaller chunks that represent the basic
;; addition operations so that we can add the numbers up
;; columnwise from lowest to highest with respect to the carry

;; Add Chunk-types here
(chunk-type add-digits a b sum carry)
;; a + b = sum + carry

;; a1a0 + b1b0 = sum1sum0 + carry
(chunk-type add-numbers a1 a0 b1 b0 sum1 sum0 carry state) 
;; represents column-wise addition of two 2-digit numbers

;; Add Chunks here

(add-dm
(c00 ISA add-digits a 0 b 0 sum 0 carry 0)
(c01 ISA add-digits a 0 b 1 sum 1 carry 0)
(c02 ISA add-digits a 0 b 2 sum 2 carry 0)
(c03 ISA add-digits a 0 b 3 sum 3 carry 0)
(c04 ISA add-digits a 0 b 4 sum 4 carry 0)
(c05 ISA add-digits a 0 b 5 sum 5 carry 0)
(c06 ISA add-digits a 0 b 6 sum 6 carry 0)
(c07 ISA add-digits a 0 b 7 sum 7 carry 0)
(c08 ISA add-digits a 0 b 8 sum 8 carry 0)
(c09 ISA add-digits a 0 b 9 sum 9 carry 0)
(c10 ISA add-digits a 1 b 0 sum 1 carry 0)
(c11 ISA add-digits a 1 b 1 sum 2 carry 0)
(c12 ISA add-digits a 1 b 2 sum 3 carry 0)
(c13 ISA add-digits a 1 b 3 sum 4 carry 0)
(c14 ISA add-digits a 1 b 4 sum 5 carry 0)
(c15 ISA add-digits a 1 b 5 sum 6 carry 0)
(c16 ISA add-digits a 1 b 6 sum 7 carry 0)
(c17 ISA add-digits a 1 b 7 sum 8 carry 0)
(c18 ISA add-digits a 1 b 8 sum 9 carry 0)
(c19 ISA add-digits a 1 b 9 sum 0 carry 1)
(c20 ISA add-digits a 2 b 0 sum 2 carry 0)
(c21 ISA add-digits a 2 b 1 sum 3 carry 0)
(c22 ISA add-digits a 2 b 2 sum 4 carry 0)
(c23 ISA add-digits a 2 b 3 sum 5 carry 0)
(c24 ISA add-digits a 2 b 4 sum 6 carry 0)
(c25 ISA add-digits a 2 b 5 sum 7 carry 0)
(c26 ISA add-digits a 2 b 6 sum 8 carry 0)
(c27 ISA add-digits a 2 b 7 sum 9 carry 0)
(c28 ISA add-digits a 2 b 8 sum 0 carry 1)
(c29 ISA add-digits a 2 b 9 sum 1 carry 1)
(c30 ISA add-digits a 3 b 0 sum 3 carry 0)
(c31 ISA add-digits a 3 b 1 sum 4 carry 0)
(c32 ISA add-digits a 3 b 2 sum 5 carry 0)
(c33 ISA add-digits a 3 b 3 sum 6 carry 0)
(c34 ISA add-digits a 3 b 4 sum 7 carry 0)
(c35 ISA add-digits a 3 b 5 sum 8 carry 0)
(c36 ISA add-digits a 3 b 6 sum 9 carry 0)
(c37 ISA add-digits a 3 b 7 sum 0 carry 1)
(c38 ISA add-digits a 3 b 8 sum 1 carry 1)
(c39 ISA add-digits a 3 b 9 sum 2 carry 1)
(c40 ISA add-digits a 4 b 0 sum 4 carry 0)
(c41 ISA add-digits a 4 b 1 sum 5 carry 0)
(c42 ISA add-digits a 4 b 2 sum 6 carry 0)
(c43 ISA add-digits a 4 b 3 sum 7 carry 0)
(c44 ISA add-digits a 4 b 4 sum 8 carry 0)
(c45 ISA add-digits a 4 b 5 sum 9 carry 0)
(c46 ISA add-digits a 4 b 6 sum 0 carry 1)
(c47 ISA add-digits a 4 b 7 sum 1 carry 1)
(c48 ISA add-digits a 4 b 8 sum 2 carry 1)
(c49 ISA add-digits a 4 b 9 sum 3 carry 1)
(c50 ISA add-digits a 5 b 0 sum 5 carry 0)
(c51 ISA add-digits a 5 b 1 sum 6 carry 0)
(c52 ISA add-digits a 5 b 2 sum 7 carry 0)
(c53 ISA add-digits a 5 b 3 sum 8 carry 0)
(c54 ISA add-digits a 5 b 4 sum 9 carry 0)
(c55 ISA add-digits a 5 b 5 sum 0 carry 1)
(c56 ISA add-digits a 5 b 6 sum 1 carry 1)
(c57 ISA add-digits a 5 b 7 sum 2 carry 1)
(c58 ISA add-digits a 5 b 8 sum 3 carry 1)
(c59 ISA add-digits a 5 b 9 sum 4 carry 1)
(c60 ISA add-digits a 6 b 0 sum 6 carry 0)
(c61 ISA add-digits a 6 b 1 sum 7 carry 0)
(c62 ISA add-digits a 6 b 2 sum 8 carry 0)
(c63 ISA add-digits a 6 b 3 sum 9 carry 0)
(c64 ISA add-digits a 6 b 4 sum 0 carry 1)
(c65 ISA add-digits a 6 b 5 sum 1 carry 1)
(c66 ISA add-digits a 6 b 6 sum 2 carry 1)
(c67 ISA add-digits a 6 b 7 sum 3 carry 1)
(c68 ISA add-digits a 6 b 8 sum 4 carry 1)
(c69 ISA add-digits a 6 b 9 sum 5 carry 1)
(c70 ISA add-digits a 7 b 0 sum 7 carry 0)
(c71 ISA add-digits a 7 b 1 sum 8 carry 0)
(c72 ISA add-digits a 7 b 2 sum 9 carry 0)
(c73 ISA add-digits a 7 b 3 sum 0 carry 1)
(c74 ISA add-digits a 7 b 4 sum 1 carry 1)
(c75 ISA add-digits a 7 b 5 sum 2 carry 1)
(c76 ISA add-digits a 7 b 6 sum 3 carry 1)
(c77 ISA add-digits a 7 b 7 sum 4 carry 1)
(c78 ISA add-digits a 7 b 8 sum 5 carry 1)
(c79 ISA add-digits a 7 b 9 sum 6 carry 1)
(c80 ISA add-digits a 8 b 0 sum 8 carry 0)
(c81 ISA add-digits a 8 b 1 sum 9 carry 0)
(c82 ISA add-digits a 8 b 2 sum 0 carry 1)
(c83 ISA add-digits a 8 b 3 sum 1 carry 1)
(c84 ISA add-digits a 8 b 4 sum 2 carry 1)
(c85 ISA add-digits a 8 b 5 sum 3 carry 1)
(c86 ISA add-digits a 8 b 6 sum 4 carry 1)
(c87 ISA add-digits a 8 b 7 sum 5 carry 1)
(c88 ISA add-digits a 8 b 8 sum 6 carry 1)
(c89 ISA add-digits a 8 b 9 sum 7 carry 1)
(c90 ISA add-digits a 9 b 0 sum 9 carry 0)
(c91 ISA add-digits a 9 b 1 sum 0 carry 1)
(c92 ISA add-digits a 9 b 2 sum 1 carry 1)
(c93 ISA add-digits a 9 b 3 sum 2 carry 1)
(c94 ISA add-digits a 9 b 4 sum 3 carry 1)
(c95 ISA add-digits a 9 b 5 sum 4 carry 1)
(c96 ISA add-digits a 9 b 6 sum 5 carry 1)
(c97 ISA add-digits a 9 b 7 sum 6 carry 1)
(c98 ISA add-digits a 9 b 8 sum 7 carry 1)
(c99 ISA add-digits a 9 b 9 sum 8 carry 1)

(g0 ISA add-numbers a1 0 a0 1 b1 0 b0 1 sum1 nil sum0 nil carry nil state nil)
)

;; Add productions here
(p init-adding
=goal>
    isa add-numbers
    sum0 nil
    carry nil
    a0 =a0
    b0 =b0 
==>
=goal>
    sum0 "waiting"
+retrieval>
    isa add-digits
    a =a0
    b =b0
)

(p process-s0-no-carry
=goal>
    ISA add-numbers
    sum0 "waiting"
    sum1 nil
    a0 =a0
    b0 =b0
    a1 =a1 ;; prepare next step
    b1 =b1
=retrieval>
    isa add-digits
    a =a0
    b =b0
    sum =s
    carry 0
==>
=goal>
    ISA add-numbers
    sum0 =s
    sum1 "waiting"
+retrieval>
    isa add-digits
    a =a1
    b =b1
)

(p process-s0-carry
=goal>
    ISA add-numbers
    sum0 "waiting"
    sum1 nil
    a0 =a0
    b0 =b0
    a1 =a1 ;; prepare next step
    b1 =b1
=retrieval>
    isa add-digits
    a =a0
    b =b0
    sum =s
    carry 1
==>
=goal>
    ISA add-numbers
    sum0 =s
    sum1 "waiting"
+retrieval>
    isa add-digits
    a =a1
    b =b1
)

(p process-s1
=goal>
    ISA add-numbers
    sum1 "waiting"
    carry =c
    a1 =a1
    b1 =b1
=retrieval>
    isa add-digits
    a =a1
    b =b1
    sum =s
    carry =nc
==>
=goal>
    ISA add-numbers
    sum1 =s
    carry =nc
    state "done"
)

(p done
=goal>
    ISA add-numbers
    sum0 =s0
    sum1 =s1
    carry =c
    state "done"
==>
!output! ("Result: " =c =s1 =s0)
=goal>
    isa add-numbers
    state "stop"
)

(goal-focus g0)

)