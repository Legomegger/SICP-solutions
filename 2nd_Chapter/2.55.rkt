#lang racket
(car ''asd)
(car (quote (quote asd))) ; кавычивание запрещает вычисления, мы берем car списка (quote asd) = quote