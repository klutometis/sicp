;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "find-employee-record.scm")
(load "install-division1-package.scm")
(load "install-division2-package.scm")

(install-division1-package)
(install-division2-package)

(define files (list "division2-personnel-2.scm" "division1-personnel-2.scm" "division2-personnel.scm"))
(find-employee-record "Peter Danenberg" files)
