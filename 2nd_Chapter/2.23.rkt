#lang sicp
(define (for-each p list)
  (if (null? list)
      nil
      (cons (p (car list))
            (for-each p (cdr list)))))
(for-each display (list 1 2 3 4))