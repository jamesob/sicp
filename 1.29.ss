
;; In this problem, we compare two methods of numerical integration, 
;; an anonymous method vs. Simpson's method.

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

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

#|
Using the constructed simpson-integral function, we compare the two techniques.

> (foolish-integral cube 0 1 .001)
0.249999875000001
> (simpson-integral cube 0 1 8)
1/4
> (simpson-integral cube 0 1 2)
1/4

SICP specified to try 100 and then 1000 iterations of Simpson's 
method vs. the anonymous method but, as we see here, that's really not 
necessary; Simpson's method is capable of solving the integral in only two 
iterations. Maybe Abelson and Sussman should've picked a less trivial integral 
to illustrate the difference between the two.

We define a new, more novel function:
|#

(define (mr-gauss x)
  (exp (* x x -1)))

#|
With the following output:

> (simpson-integral mr-gauss -1000 1000 1000)
1.4310170408337162
> (foolish-integral mr-gauss -1000 1000 .001)
[program ran out of memory @ 128mb limit]

It's evident that Simpson's method is not only more accurate but more efficient.
