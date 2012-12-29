; exercise 2.2
; midpoint-stravaganza
;

; given procedure for testing
;
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")")
  (newline))

(define (make-segment pt1 pt2)
  (cons pt1 pt2))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))

(define (x-point pt)
  (car pt))
         
(define (y-point pt)
  (cdr pt))
 
(define (midpoint-segment seg)
  (let ((x1 (x-point (start-segment seg)))
        (x2 (x-point (end-segment seg)))
        (y1 (y-point (start-segment seg)))
        (y2 (y-point (end-segment seg)))
        (avg (lambda (a b) (/ (+ a b) 2))))
    (make-point (avg x1 x2) (avg y1 y2))))


; testing
;

(define sw (make-point 1 1))
(define ne (make-point 2 2))
(define test-seg (make-segment sw ne))
(define mid (make-point 3/2 3/2))


(print-point mid)
(print-point (midpoint-segment test-seg))

; exercise 2.3
; rectangles
;
; included in this file because I need to make use of code
; from ex2.2, and the notion of modules in scheme is 
;
;   (i) implementation-dependent, and
;   (ii) uniformly  in every case I've seen.
;
; As far as I can tell, this is one of the biggest reasons that
; lisp hasn't reached the common programmer --- good packaging is not
; straightforward. 
;

; start by defining the selectors first (wishful thinking)
;
(define (rect-perimeter r)
  (+ (* 2 (rect-width r)) (* 2 (rect-height r))))

(define (rect-area r)
  (* (rect-width r) (rect-height r)))

(define (rect-width r)
  (- (x-point (rect-ne-point r))
     (x-point (rect-sw-point r))))

(define (rect-height r)
  (- (y-point (rect-ne-point r))
     (y-point (rect-sw-point r))))

(define (rect-sw-point r)
  (car r))

(define (rect-ne-point r)
  (cdr r))

(define (make-rect sw-point ne-point)
  (cons sw-point ne-point))

; testing
;
(define recty (make-rect (make-point 0 0)
                         (make-point 2 2)))

(define (show-recty r)
  (display (rect-perimeter r))  ; 8
  (newline)
  (display (rect-area r))  ; 4
  (newline))

(show-recty recty)

; alternate implementation
;
(define (rect-width r)
  (car (cdr r)))

(define (rect-height r)
  (cdr (cdr r)))

(define (make-rect origin width height)
  (cons origin (cons width height)))
 
; testing
;
(define recty (make-rect (make-point 0 0) 2 2))
(show-recty recty)
                                
