(define (extend-if-consistent var dat environment)
    (if (environment-bound-symbol? environment var)
        (pattern-match (environment-lookup-symbol environment var) dat environment)
        (extend var dat environment)))
