#lang racket
(define (fast-mul a b)
  (cond ((= b 1) 0)
        ((even? b) (+ (double a) (fast-mul a (halve b))))
        (else (+ a (fast-mul a (- b 1))))))
  (define (double x) (* 2 x))
  (define (halve x) (/ x 2))

(fast-mul 5 4)