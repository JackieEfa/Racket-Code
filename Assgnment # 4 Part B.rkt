;CPSC 3740 - Programming Languages
;Jacqueline Eshriew
;Assignment #4 Part B
;FALL 2022

#lang r5rs

;Q1
(define (deletedup n)
  (cond ((null? n) '())
        ((member (car n) (cdr n))
         (deletedup (cdr n)))
        (else
         (cons (car n) (deletedup (cdr n))
               )
         )
     )
  )

; deleteing duplications from list however it deletes and orders from the end.
(deletedup '(1 3 5 4 6 4 5 7))
(deletedup '(1 1 2 2 3 3 4 4 5 5))

;Q2
(define (dreverse n)
  (if (null? n) '()
      (if (list? n)
          (append (dreverse (cdr n)) (list  (dreverse (car n))))
          n
      )
   )  
)

(dreverse '(a b c d e))             

;Q3

;Q2 Assignement # 3
;tree #1 & tree #2 made
(define tree 
    (list 
        "a"  
        (list "b" "d" "e") ;list 1
        (list "c" "f" "g") ;list 2
    )
)

;tree should display as route then left then right in that order for both lists
(define (inorder tree)
    (if (pair? tree)
        (if (= (length tree) 3)
            (list (inorder (list-ref tree 1))
                (list-ref tree 0)
                (inorder (list-ref tree 2))
            )
           )
      tree
    )
)

;call to write out tree in the order needed
(inorder tree)

(define (preorder tree)
  (if (pair? tree)
      (cons(car tree)
       (if (null? (cdr tree))
          '()
          (append (preorder (car (cdr tree)))
            (preorder (car (cdr (cdr tree))))
          )
        )
      )
   '()
  ) 
)

;call to write out tree in pre order 
(preorder '(a (b (d) (e))(c (f) (g))))                                                                                             

;Q4
;confused on this question.
(define (tcons preorder inorder tree)
  (if (null? tcons) '()
      (append (list (tree))
              (preorder (tree))
              (preorder (tree))
          )
      )
  (if (null? tcons) '()
      (append (inorder (tree))
              (list (tree))
              (inorder (tree))
          )
      )
)



