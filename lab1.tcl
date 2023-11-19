; Define a chunk-type for counting
(defchunk-type count
  (number))

; Initialize the model
(p !start
   =goal>
     state           count
     current-number  =n
  ==>
     !output! ("Counting " =n)
     =goal>
       state           count
       current-number  (+ =n 1))

; Define the goal to count from 1 to 10
(setf *start-goal* (make-instance 'dm-chunk :chunk-type 'count :slots '((number 1))))

; Define a rule to stop counting at 10
(p stop-counting
   =goal>
     state           count
     current-number  10
  ==>
     !output! ("Done counting to 10")
     =goal>
       state           stop)

; Run the model
(run 50)
