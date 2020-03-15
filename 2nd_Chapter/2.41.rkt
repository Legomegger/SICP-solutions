#lang racket
; Напишите процедуру, которая находит все такие упорядоченные тройки различных положительных
; целых чисел i, j и k, меньших или равных данному целому числу n, сумма которых равна данному
; числу s.
(define (accumulate op init seq)
(if (null? seq)
      init
    (op (car seq)
        (accumulate op init (cdr seq)))))

(define (enumerate-interval n1 n2)
(define (enumerate-interval-iter start stop current)
  (if (< stop start)
   '()
   (if (= start stop)
       (append current (list start))
       (enumerate-interval-iter (+ 1 start) stop (append current (list start))))))
(enumerate-interval-iter n1 n2 '()))

(define (flatmap proc seq)
(accumulate append '() (map proc seq)))

(define (unique-pairs n)
 (let ((x (flatmap (lambda (i)
            (map (lambda (j)
                   (map (lambda (k) (list i j k))
                        (enumerate-interval 1 (- j 1))))
                 (enumerate-interval 1 (- i 1))))
          (enumerate-interval 1 n))))
   (flatmap (lambda (q) q) x)))

(define (sum-seq seq)
 (accumulate + 0 seq))

(define (proc n s)
 (filter (lambda (x) (= s (sum-seq x)))
         (unique-pairs n)))

(display (unique-pairs 4))
(newline)
(display (proc 8 10))