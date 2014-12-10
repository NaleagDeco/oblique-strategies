;;;; package.lisp

(defpackage #:oblique-strategies
  (:use #:cl)
  (:documentation "Oblique Strategies as a Service.")
  (:export *api-root-url*
           :draw-card
           :get-all-cards
           :get-card-by-number
           :get-card-by-id
           :debug-card
           :strategy
           :edition
           :id
           :card-number))
