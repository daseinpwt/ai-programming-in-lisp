(defun get-file-content (path)
  "Read the content of a file into one string."
  (with-open-file (stream path)
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents)))

(defun get-file-lines (path)
  "Read the lines of a file into a list of strings."
  (with-open-file (stream path)
    (loop for line = (read-line stream nil)
          while line
          collect line)))
