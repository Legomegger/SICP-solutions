#lang racket
(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car num)
  (define (iter n acc)
    (if (not (= (modulo n 2) 0))
        acc
        (iter (/ n 2) (+ acc 1))))
  (iter num 0))

(define (cdr num)
  (define (iter n acc)
    (if (not (= (modulo n 3) 0))
        acc
        (iter (/ n 3) (+ acc 1))))
  (iter num 0))

(define pair (cons 2 3))
pair
(car pair)
(cdr pair)
