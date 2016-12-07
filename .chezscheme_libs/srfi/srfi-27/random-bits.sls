#!r6rs
;; Copyright 2010 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(library (srfi srfi-27 random-bits)
  (export
    random-integer
    random-real
    default-random-source
    make-random-source
    random-source?
    random-source-state-ref
    random-source-state-set!
    random-source-randomize!
    random-source-pseudo-randomize!
    random-source-make-integers
    random-source-make-reals)
  (import
    (rnrs)
    (rnrs r5rs)
    (only (srfi srfi-19 time) current-time time-nanosecond)
    (srfi srfi-23 error tricks)
    (srfi private include))

  (define-record-type (:random-source :random-source-make :random-source?)
    (fields state-ref
            state-set!
            randomize!
            pseudo-randomize!
            make-integers
            make-reals))

  (define (:random-source-current-time)
    (time-nanosecond (current-time)))

  (SRFI-23-error->R6RS "(library (srfi srfi-27 random-bits))"
   (include/resolve ("srfi" "srfi-27") "mrg32k3a-a.scm")
   (include/resolve ("srfi" "srfi-27") "mrg32k3a.scm"))
)
