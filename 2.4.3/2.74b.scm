(load "install-division1-package.scm")
(load "install-division2-package.scm")
(load "get-salary.scm")
(load "get-record.scm")

(install-division1-package)
(install-division2-package)
(get-salary (get-record "Peter Danenberg" "division1-personnel.scm"))
(get-salary (get-record "Peter Danenberg" "division2-personnel.scm"))

;; Record should have (division employee-record), where employee-record
;; is an alist (or other) of information.
