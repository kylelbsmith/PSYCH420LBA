#lang racket

(require (planet williams/science/random-distributions/gaussian))
(require plot)

;; user defined variables

(define n 2) ; number of choices (n ≥ 0) 
(define bs '(15 10)) ; decision threshold - set one if common across all; else, list individual thresholds in same order as in means
(define A 5) ; max range of starting k (0 ≤ k ≤ A)
(define means '(10 1)) ; average means for each choice (length of means should be equal to n)
(define s 0.1) ; standard deviation of means, s ≥ 0

;; check user input

; check length of b is either 1 or == n. If == 1, create list of length n filled with that 1 value

; check if length of means == n

; check if A < b

; check if s >= 0


;; build accumulator

(define (get-y-inter a)
  (random 0 a))

(define (get-slope mean sd)
  (random-gaussian mean sd))

(define (build-accumulators a sd vs ths)
  (for/list ([mean vs]
             [b ths])
    (list (get-y-inter a) (get-slope mean sd) b)))

(define accs (build-accumulators A s means bs))

;; visualize accumulators

(define (plot-a driftrate threshold start)
  (plot (list (function (λ (x) (+ (* driftrate x) start)) 0 (/ threshold 8) #:label "accumulator")
              (function (λ (x) threshold) #:label "threshold" #:color 0 #:style 'dot))
        #:x-label "Decision Time" #:y-label "Evidence"))


; for each set of accumulator data, create plot:
  