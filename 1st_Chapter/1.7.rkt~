#lang racket
(define (sqrt-start x)
  (sqrt-iter 1.0 0.5 x))
(define (sqrt-iter guess old-guess x)
  (if (good-enough? guess old-guess)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess old-guess)
  (< (abs (/ (- guess old-guess) old-guess)) 0.001))
(define (calc-square x) (* x x)) 
(sqrt-start 0.000006)