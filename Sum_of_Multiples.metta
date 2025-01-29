; Determine if a number is divisible by 3 or 5
(= (divisible-by-3-or-5? ?num)
   (or (= (mod ?num 3) 0)   ; Check for divisibility by 3
       (= (mod ?num 5) 0))) ; Check for divisibility by 5

; Recursively sum valid multiples below specified limit
(= (calculate-sum ?limit ?current ?total)
   (if (< ?current ?limit)
       (if (divisible-by-3-or-5? ?current)
           (calculate-sum ?limit (+ ?current 1) (+ ?total ?current)) ; Add current to total
           (calculate-sum ?limit (+ ?current 1) ?total))             ; Continue without adding
       ?total)) ; Return final total when current reaches limit

; Initialize summation and display result
(= (execute-calculation ?boundary)
   (begin 
     (define ?final-sum (calculate-sum ?boundary 0 0)) ; Start calculation from 0
     (print ?final-sum) ; Display result to user
     ?final-sum)) ; Return computed value

; Get numeric input from user
(= (get-user-input)
   (begin
     (print "Please enter a positive integer:") ; Display prompt
     (read))) ; Read numerical input

; Main program workflow
(= (start-program)
   (begin
     (define ?user-value (get-user-input)) ; Obtain user input
     (execute-calculation ?user-value))) ; Perform calculation

; Launch the program
! (start-program)