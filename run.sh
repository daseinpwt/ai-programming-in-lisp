#!/bin/bash
case $1 in
  example | exmp)
    AILISP_MODE=example rlwrap sbcl --load ../../run-tests.lisp
    ;;
  exercise | exer)
    AILISP_MODE=exercise rlwrap sbcl --load ../../run-tests.lisp
    ;;
  *)
    AILISP_MODE=all rlwrap sbcl --load ../../run-tests.lisp
    ;;
esac

