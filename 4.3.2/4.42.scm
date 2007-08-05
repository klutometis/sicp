(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-until-fail.scm")
(load "distinct?.scm")
(load "require.scm")
(load "liars.scm")

(install-packages)
(ambeval-global require)
(ambeval-global distinct?)
(ambeval-global liars)

(define liars (ambeval-global-until-fail '(liars)))

(test
 "liars puzzle"
 '(((betty 3) (kitty 1) (mary 4) (ethel 5) (joan 2)))
 liars
 'equal? equal?)
 
