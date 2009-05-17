;; Here we are asked to redefine the previously-used sum 
;; function such that it's iterative as opposed to a 
;; linear recursion. Easily done.

(define (sum term a next b)
  (define (iter a result)
    (if (= a b)
        result
        (iter (next a)
              (+ (term a) result))))
  (iter a 0))
