#lang racket
(require plot)

;; this file contains the functions necessary to plot the LBA model:
;;   plot-a is the wrapper function that plots an individual accumulator given a driftrate (slope), threshold, and start (y-intercept)

(provide plot-a)
(define (plot-a driftrate threshold start)
  (plot (list (function (λ (x) (+ (* driftrate x) start)) 0 (/ threshold 8) #:label "accumulator")
              (function (λ (x) threshold) #:label "threshold" #:color 0 #:style 'dot))
        #:x-label "Decision Time" #:y-label "Evidence"))