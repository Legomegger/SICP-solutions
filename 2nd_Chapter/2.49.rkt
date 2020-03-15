#lang racket
(require sicp-pict)
(define origin (make-vect 0 0))
(define edge1 (make-vect 0.5 0.5))
(define edge2 (make-vect 0.5 0.5))
(define fr (make-frame origin edge1 edge2))
(define seg (make-segment edge1 edge2))
(define los (list seg seg seg))
(define x-segments
 (list
  (make-segment
   (make-vect 0.0 0.0)
   (make-vect 0.99 0.99))
  (make-segment
   (make-vect 0.0 0.99)
   (make-vect 0.99 0.0))))
(define x-painter (segments->painter x-segments))
(define outer
  (list
   (make-segment
    (make-vect 0 0)
    (make-vect 0 1))
   (make-segment
    (make-vect 0 1)
    (make-vect 1 1))
   (make-segment
    (make-vect 1 1)
    (make-vect 1 0))
   (make-segment
    (make-vect 1 0)
    (make-vect 0 0))))
(define outer-painter (segments->painter outer))
(define romb
  (list
   (make-segment
    (make-vect 0 0.5)
    (make-vect 0.5 1))
   (make-segment
    (make-vect 0.5 1)
    (make-vect 1 0.5))
   (make-segment
    (make-vect 1 0.5)
    (make-vect 0.5 0))
   (make-segment
    (make-vect 0.5 0)
    (make-vect 0 0.5))))
(define romb-painter (segments->painter romb))