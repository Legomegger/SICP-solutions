#lang racket
(define (same-parity a . l)
  (if (even? a)
      (cons a (filter even? l))
      (cons a (filter odd? l))))


(same-parity 1 2 3 4 5)