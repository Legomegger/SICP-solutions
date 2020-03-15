#lang sicp
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
(define (identity x) x)
(define (sum term a next b)
  (accumulate + 0 term a next b))
(sum identity 1 inc 5)

(define (fold combiner nv term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner (term a) result))))
  (iter a nv))

(define (sum-i term a next b)
  (fold + 0 term a next b))
(sum-i identity 1 inc 5)

                        