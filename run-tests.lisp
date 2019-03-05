(mapcar #'load (directory "def/*.lisp"))

(defun get-file-content (path)
  (with-open-file (stream path)
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents)))

(defun load-expr (path)
  (eval (read-from-string (get-file-content path))))

(defun __eval-test-expr (test-expr)
  (print test-expr)
  (print (eval test-expr))
  (write-line ""))

(defun __eval-test-block (path)
  (let ((block-name (pathname-name path))
        (test-list (load-expr path)))
       ; let body
       (write-line "================================================================")
       (write-line (concatenate 'string "test: " block-name))
       (write '----------------------------------------------------------------)
       (mapcar #'__eval-test-expr test-list)
       (write-line "================================================================")
       (write-line "")
       ))

(write-line "")
(write-line "***************************** TEST *****************************")
(write-line "")
(mapcar #'__eval-test-block (directory "test/*.lisp"))