; Define the binary map function
(= (apply-binary-map $operation $constant ()) 
   ()) ; Base case: empty list returns an empty list

(= (apply-binary-map $operation $constant ($head @$tail)) 
   (($operation $head $constant) @ (apply-binary-map $operation $constant $tail))) ; Recursive case: apply $operation to $head and $constant, then recurse

; Function to simulate user input dynamically (you can change the constant as per user input)
(= (get-user-input)
   10) ; Example: return 10 as a user-defined constant for demonstration

; Example usage
! (apply-binary-map + (get-user-input) (1 @ (2 @ (3 @ ())))) ; Example dynamic input, should output (11 @ (12 @ (13 @ ())))
