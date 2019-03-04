(mapcar #'load (directory "def/*.lisp"))

(defun __eval_test_expr (expr)
  (print expr)
  (print (eval expr))
  (write-line ""))

(defun __eval_test_block (path)
  (load path)
  (let ((filename (pathname-name path)))
       (setf test-block (read-from-string (concatenate 'string "test$" filename)))
       (print '================================================================)
       (print test-block)
       (print '----------------------------------------------------------------)
       (mapcar #'__eval_test_expr (apply test-block ()))
       (print '================================================================)
       (write-line "")
       ))

(defun $check (variable)
  variable)
       
(mapcar #'__eval_test_block (directory "test/*.lisp"))