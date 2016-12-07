#!r6rs
;; Copyright 2010 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(library (srfi srfi-67 compare-procedures)
  (export
    </<=? </<? <=/<=? <=/<? <=? <? =?
    >/>=? >/>? >=/>=? >=/>? >=? >?
    boolean-compare chain<=? chain<? chain=? chain>=? chain>?
    char-compare char-compare-ci
    compare-by< compare-by<= compare-by=/< compare-by=/> compare-by>
    compare-by>= complex-compare cond-compare
    debug-compare default-compare
    if-not=? if3 if<=? if<? if=? if>=? if>? integer-compare
    kth-largest list-compare list-compare-as-vector
    max-compare min-compare not=? number-compare
    pair-compare pair-compare-car pair-compare-cdr
    pairwise-not=? rational-compare real-compare
    refine-compare select-compare string-compare string-compare-ci
    symbol-compare vector-compare vector-compare-as-list)
  (import
    (rnrs)
    (only (rnrs r5rs) modulo)
    (only (srfi srfi-27 random-bits) random-integer)
    ;; (srfi srfi-23 error tricks)
    (srfi private include))

  ;; The syntax SRFI-23-error->R6RS appears to be broken.  It results
  ;; in an error message: "Exception: attempt to reference
  ;; out-of-context identifier error".  Removing it makes it work and
  ;; pass all provided tests! (FBE)
  
  ;; (SRFI-23-error->R6RS "(library (srfi srfi-67 compare-procedures))"
  ;;  (include/resolve ("srfi" "srfi-67") "compare.scm"))

  (include/resolve ("srfi" "srfi-67") "compare.scm")

)
