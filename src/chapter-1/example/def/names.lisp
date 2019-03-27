(defun last-name (name)
  "Select the last name from a name represented as a list."
  (first (last name)))

(defun first-name (name)
  "Select the first name from a name represented as a list."
  (first name))

(defparameter names '((John Q Public) (Malcolm X)
              (Admiral Grace Murray Hopper) (Spot)
              (Aristotle) (A A Milne) (Z Z Top)
              (Sir Larry Olivier) (Miss Scarlet)))

(defparameter *titles*
  '(Mr Mrs Miss Ms Sir Madam Dr Admiral Major General)
  "A list of titles that can appear at the start of a name.")

(defun first-name_v2 (name)
  "Select the first name from a name represented as a list.
   The titles will be filtered"
  (if (member (first name) *titles*)
      (first-name_v2 (rest name))
      (first name)))
