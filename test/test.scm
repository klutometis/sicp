(require-extension
 syntax-case
 (srfi 18))
(require '../srfi/srfi-70)
(module
 test
 (terminate?
  approx?)
 (import* srfi-70
          exact-round)
 (include "../test/terminate.scm")
 (include "../test/approx.scm"))
