;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.11|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;;recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f(- n 1)) (f(- n 2)) (f(- n 3)))))

;; iterative
(define (fi n)
  (fit 2 1 0 n))
(define (fit a b c counter)
  (if (= counter 0)
      c
      (fit (+ a b c) a b (- counter 1))))
(fi 40)