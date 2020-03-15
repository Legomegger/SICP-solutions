#lang racket
(define (make-leaf symbol weight)
  (list `leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-i bits current-branch)
    (if (null? bits)
        `()
        (let ((branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? branch)
              (cons (symbol-leaf branch)
                    (decode-i (cdr bits) tree))
              (decode-i (cdr bits) branch)))))
  (decode-i bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      `()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))
(define sample-tree
  (make-code-tree (make-leaf `A 4)
                  (make-code-tree
                   (make-leaf `B 2)
                   (make-code-tree (make-leaf `D 1)
                                   (make-leaf `C 1)))))
(define sample-message `(0 1 1 0 0 1 0 1 1 1 1 1 0))

(define (encode message tree)
  (if (null? message)
      `()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (if (leaf? tree)
      null
      (cond ((element-of-set? symbol (symbols (left-branch tree)))
             (cons 0 (encode-symbol symbol (left-branch tree))))
            ((element-of-set? symbol (symbols (right-branch tree)))
             (cons 1 (encode-symbol symbol (right-branch tree))))
            (else (error "no such symbol" symbol)))))
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? (car set) x) true)
        (else (element-of-set? x (cdr set)))))


(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (if (null? (cdr set))
      (car set)
      (successive-merge (adjoin-set (make-code-tree (car set)
                                                    (cadr set))
                                    (cddr set)))))

(define test (list (list 'A 4) (list 'B 2) (list 'C 1) (list 'D 1)))


(generate-huffman-tree test)