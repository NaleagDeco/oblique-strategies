;;;; oblique-strategies.lisp

(in-package #:oblique-strategies)

;;; "oblique-strategies" goes here. Hacks and glory await!

(defparameter *api-root-url*
  "http://brianeno.needsyourhelp.org"
  "Root URL of the Oblique Strategies API")

(defun draw-card (&optional edition)
  "Draw random card, from specific edition if specified"
  (let* ((edition-str (write-to-string edition))
        (uri (concatenate 'string *api-root-url*
                          (if (not (null edition))
                              (concatenate 'string "/edition/" edition-str))
                          "/draw")))
    (yason:parse (drakma:http-request uri :want-stream T))))

(defun get-all-cards (edition)
  "List of all available cards for a given edition"
  (let* ((edition-str (write-to-string edition))
        (uri (concatenate 'string *api-root-url* "/edition/" edition-str "/all")))
    (yason:parse (drakma:http-request uri :want-stream T))))

(defun get-card-by-number (edition card-number)
  "Get nth card from the specific edition"
  (let* ((edition-str (write-to-string edition))
        (card-number-str (write-to-string card-number))
        (url (concatenate 'string *api-root-url*
                          "/edition/" edition-str "/cardnumber/" card-number-str)))
    (yason:parse (drakma:http-request url :want-stream T))))

(defun get-card-by-id (id)
  "Get card by API Server ID"
  (let* ((id-str (write-to-string id))
        (url (concatenate 'string *api-root-url* "/id/" id-str)))
    (yason:parse (drakma:http-request url :want-stream T))))

(defun debug-card (card)
  "Print diagnostic info about card's JSON attributes"
  (flet ((print-hash-entry (key value)
           (format t "The value associated with the key ~S is ~S~%" key value)))
    (maphash #'print-hash-entry card)))

(defun strategy (card)
  (gethash "strategy" card))

(defun edition (card)
  (gethash "edition" card))

(defun id (card)
  (gethash "id" card))

(defun card-number (card)
  (gethash "cardnumber" card))
