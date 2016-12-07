#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

;; Modified for Chez Scheme interactive environment by Federico Beffa

(library (srfi srfi-26 cut)
  (export cut cute <> <...>)
  (import (rnrs) (srfi private include) (srfi private aux-keywords))

  (define-auxiliary-keywords <> <...>)
  
  (include/resolve ("srfi" "srfi-26") "cut.scm")  
)
