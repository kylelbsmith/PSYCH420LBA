#lang racket
(require "buildlba.rkt")
(require "plotlba.rkt")
(require (planet williams/science/random-distributions/gaussian))

;; user defined variables

(display "In this project, 'n' is defined as the number of response choices (n ≥ 0).  For now, lets set 'n' = 2.
What should 'n' = ")
(define n (read)) ; number of choices (n ≥ 0) 

(display "In this project, 'bs' is defined as the decision threshold(s).  In syntax (threshold-1 threshold-2 threshold-n), lists should contain 1 threshold, or previously determined 'n' thresholds.
What should 'bs' = ")
(define bs (read)) ; decision threshold - set one if common across all; else, list individual thresholds in same order as in means

(display "In this project, 'means' is defined as a list (mean-1 mean-2 mean-n) of the average means for each response choice.  The length of the means should be equal to previously determined 'n'.
What should 'means' = ")
(define means (read)) ; average means for each choice (length of means should be equal to n)

(display "In this project, 'A' is defined as the maximum range of the starting 'k', or x-intercept (0 ≤ k ≤ A). 'A' should be less than the minimum decision threshold value defined in the list of 'bs'.
What should 'A' = ")
(define A (read)) ; max range of starting k (0 ≤ k ≤ A)

(display "In this project, 's' is defined as the standard deviation of 'means' (s ≥ 0).
What should 's' = ")
(define s (read)) ; standard deviation of means, s ≥ 0

;; check user input

(cond
  [(= n 2)n]
  [(print "Error: For this project, please set 'n' equal to 2.")])
  

; check length of bs is either 1 or == n. If == 1, create list of length n filled with that 1 value

(cond
  [(= (length bs) 1)
      (make-list n bs)]
  [(= (length bs) n) bs]
  [(print "Error: Please Enter Decision Threshold(s) Equal to 'n' or '1'")]) 
     
; check if length of means == n

(cond
  [(= (length means) n) means]
  [(print "Error: Please Enter Mean(s) Equal to 'n'.")])

; check if A < b

(cond
  [(< A (apply min bs)) A]
  [(print "Error: Please enter a maximum 'A' range value that is less than than the value of the decision threshold(s)")])

; check if s >= 0

(cond
  [(>= s 0) s]
  [(print "Error: Please enter a standard deviation value greater than or equal to 0")])
 
; n ≥ 2



(display "Now that all variables have been checked, we are ready to run! We use the build-lba functions to build our accumulators:")
(define accs (build-accumulators A s means bs))

;; visualize accumulators

; for each set of accumulator data, create plot using (plot-a driftrate threshold start):
(for ([acc accs])
  (display (plot-a (second acc) (third acc) (first acc))))

