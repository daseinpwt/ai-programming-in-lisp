(mapcar #'load (directory "def/*.lisp"))

(defun __get_file_lines (path)
  (with-open-file (stream path)
    (loop for line = (read-line stream nil)
          while line
          collect line)))

(defun __get_lambda_func (path)
  (let ((lines (__get_file_lines path)))
       (eval (read-from-string (apply #'concatenate (cons 'string lines))))))

(defun __eval_test_expr (expr)
  (print expr)
  (print (eval expr))
  (write-line ""))

(defun __eval_test_block (path)
  (let ((block-name (pathname-name path))
        (lambda-func (__get_lambda_func path)))
       ; let body
       (write-line "================================================================")
       (write-line (concatenate 'string "test: " block-name))
       (write '----------------------------------------------------------------)
       (mapcar #'__eval_test_expr (apply lambda-func ()))
       (write-line "================================================================")
       (write-line "")
       ))

(write-line "")
(write-line "***************************** TEST *****************************")
(write-line "")
(mapcar #'__eval_test_block (directory "test/*.lisp"))