(clear-all)

(define-model count

(sgp :esc t :lf .05 :trace-detail high)

; declare custom chunk types 
(chunk-type number number next)
(chunk-type count-from start end count)

; initially: add declarative memory chunks 🧠
(add-dm
; (name ISA type slot value slot value ...)
 (one ISA number number one next two)
 (two ISA number number two next three)
 (three ISA number number three next four)
 (four ISA number number four next five)
 (five ISA number number five)
 (first-goal ISA count-from start two end four)
 )

(goal-focus first-goal)

; command for creating a production 🏭
;(p Name "optional documentation string"
;buffer tests
;==>
;buffer changes and requests
;)

(p start
   =goal>
      ISA         count-from
      start       =num1
      count       nil
 ==>
   =goal>
      ISA         count-from
      count       =num1
   +retrieval>
      ISA         number
      number      =num1
   )

(p increment
   =goal>
      ISA         count-from
      count       =num1
    - end         =num1
   =retrieval>
      ISA         number
      number      =num1
      next        =num2
 ==>
   =goal>
      ISA         count-from
      count       =num2
   +retrieval>
      ISA         number
      number      =num2
   !output!       (=num1)
   )

(p stop
   =goal>
      ISA         count-from
      count       =num
      end         =num
   =retrieval>
      ISA         number
      number      =num
 ==>
   -goal>
   !output!       (=num)
   )
)
