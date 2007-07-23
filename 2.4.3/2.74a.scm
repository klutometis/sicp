(load "get-record.scm")
(load "install-division1-package.scm")
(load "install-division2-package.scm")

(install-division1-package)
(install-division2-package)
(get-record "Peter Danenberg" "division1-personnel.scm")
(get-record "Peter Danenberg" "division2-personnel.scm")

;; There must be a single-line header at the top of the file,
;; tagging the division.
