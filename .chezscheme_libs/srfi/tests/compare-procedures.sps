#!r6rs
;; Copyright 2010 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(import
  (except (rnrs) error)
  (rnrs r5rs)
  (rename (only (rnrs) write) (write pretty-write))
  (srfi srfi-23 error)
  (srfi srfi-42 eager-comprehensions)
  (srfi private include)
  (srfi srfi-67 compare-procedures))

(include/resolve ("srfi" "srfi-67") "examples.scm")
