; Helper or auxiliary   function to concatenate two lists
(= (merge-lists () $rest) 
   $rest) ; If the first list is empty, return the second list
(= (merge-lists ($head @$tail) $rest) 
   ($head @ (merge-lists $tail $rest))) ; Recursively merge the first element of the first list with the merged rest of both lists

; Filter elements ≤ pivot (filtering the "left" side of the pivot)
(= (filter-left $pivot ()) 
   ()) ; Base case: empty list returns an empty list
(= (filter-left $pivot ($elem @$lst))
   (if (<= $elem $pivot) ; If the element is less than or equal to pivot
       ($elem @ (filter-left $pivot $lst)) ; Keep the element and recursively filter the rest
       (filter-left $pivot $lst))) ; Skip this element if it’s greater than the pivot

; Filter elements > pivot (filtering the "right" side of the pivot)
(= (filter-right $pivot ()) 
   ()) ; Base case: empty list returns an empty list
(= (filter-right $pivot ($elem @$lst))
   (if (> $elem $pivot) ; If the element is greater than pivot
       ($elem @ (filter-right $pivot $lst)) ; Keep the element and recursively filter the rest
       (filter-right $pivot $lst))) ; Skip this element if it’s less than or equal to the pivot

; applying Quicksort implementation
(= (quicksort ()) 
   ()) ; Base case: an empty list is already sorted
(= (quicksort ($pivot @$lst)) 
   (merge-lists (quicksort (filter-left $pivot $lst)) ; Recursively sort the left side of the pivot
               ($pivot @ ()) ; Include the pivot in the middle
               (quicksort (filter-right $pivot $lst)))) ; Recursively sort the right side of the pivot

; Example usage
! (quicksort ()) ; Returns an empty list
! (quicksort (9 @ (1 @ (4 @ (4 @ ()))))) ; Sorts the list to (1 4 4 9)
