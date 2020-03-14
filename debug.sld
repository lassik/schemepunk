(define-library (schemepunk debug)
  (export form->indent json->indent
          write-debug write-debug-json)

  (import (scheme base)
          (scheme write)
          (schemepunk debug indent)
          (schemepunk debug indent scheme)
          (schemepunk debug indent json)
          (schemepunk term-colors))

  (begin
    (define (write-debug form)
      (parameterize ((output-width (max 40 (get-terminal-width))))
        (write-indented (form->indent form)))
      (newline))

    (define (write-debug-json json)
      (parameterize ((output-width (max 40 (get-terminal-width))))
        (write-indented (json->indent json)))
      (newline))))
