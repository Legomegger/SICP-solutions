#lang racket
(require sicp-pict)
(define (make-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))
(define (ycor-vect vect)
  (cdr vect))

(define (add-vect vect1 vect2)
  (let ((x1 (xcor-vect vect1))
        (x2 (xcor-vect vect2))
        (y1 (ycor-vect vect1))
        (y2 (ycor-vect vect2)))
    (make-vect (+ x1 x2) (+ y1 y2))))

(define (sub-vect vect1 vect2)
  (let ((x1 (xcor-vect vect1))
        (x2 (xcor-vect vect2))
        (y1 (ycor-vect vect1))
        (y2 (ycor-vect vect2)))
    (make-vect (- x1 x2) (- y1 y2))))

(define (scale-vect scaler vect)
  (let ((x (xcor-vect vect))
        (y (ycor-vect vect)))
    (make-vect (* scaler x) (* scaler y))))


  
        