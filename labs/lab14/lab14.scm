(define (split-at lst n)
  'YOUR-CODE-HERE
  (cond
    ((> n (length lst)) (cons lst nil))
    ((= n 0) (cons nil lst))
    (else
      (cons ( cons ( car lst )  ( car ( split-at ( cdr lst ) ( - n 1 )  )  )  )
        ( cdr ( split-at ( cdr lst ) ( - n 1 )  )  )
      )
    )
  )
)

(define (compose-all funcs)
  'YOUR-CODE-HERE
  (lambda (x)  
    (if (null? funcs)
      x
      ((compose-all (cdr funcs) ) ((car funcs) x))
    )
  )
)

