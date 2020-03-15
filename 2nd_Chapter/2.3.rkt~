#lang racket
(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (midpoint-segment segment)
  (make-point (/ (+ (x-point (start-segment segment))
                 (x-point (end-segment segment))) 2)
              (/ (+ (y-point (start-segment segment))
                 (y-point (end-segment segment))) 2)))

(define (print-point p)
(newline)
(display "(")
(display (x-point p))
(display ",")
(display (y-point p))
(display ")"))

(define one (make-point 3 3))
(define two (make-point 3 7))
(define three (make-point 8 7))
(define h (make-segment one two))
(define w (make-segment two three))

(define (make-rectangle width height)
  (cons width height))

(define (get-width rectangle)
  (start-segment rectangle))

(define (get-height rectangle)
  (end-segment rectangle))

(define (get-width-length rectangle)
  (abs
   (- (x-point (start-segment (get-width rectangle)))
      (x-point (end-segment (get-width rectangle))))))

(define (get-height-length rectangle)
  (abs
   (- (y-point (start-segment (get-height rectangle)))
      (y-point (end-segment (get-height rectangle))))))

(define (area rectangle)
  (* (get-width-length rectangle)
     (get-height-length rectangle)))

(define (perimeter rectangle)
  (* 2 (+ (get-width-length rectangle)
          (get-height-length rectangle))))

(define rectangle (make-rectangle w h))
rectangle
(get-width rectangle)
(get-height rectangle)
(get-width-length rectangle)
(get-height-length rectangle)
(area rectangle)
(perimeter rectangle)