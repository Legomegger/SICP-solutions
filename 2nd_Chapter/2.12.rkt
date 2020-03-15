#lang sicp

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))




(define (div-interval x y)
  (if (or (<= (lower-bound x) 0)
          (<= (lower-bound y) 0))
      (error "Less than 0")
      (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (make-center-width c w) (make-interval (- c w) (+ c w)))
(define (center i)
(/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
(/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((low-bound (- c (* c (/ p 100))))
        (up-bound (+ c (* c (/ p 100)))))
    (make-interval low-bound up-bound)))

(define (center-p i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

(define (percent i)
  (let ((center (center-p i))
        (limit (lower-bound i)))
    (let ((p (- center limit)))
      (* (/ p center) 100))))

(define (par1 r1 r2)
(div-interval (mul-interval r1 r2)
(add-interval r1 r2)))
(define (par2 r1 r2)
(let ((one (make-interval 1 1)))
(div-interval one
(add-interval (div-interval one r1)
(div-interval one r2)))))
