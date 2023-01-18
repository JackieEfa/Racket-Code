;CPSC 3740 - Programming Languages
;Jacqueline Eshriew
;FALL 2022

#lang r5rs

;Questions 1-3 work it may require Q4 to be removed because its causing issues
;Thanks!

;Q1
(define (3+1 n) (+ (* 3 n) 1))
(define (half n) (/ n 2))
(define (collatz n)
    (if (< n 1)
        "Given value must be greater than 0, try again"
        (if (= n 1)
            "Collatz function halted"
             (if (= (modulo n 2) 0)
                (collatz (half n))
                (collatz (3+1 n))
            )
        )
    )  
)

;declarations to be recongized!

(collatz -2)
(collatz -1)
(collatz 0)
(collatz 1)
(collatz 2)



;Q2
;tree #1 & tree #2 made
(define tree 
    (list 
        "a"  
        (list "b" "d" "e") ;list 1
        (list "c" "f" "g") ;list 2
    )
)

;inorder fucntion needed help
;tree should display as route then left then right in that order for both lists
(define (inorder tree)
    (if (pair? tree)
        (if (= (length tree) 3)
            (list
                (inorder (list-ref tree 1))
                (list-ref tree 0)
                (inorder (list-ref tree 2))
            )
            )
        tree
    )
)

;call to write out tree in the order needed
(inorder tree)

; Q3
(define (trimming0 n)
  (if (zero? (car n))
      (trimming0 (cdr n))
      ;(display n)
      n
   )
)

(trimming0 '(0 0 1 3 5 0))  ; (1 3 5 0)

;For Q4 remove does not work in r5rs however it works in racket
;and im not sure how to change or add both languages without messing up
;the remainder of my code. If remove is an unbound identifier
;please switch the language to racket for 4, I've tried using r5rs
;but the remove identifier is not recognized when using it even with
;examples and everything else I have tried. Thanks!

;Q4
(define (trimming n)
 (if (member 0 n)
        ;(trimming (remove 0 n))
        ;(display n)
        n
    )
)

(trimming '(0 0 1 3 0 5 0))  ; (1 3 5)

 
  