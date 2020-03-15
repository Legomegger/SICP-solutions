#lang sicp
(define (last-pair list)
  (if (= (length list) 1)
      (car list)
      (last-pair (cdr list))))
