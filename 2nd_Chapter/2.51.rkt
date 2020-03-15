#lang racket
(require sicp-pict)
(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((low
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              (make-vect 1.0 0.0)
                              split-point))
          (up
           (transform-painter painter2
                              split-point
                              (make-vect 1.0 0.5)
                              (make-vect 0.0 1.0))))
      (lambda (frame)
        (low frame)
        (up frame)))))

(paint (below einstein einstein))

(define (counter-270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))
(paint (counter-270 einstein))

(define (counter-90 painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define (counter-180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

(define (below1 painter1 painter2)
  (let ((turn1 (counter-270 painter1))
        (turn2 (counter-270 painter2)))
    (let ((bes (beside turn1 turn2)))
      (let ((stand (counter-90 bes)))
        (lambda (frame)
          (stand frame))))))
(paint (below1 einstein einstein))
  