#lang racket
(define (iterative-improve good-enough? improve)
  (define (iter x)
    (let ((try (improve x)))
      (if (good-enough? x try)
          try
          (iter try))))
  iter)
(iterative-improve 123 123)