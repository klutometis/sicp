(require-extension
 syntax-case
 (srfi 11 18))
(module
 util
 (square
  cube
  identity
  timed-result)
 (include "../util/square.scm")
 (include "../util/identity.scm")
 (include "../util/time.scm"))
