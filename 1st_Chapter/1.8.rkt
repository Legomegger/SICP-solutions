;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.8|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x)
                   x)))

(define (improve guess x)
  (/ (+ (/ x (squared guess)) (* 2 guess)) 3))

(define (cube x) (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.0001))

(define (cubrt x)
  (cubert-iter 1.0 x))

(define (squared x) (* x x))

(cubrt 9)