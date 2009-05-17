#|
A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) 
if n> 3. Write a procedure that computes f by means of a recursive process. 
Write a procedure that computes f by means of an iterative process.

Recursive process:
|#

(define (love n)
  (if (< n 3)
      n
      (+ (love (- n 1))
         (+ (* 2 (love (- n 2)))
            (* 3 (love (- n 3)))))))

#|
Iterative process:
|#

(define (love-iter n)
  (lv n 2 1 0 3))
(define (lv n a b c i)
  (cond ((> 3 n) n)
        ((= n i) (+ a (+ (* 2 b) (* 3 c))))
        (else (lv n 
                  (+ a (+ (* 2 b) (* 3 c)))
                  a
                  b
                  (+ i 1)))))

