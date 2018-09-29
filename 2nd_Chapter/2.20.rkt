#lang racket
(define (even? x)
  (= (remainder x 2) 0))

(define (odd? x)
  (= (remainder x 2) 1))

(define (same-parity f . r)
  (define (filter v)
  (cond ((null? v) null)
        ((equal? (even? f) (even? (car v))) (cons (car v) (filter f (cdr v))))
        (else (filter (cdr r)))))
  (cons f (filter r)))

(same-parity (list 2 3 4 5 6 7))