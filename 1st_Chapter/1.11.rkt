#lang sicp
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (f (- n 2))
         (f (- n 3)))))
;;(f 4)
;; f5 11

(define (fn n)
  (define (f-iter a b c counter)
    (if (= counter 0)
        a
        (f-iter b c (+ a b c) (- counter 1))))
  (f-iter 0 1 2 n))

(fn 7)
(f 7)

