#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(import
  (rnrs)
  (srfi srfi-25 multi-dimensional-arrays)
  (srfi srfi-78 lightweight-testing)
  (srfi private include))

;; These syntaxes cause the following error:
;; Exception: definition not permitted (define past (let ((...))
;; (lambda stone (...))))
;; Commenting them out solves the problem! (FBE)

;; (let-syntax ((or
;;               (syntax-rules (error)
;;                 ((_ expr (error msg))
;;                  (check (and expr #T) => #T))
;;                 ((_ . r) (or . r))))
;;              (past
;;               (syntax-rules ()
;;                 ((_ . r) (values)))))
;;   (include/resolve ("srfi" "srfi-25") "test.scm"))

(include/resolve ("srfi" "srfi-25") "test.scm")

(check-report)
