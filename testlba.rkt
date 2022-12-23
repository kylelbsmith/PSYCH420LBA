#lang racket

(require "buildlba.rkt")
(require "plotlba.rkt")
(require plot)

;; this file contains the wrapper functions that will test a model
;;    one-run generates a report on one run of the model
;;    x-runs collects the RT for x runs of the model
;;    test-x generates a report on the RTs of x runs of the model

(provide one-run)
(define (one-run n bs A means s) 
  (displayln (format "Generating ~a choice model...\n\n" n))
  (define accs (build-accumulators A s means bs))
  (define graph-y-max (max (* (apply max bs) 1.5) 10)) ; set the default of the plot y-axis to be the bigger of 10 or 1.5x the highest threshold 
  (plot-as accs n graph-y-max)
  (define dts (get-dts accs))
  (report accs n bs means s))

(define (x-runs x n bs A means s)
  (for/list ([i x])
    (let ([accs (build-accumulators A s means bs)])
      (get-rt accs))))

(provide test-x)
(define (test-x x n bs A means s)
  (displayln (format "\n\nGenerating RT for ~a runs of our ~a choice model...\n\n" x n))
  (let ([rts (x-runs x n bs A means s)]
        [run (range 1 (add1 x))])
    (plot (points (map vector run rts))
          #:title "RTs over run" #:y-label "Reaction Time (RT)" #:x-label "Run #")))
    
