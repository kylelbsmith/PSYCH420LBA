#lang racket
(require (planet williams/science/random-distributions/gaussian))

;; this file contains the functions necessary to build the LBA model:
;;   get-y-inter generates 0 ≤ k ≤ A, the y-intercept of each accumulator
;;   get-slope generates the drift rate according to a gaussian distribution
;;   build-accumulators is the wrapper function which puts everything together

(define (get-y-inter a)
  (random 0 a))

(define (get-slope mean sd)
  (random-gaussian mean sd))

(provide build-accumulators) ; allow build-accumulators to be used when file is imported

(define (build-accumulators a sd vs ths)
  (for/list ([mean vs]
             [b ths])
    (list (get-y-inter a) (get-slope mean sd) b)))


