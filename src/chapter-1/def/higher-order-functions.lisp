(defun mappend (fn the-list)
  "Apply fn t o each element of l i s t and append the results."
  (apply #'append (mapcar fn the-list)))

(defun self-and-double (x) (list x (+ x x)))

(defun numbers-and-negations (input)
  "Given a list, return only the numbers and their negations."
  (mappend #'number-and-negation input))

(defun number-and-negation (x)
  "If x is a number, return a list of x and -x."
  (if (numberp x)
      (list x (- x))
      nil))