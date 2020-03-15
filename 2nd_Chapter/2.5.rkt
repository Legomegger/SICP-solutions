#lang sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (if (not (= (remainder z 2) 0))
      0
      (+ 1 (car (/ z 2.0)))))

(define (cdr z)
  (if (not (= (remainder z 3) 0))
      0
      (+ 1 (car (/ z 3.0)))))