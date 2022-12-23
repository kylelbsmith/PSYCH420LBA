#lang racket
(require plot)

;; this file contains the functions necessary to plot & report the LBA model:
;;   plot-a is the function that plots an individual accumulator given a driftrate (slope), threshold, and start (y-intercept)
;;   plot-as takes a list of accumulators and plots them all

(define (plot-a driftrate threshold start num m)
  (plot (list (function (λ (x) (+ (* driftrate x) start)) 0 (/ threshold 8) #:label "accumulator")
              (function (λ (x) threshold) #:label "threshold" #:color 2 #:style 'dot))
        #:title (format "Choice ~a" num) #:x-label "Decision Time" #:y-label "Evidence" #:y-min 0 #:y-max m))

(provide plot-as)
(define (plot-as accs n m)
  (for ([acc accs]
        [i (in-range 1 (add1 n))])
    (display (plot-a (second acc) (third acc) (first acc) i m))))