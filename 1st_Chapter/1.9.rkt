;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.9|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))
(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(plus 3 2)
(inc (plus 2 2))
(inc (inc (plus 1 2)))
(inc (inc (inc (plus 0 2))))
(inc (inc (inc 2)))
(inc (inc 3))
(inc 4)
5

(define (plus a b)
  (if (= a 0)
      b
      (plus (dec a) (inc b))))


(plus 3 2)
(plus 2 3)
(plus 1 4)
(plus 0 5)
5