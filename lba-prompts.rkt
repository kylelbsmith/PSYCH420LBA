#lang racket
(require "testlba.rkt")

;; This file is the main file that will run our DEMO with user inputed values! To run this file, hit run and follow the prompts in the console!

;; intro
(displayln "Welcome to Group 5's Linear Ballistic Accumulator Demo! Through this demo, you'll build your own model for n choice and observe how it behaves when run for increasingly many trials.\n\n") 

;; pick n
(displayln "First, pick integer n, which is defined as the number of response choices (n ≥ 2).
Please enter n:")
(define n (string->number (read-line)))
; verify n
(if (and (integer? n) (> n 1)) (displayln (format "\nGreat! n is ~a\n\n" n)) (error "Invalid integer n. Please run the file and try again with n ≥ 2."))

;; populate list of thresholds
(displayln "In this demo, list bs represents the list of threshold b's: you must include one threshold per choice. If they are the same, please enter the same number n times. Please enter list bs (e.g. \"10 10 10\"): ")
(define bs (read (open-input-string (format "(~a)" (read-line)))))
; verify bs
(if (and (list? bs) (andmap integer? bs) (= (length bs) n)) (displayln (format "\nGreat! bs is ~a\n\n" bs)) (error "Invalid list bs. Please run the file and try again with n integer values (no brackets, no quotes, etc.)."))


;; populate list of means
(displayln "Next, we need a list of size n of the average means (mean-1 mean-2 mean-n) that corresponds with each response choice. Enter the number means in the same way as before:")
(define means (read (open-input-string (format "(~a)" (read-line)))))
; verify means
(if (and (list? means) (andmap number? means) (= (length means) n)) (displayln (format "\nGreat! means is ~a\n\n" means)) (error "Invalid list means. Please run the file and try again with n number values (no brackets, no quotes, etc.)."))


;; populate A
(displayln "Next, define A ≥ 0, the maximum starting amount of evidence. Please select A ≥ 0: ")
(define A (read))
;; verify A
(if (and (number? A) (>= A 0)) (displayln (format "\nGreat! A is ~a\n\n" A)) (error "Invalid A. Please enter valid number A ≥ 0"))

;; populate s
(displayln "Lastly, please enter your observed standard deviation s (s ≥ 0): ")
(define s (read))
(if (and (number? s) (>= s 0)) (displayln (format "\nGreat! s is ~a\n\n" s)) (error "Invalid s. Please enter valid number s ≥ 0"))

;; Generate report on one run of our model:
(one-run n bs A means s)

;; Next, let's observe what happens when you run the model on the same set-up multiple times to look at some interesting numbers:
;;   Will the Reation Time (RT) converge to a common number?
(test-x 10 n bs A means s)
(test-x 100 n bs A means s)
(test-x 1000 n bs A means s)
(test-x 10000 n bs A means s)

;; Check the console for the output!

