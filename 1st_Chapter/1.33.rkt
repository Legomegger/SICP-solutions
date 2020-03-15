#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


(define (inc x) (+ x 1))
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
(define (identity x) x)
(define (sum term a next b)
  (accumulate + 0 term a next b))
;;(sum identity 1 inc 5)

(define (fold combiner nv term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner (term a) result))))
  (iter a nv))

(define (sum-i term a next b)
  (fold + 0 term a next b))
;;(sum-i identity 1 inc 5)

(define (square x) (* x x))

(define (filtered-accumulate combiner predicate null-value term a next b)
  (cond ((> a b) null-value)
        ((predicate a)
         (combiner (term a)
                   (filtered-accumulate combiner predicate null-value term (next a) next b)))
        ((filtered-accumulate combiner predicate null-value term (next a) next b))))

(define (sum-prime-square term a next b)
  (filtered-accumulate + prime? 0 term a next b))

(sum-prime-square square 1 inc 10)