; addpairs.scm
; Jon Rippe
; CSCE 331 - Spring 2021
; HW 7

; l is a list of numbers
; Return a list of sums of each sequential group of 2 numbers.
;(e.g., l is (1 2 3 4), return is (3 7))
(define (addpairs . l)
    (cond
        [(null? l)               l]
        [(null? (cdr l))         l]
        [else   (cons (+ (car l) (cadr l)) (apply addpairs (cddr l)))]
    )
)