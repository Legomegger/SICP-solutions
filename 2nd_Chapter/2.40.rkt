#lang racket
; Определите процедуру unique-pairs, которая, получая целое число n, порождает последова-
; тельность пар (i, j), таких, что 1 ≤ j < i ≤ n. С помощью unique-pairs упростите данное выше
; определение prime-sum-pairs.

(define (accumulate op init seq)
 (if (null? seq)
      init
     (op (car seq)
         (accumulate op init (cdr seq)))))

(define (prime? n)
 (define (F n i) "helper"
   (cond ((< n (* i i)) #t)
         ((zero? (remainder n i)) #f)
         (else
          (F n (+ i 1)))))
"primality test"
(cond ((< n 2) #f)
    (else
     (F n 2))))

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
 (flatmap
  (lambda (i)
    (map (lambda (j) (list i j))
         (enumerate-interval 1 (- i 1))))
  (enumerate-interval 1 n)))

(define (make-pair-sum pair)
 (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
 (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
 (map make-pair-sum
      (filter prime-sum?
              (unique-pairs n))))

(display (prime-sum-pairs 6))