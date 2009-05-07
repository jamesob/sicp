(define (cube x)
  (* x x x))

(define (foolish-integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (sum-simp k h f a n)
  (if (> k n)
      0
      (+ (* (simp-co k n) (f (+ a (* k h))))
         (sum-simp (+ 1 k) h f a n)))) 

(define (simp-co k n)
  (cond ((= 0 (remainder k n)) 1)
        ((even? k) 2)
        (else 4)))

(define (simpson-integral f a b n)
  (define (h a b n)
    (/ (- b a) n))
  (* (sum-simp 0 (h a b n) f a n)
     (/ (h a b n) 3)))

(define (mr-gauss x)
  (exp (* x x -1)))

(define (sum term a next b)
  (define (iter a result)
    (if (= a b)
        result
        (iter (next a)
              (+ (term a) result))))
  (iter a 0))