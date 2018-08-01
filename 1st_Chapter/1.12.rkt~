;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.12|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (pascal-triangle a b)
  (if (or (= 1 a) (= 1 b) (= a b))
      1
      (+ (pascal-triangle (- a 1) (- b 1))
         (pascal-triangle a (- b 1)))))
