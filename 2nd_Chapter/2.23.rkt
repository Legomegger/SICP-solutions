#lang racket
(define (for-each proc list)
  (if (null? list)
      null
      (cons (proc (car list))
            (for-each proc (cdr list)))))
(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))