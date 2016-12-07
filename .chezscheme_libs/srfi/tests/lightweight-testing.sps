#!r6rs
;; Copyright 2010 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(import
  (rnrs)
  (rnrs r5rs)
  (srfi srfi-42 eager-comprehensions)
  (srfi private include)
  (srfi srfi-78 lightweight-testing))

(include/resolve ("srfi" "srfi-78") "examples.scm")
