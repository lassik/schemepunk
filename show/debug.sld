(define-library (schemepunk show debug)
  (export write-debug)
  (import (scheme base)
          (schemepunk syntax)
          (schemepunk generator)
          (schemepunk show span)
          (schemepunk show block)
          (schemepunk show block datum))
  (begin
    (define (write-debug datum)
      (with-default-datum-colors (λ ()
        (chain (datum->block datum)
               (block->span-generator/indented)
               (generator-for-each write-span))
        (newline))))))
