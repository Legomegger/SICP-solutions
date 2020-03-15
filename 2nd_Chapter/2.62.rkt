#lang racket
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons (x1
                      (intersection-set (cdr set1)
                                        (cdr set2))))
               ((< x1 x2)
                (intersection-set (cdr set1) set2))
               ((< x2 x1)
                (intersection-set set1 (cdr set2))))))))

(define (adjoin-set x set)
  (cond ((and (not (element-of-set? x set)) (> x (car set))) (cons x set))
        ((= x (car set)) set)
        (else (adjoin-set x (cdr set)))))

(define (reverse list)
  (define (iter l acc)
    (if (null? l)
        acc
        (iter (cdr l) (cons (car l) acc))))
  (iter list '()))

(define (union-set set1 set2)
  (let ((reversed-head-of-set1 (car (reverse set1))))
    (cond ((null? set2) set1)
          ((> (car set2) reversed-head-of-set1)
           (cons (car set2) (union-set set1 (cdr set2))))
          (else (union-set set1 (cdr set2))))))
        
        
(union-set '(1 2 3) '(3 4 5))
          