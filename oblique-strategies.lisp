;;;; oblique-strategies.lisp

(in-package #:oblique-strategies)

;;; "oblique-strategies" goes here. Hacks and glory await!

(defparameter *api-root-url*
  "http://brianeno.needsyourhelp.org"
  "Root URL of the Oblique Strategies API")

(defun draw-card (&optional edition)
  "Draw random card, from specific edition if specified"
  (let ((uri (concatenate 'string *api-root-url*
                          (if (not (null edition))
                              (concatenate 'string "/edition/" edition))
                          "/draw")))
    (yason:parse (drakma:http-request uri :want-stream T))))

(defun get-all-cards (edition)
  "List of all available cards for a given edition"
  (let ((uri (concatenate 'string *api-root-url* "/edition/" edition "/all")))
    (yason:parse (drakma:http-request uri :want-stream T))))

(defun get-card-by-number (edition card-number)
  "Get nth card from the specific edition"
  (let ((url (concatenate 'string *api-root-url*
                          "/edition/" edition "/cardnumber/" card-number)))
    (yason:parse (drakma:http-request url :want-stream T))))

(defun get-card-by-id (id)
  "Get card by API Server ID"
  (let ((url (concatenate 'string *api-root-url* "/id/" id)))
    (yason:parse (drakma:http-request url :want-stream T))))

(defun debug-card (card)
  "Print diagnostic info about card's JSON attributes"
  (flet ((print-hash-entry (key value)
           (format t "The value associated with the key ~S is ~S~%" key value)))
    (maphash #'print-hash-entry card)))

(defun strategy (card)
  (gethash 'strategy card))

(defun edition (card)
  (gethash 'edition card))

(defun id (card)
  (gethash 'id card))

(defun card-number (card)
  (gethash 'cardnumber card))
