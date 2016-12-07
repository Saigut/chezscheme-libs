#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(import
  (rnrs)
  (srfi srfi-25 multi-dimensional-arrays)
  (srfi srfi-25 multi-dimensional-arrays arlib)
  (srfi srfi-78 lightweight-testing)
  (srfi private include))

(define-syntax past (syntax-rules () ((_ . r) (begin))))

(let-syntax ((or
              (syntax-rules (error)
                ((_ expr (error msg))
                 (check expr => #T))
                ((_ . r) (or . r)))))
  (include/resolve ("srfi" "srfi-25") "list.scm"))

(check-report)
