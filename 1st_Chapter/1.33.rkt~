#lang racket
(define (filtered-accumulate f acc predicate term a next b)
  (cond ((> a b) acc)
        ((predicate a)
         (f (term a)
            (filtered-accumulate f acc predicate term (next a) next b)))
        (else (filtered-accumulate f acc predicate term (next a) next b))))
(define (square x) (* x x))
(define (inc x) x)
(define (sum a b)
  (filtered-accumulate + 0 prime? square a inc b))
;;
(define (sum-gcd n)
  (define (prime-n? x)
    (= (gcd n x) 1))
  (filtered-accumulate * 1 prime-n? id 1 inc n))


