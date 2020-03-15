#lang sicp
(define (identity x) x)
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
;;product
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
(product identity 1 inc 10)
;;factorial
(define (factorial n)
  (product identity 1 inc n))
(factorial 10)
;; iter
(define (product-iter term a next b)
  (define (iter a result)
    (if (= a b)
        result
        (iter (next a) (* result (next a)))))
  (iter a 1))
(product-iter identity 1 inc 10)
