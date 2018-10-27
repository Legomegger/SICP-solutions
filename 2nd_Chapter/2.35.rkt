#lang racket
(require "hof.rkt")

(define (denestify lst)
 (cond ((null? lst) '())
        ((pair? (car lst))
        (append (denestify (car lst))
                (denestify (cdr lst))))
       (else (cons (car lst) (denestify (cdr lst))))))

(define x (cons (list 1 2) (list 3 4)))
(define tree '(1 (2 (3 4 (5) (6 (7) (8)) (9))) 10))

(define (accumulate op init seq)
 (if (null? seq)
   init
   (op (car seq)
       (accumulate op init (cdr seq)))
   ))

(define (count-leaves t)
 (accumulate (lambda (x y) (+ 1 y)) 0 (denestify t)))

(define (count-leavesm t)
 (accumulate + 0 (map (lambda (x)
                        (if (pair? x)
                            (count-leaves x)
                            1))
                      t)))

(count-leaves tree)
(count-leaves x)
(count-leavesm x)
(map (lambda (x)
                        (if (pair? x)
                            (count-leaves x)
                            1))
                      tree)