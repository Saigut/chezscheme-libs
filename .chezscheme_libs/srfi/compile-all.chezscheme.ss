#! /usr/bin/env scheme-script
;;; Copyright (c) 2016 Federico Beffa <beffa@fbengineering.ch>
;;; 
;;; Permission to use, copy, modify, and distribute this software for
;;; any purpose with or without fee is hereby granted, provided that the
;;; above copyright notice and this permission notice appear in all
;;; copies.
;;; 
;;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
;;; WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
;;; WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
;;; AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
;;; DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA
;;; OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
;;; TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
;;; PERFORMANCE OF THIS SOFTWARE.

(import (chezscheme))

(define (libraries-to-compile root)
  (filter (lambda (file)
            (let ((str-length (string-length file)))
              (and (file-regular? file)
                   (not (file-symbolic-link? file))
                   (< 3 str-length)
                   (string=? (substring file 0 3) "srfi-")
                   (string=? (substring file (- str-length 4) str-length) ".sls"))))
          (directory-list root)))

(define (compile-and-link-file file)
  (let* ((file-no-ext (path-last (path-root file)))
         (target (string-append file-no-ext ".so"))
         (link (string-append ":"
                              (substring file 3 (string-length file-no-ext))
                              ".so")))
    (compile-library file)
    (system (format "ln -sf '~a' '~a'" target link))))

(parameterize ((library-directories '((".." . "..")))
               (source-directories '(".."))
               (compile-imported-libraries #t))
  (map compile-and-link-file (libraries-to-compile ".")))
