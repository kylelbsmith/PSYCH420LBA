#lang racket
(require "buildlba.rkt")
(require "plotlba.rkt")

;; user defined variables

(define n 2) ; number of choices (n ≥ 0) 
(define bs '(15 10)) ; decision threshold - set one if common across all; else, list individual thresholds in same order as in means
(define A 5) ; max range of starting k (0 ≤ k ≤ A)
(define means '(10 15)) ; average means for each choice (length of means should be equal to n)
(define s 0.1) ; standard deviation of means, s ≥ 0

;; check user input

; check length of b is either 1 or == n. If == 1, create list of length n filled with that 1 value

; check if length of means == n

; check if A < b

; check if s >= 0

; n ≥ 2



;; Now that all variables have been checked, we are ready to run! We use the buildlba functions to build our accumulators:
(define accs (build-accumulators A s means bs))

;; visualize accumulators

; for each set of accumulator data, create plot using (plot-a driftrate threshold start):
(for ([acc accs])
  (display (plot-a (second acc) (third acc) (first acc))))

