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

(defun __get-script-path-list (mode)
  (cond 
    ((string= mode "example")
      (list (directory "example/def/*.lisp") (directory "example/test/*.lisp")))
    ((string= mode "exercise")
      (list (directory "exercise/def/*.lisp") (directory "exercise/test/*.lisp")))
    ((string= mode "all")
      (list (append (directory "example/def/*.lisp") (directory "exercise/def/*.lisp"))
            (append (directory "example/test/*.lisp") (directory "exercise/test/*.lisp"))))))

; load the function #'getenv
(load-expr #P"../misc/environment/getenv.lisp")
(write-line "")
(write-line "*************** AI Programming in Lisp Test Tool ***************")
(format t   "                  <<   MODE: ~@:(~a~)   >>" (getenv "AILISP_MODE"))
(write-line "")

(destructuring-bind
  (def-list test-list)
  (__get-script-path-list (getenv "AILISP_MODE"))

  (mapcar #'load def-list)
  (mapcar #'__eval-test-block test-list)
)
