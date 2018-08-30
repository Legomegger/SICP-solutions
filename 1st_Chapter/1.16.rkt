#lang racket

(define (fast-expt b n)
(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* b a)))))
(define (square n)
  (* n n))
  (fast-expt-iter b n 1))
(fast-expt 9 7)
