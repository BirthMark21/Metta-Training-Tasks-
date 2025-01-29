; Define a function to check if a number is even
(= (is-even? $num)
   (= (mod $num 2) 0))

; Define a recursive function to generate Fibonacci terms and sum even terms below a limit
(= (sum-even-fibonacci $max-limit $first $second $even-sum)
   (if (<= $second $max-limit)
       (if (is-even? $second)
           (sum-even-fibonacci $max-limit $second (+ $first $second) (+ $even-sum $second)) ; Add even term to sum
           (sum-even-fibonacci $max-limit $second (+ $first $second) $even-sum)) ; Skip odd term
       $even-sum)) ; Return the sum when the limit is exceeded

; auxiliary or Helper function to start the recursion with initial Fibonacci terms (1 and 2)
(= (sum-even-fibonacci-below $max-limit)
   (sum-even-fibonacci $max-limit 1 2 0))

; Function to read input from the user
(= (read-number)
   (begin
     (print "Enter the maximum limit:") ; Prompt the user
     (read))) ; Read the user's input

; Main entry point to execute the sum-even-fibonacci function
(= (run)
   (begin
     (define $limit (read-number)) ; Read the limit from user
     (sum-even-fibonacci-below $limit))) ; Call the sum-even-fibonacci function with input

; Call the main function to run the program
! (run)
