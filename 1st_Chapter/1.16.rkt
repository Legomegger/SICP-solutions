#lang sicp
(define (fast-expt b n)
  (define (square x) (* x x))
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(fast-expt 3 5)

(define (expt b n a)
  (define (square x) (* x x))
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= n 0) a)
        ((even? n) (expt (square b) (/ n 2) a))
        (else (expt b (- n 1) (* b a)))))

(expt 3 5 1)

3 5 1
3 4 3
6 2 3
36 1 3
36 0 