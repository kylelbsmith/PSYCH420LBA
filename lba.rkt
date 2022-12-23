#lang racket
(require "testlba.rkt")

;; user defined variables - CHANGE ME if you'd like to test different variables
(define n 2) ; number of choices (n ≥ 0) 
(define bs '(10 10)) ; decision threshold - set one if common across all; else, list individual thresholds in same order as in means
(define A 5) ; max range of starting k (0 ≤ k ≤ A)
(define means '(10 15)) ; average means for each choice (length of means should be equal to n)
(define s 0.01) ; standard deviation of means, s ≥ 0

;;;;;; DO NOT CHANGE ;;;;;;;
; you can generate a new run of the model using one-run with the same parameters
; you can generate a scatterplot of x Run Times corresponding to x runs of the model using (text-x x n bs A means s) where x is the number of runs you'd like

;; Generate report on one run of our model:
(one-run n bs A means s)

;; Next, let's observe what happens when you run the model on the same set-up multiple times to look at some interesting numbers:
;;   Will the Reation Time (RT) converge to a common number?
(test-x 10 n bs A means s)
(test-x 100 n bs A means s)
(test-x 1000 n bs A means s)
(test-x 10000 n bs A means s)

;; Check the console for the output!