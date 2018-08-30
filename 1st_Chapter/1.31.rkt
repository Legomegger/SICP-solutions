#lang racket
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
(define (id x) x)
(define (inc x) (+ x 1))
(define (factorial n)
  (product id 1 inc n))
(factorial 5)
;;
(define (prod term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (* (term x) result)))
    (iter a 1)))
(prod id 1 inc 5)