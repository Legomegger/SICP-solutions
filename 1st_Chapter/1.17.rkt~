;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.17|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (fast-mul a b)
  (cond ((= b 0) (double a))
        ((even? b) (fast-mul (double a) (halve b)))
        (else (fast-mul a (- b 1)))))
(define (double x) (* x 2))
(define (halve x) (/ x 2))
(fast-mul 2 4)