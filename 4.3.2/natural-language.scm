(load "nouns.scm")
(load "verbs.scm")
(load "articles.scm")
(load "parse-word.scm")
(load "*unparsed*.scm")
(load "parse.scm")
(load "prepositions.scm")
(load "parse-prepositional-phrase.scm")
(load "parse-sentence.scm")
(load "parse-verb-phrase.scm")
(load "parse-simple-noun-phrase.scm")
(load "parse-noun-phrase.scm")

(define natural-language
  (list nouns
        verbs
        articles
        parse-word
        *unparsed*
        parse
        prepositions
        parse-prepositional-phrase
        parse-sentence
        parse-verb-phrase
        parse-simple-noun-phrase
        parse-noun-phrase
        ))
