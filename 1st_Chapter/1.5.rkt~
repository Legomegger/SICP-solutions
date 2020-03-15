;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
;; Лисп использует аппликативный порядок, поэтому он вычисляет сначала все операнды и операторы
;; затем применяет процедуру, но так-как процедура p вызывает себя, программа зацикливается
;; при нормальном порядке вычислений язык бы проверил условие x = 0 ? и отдал бы ответ 0, не дойдя до p