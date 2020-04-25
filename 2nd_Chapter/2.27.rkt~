#lang racket
(define (deep-reverse x)
  (cond ((null? x) x)
	((not (pair? x)) x)
	(else (append (deep-reverse (cdr x))
		      (list (deep-reverse (car x)))))))
(deep-reverse (list (list 1 2) (list 3 4)))