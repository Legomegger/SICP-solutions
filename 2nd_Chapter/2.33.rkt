#lang racket

(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

(define (square x) (* x x))

(define (mape p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) null sequence))

(mape square (list 1 2 3 4))

(define (appende seq1 seq2)
  (accumulate cons seq2 seq1))

(appende (list 1 2 3) (list 4 5 6))

(define (lengthe sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(lengthe (list 1 2 3 4 5))