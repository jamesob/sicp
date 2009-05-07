(define (smallest-divisor n)
  (find-divisor n 2))

(define (square n)
  (* n n))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-milliseconds) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; checks the primality of consecutive odd integers in a given range
(define (search-for-primes start)
  (if (odd? start)
      (do-search start 100)
      (do-search (+ 1 start) 50)))

(define (do-search start count)
  (timed-prime-test start)
  (if (> count 0)
      (do-search (+ 2 start)
                 (- count 1))))
  
      