#lang racket
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-fr origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (select-origin1 frame)
  (car frame))
(define (select-edge11 frame)
  (cadr frame))
(define (select-edge21 frame)
  (caddr frame))

(define (select-origin2 frame)
  (car frame))
(define (select-edge12 frame)
  (cadr frame))
(define (select-edge22 frame)
  (cddr frame))

(select-origin2 (make-fr 0 1 1))
(select-edge12 (make-fr 0 1 1))
(select-edge22 (make-fr 0 1 1))