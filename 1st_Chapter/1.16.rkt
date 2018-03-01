;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.16|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (fast-expt b n)
  (fast-expt-iter b n 1))
(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((evenq? n) (fast-expt-iter (sq b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))))
(define (sq x) (* x x))
(define (evenq? x)
  (= (remainder x 2) 0))
(fast-expt 4 3)
