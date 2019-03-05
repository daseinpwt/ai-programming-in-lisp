(defun load-expr (path)
  (eval (read-from-string (get-file-content path))))
