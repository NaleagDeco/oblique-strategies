;;;; oblique-strategies.asd

(asdf:defsystem #:oblique-strategies
  :description "Common Lisp bindings for Oblique-Strategies-as-a-Service"
  :author "Gaelan D'costa <gdcosta@gmail.com>"
  :license "MIT"
  :serial t
  :components ((:file "package")
               (:file "oblique-strategies"))
  :depends-on (:drakma :yason))
