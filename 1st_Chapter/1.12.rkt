#lang sicp

(define (pascal x y)
  (cond ((or (= x y) (= y 1)) 1)
        (else (+ (pascal (- x 1) (- y 1))
                 (pascal (- x 1) y)))))

(pascal 5 4)
(pascal 5 2)