#lang racket
(define (double f)
  (lambda (x) (f (f x))))
(define (inc x) (+ x 1))
((double inc) 0)
(((double (double double)) inc) 5)