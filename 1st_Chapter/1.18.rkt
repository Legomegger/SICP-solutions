#lang sicp
(define (expt b n a)
  (define (square x) (* x x))
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= n 0) a)
        ((even? n) (expt (square b) (/ n 2) a))
        (else (expt b (- n 1) (* b a)))))

(define (fast-mul a b)
  (define (double x) (* x 2))
  (define (halve x) (/ x 2))
  (cond ((= b 1) a)
        ((even? b) (fast-mul (double a) (halve b)))
        (else (+ a (fast-mul a (- b 1))))))

(define (proc a b c)
  (define (double x) (* x 2))
  (cond ((= a 0) c)
        ((not (even? a)) (proc (quotient a 2) (double b) (+ c b)))
        ((even? a) (proc (quotient a 2) (double b) c))))

(proc 4 5 0)
        