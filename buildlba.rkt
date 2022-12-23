#lang racket
(require (planet williams/science/random-distributions/gaussian))

;; this file contains the functions necessary to build the LBA model:
;;   get-y-inter generates 0 ≤ k ≤ A, the y-intercept of each accumulator
;;   get-slope generates the drift rate according to a gaussian distribution
;;   build-accumulators is the wrapper function which generates a list of accumulators
;;   get-dt calculates the decision time for a given accumulator (1 choice)
;;   get-dts generates a list of decision times given a list of accumulators (n choices)
;;   get-rt calculates the Response Time of the model by taking the minimum DT
;;   report generates a report of the model complete with all its input information, accumulators, DTs, and final RT. 

(define (get-y-inter a)
  (random 0 a))

(define (get-slope mean sd)
  (random-gaussian mean sd))

(provide build-accumulators) ; allow build-accumulators to be used when file is imported

(define (build-accumulators a sd vs ths)
  (for/list ([mean vs]
             [b ths])
    (list (get-y-inter a) (get-slope mean sd) b)))

(define (get-dt driftrate threshold start)
  (exact->inexact (/ (- threshold start) driftrate)))

(provide get-dts)
(define (get-dts accs)
  (for/list ([acc accs])
    (get-dt (second acc) (third acc) (first acc))))

(provide get-rt)
(define (get-rt accs)
  (apply min (get-dts accs)))

(provide report)
(define (report accs n ths means sd)
  (let ([rt (get-rt accs)]
        [dts (get-dts accs)])
    (displayln (format "\n~a Choice Model Report\n\nFor each choice 1 ... n:\n\nThe observed means were: ~a\nThe observed standard deviation was: ~a\nThe decision times were: ~a\nThe drift rates were: ~a\nThe k were: ~a\nThe threshold were: ~a\n\nThe final Decision was Choice ~a with Reaction Time ~a.\n\n"
                     n
                     (string-join (map ~a means))
                     sd
                     (string-join (map ~a dts))
                     (string-join (map ~a (for/list ([acc accs]) (second acc))))
                     (string-join (map ~a (for/list ([acc accs]) (first acc))))
                     (string-join (map ~a ths))
                     (add1 (index-of dts rt))
                     rt
                     ))))
