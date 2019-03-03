# AI Programming in Lisp
This repository is for the code snippets written for the book "Paradigms of Artificial Intelligence Programming Case Studies in Common Lisp".

## Run CommonLisp on OS X
### Install SBCL
```
brew install sbcl
```
### Run Lisp REPL
```
rlwrap sbcl
```
`rlwarp` is used so that the arrow keys can be interpreted correctly.
### Run a lisp file with SBCL
There are 2 ways to run a lisp file:
1. Add shabang `#!/usr/bin/env sbcl --scrpit` and `chmod +x <*.lisp>`
2. `sbcl --script <*.lisp>`
### Load a lisp file and start REPL
1. `rlwrap sbcl --load <*.lisp>`




