(defun get-file-content (path)
  "Read the content of a file into one string."
  (with-open-file (stream path)
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents)))

(defun load-expr (path)
  (eval (read-from-string (get-file-content path))))
