#lang racket
(define (cube-root guess x)
  (if (good-enough? guess x)
      guess
      (cube-root (improve guess x)
                 x)))
(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))
(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))
(define (square x) (* x x))
(define (cube x) (* x x x))

(cube-root 1.0 9)