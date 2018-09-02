#lang racket
(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated func n)
  (if (> n 1)
      (lambda (x) ((compose (repeated func (- n 1)) func) x))
      func))
(define (square x) (* x x))
((repeated square 2) 5)