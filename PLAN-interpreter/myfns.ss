; handle program
(define (evalProg var_list expr)
    (cond 
        ((symbol? expr) (findID var_list expr))
        ((integer? expr) expr)
        ((equal? (car expr) 'planIf) 
            (evalIf var_list (cadr expr) (caddr expr) (cadddr expr))
        )
        ((equal? (car expr) 'planAdd)
            (evalAdd var_list (cadr expr) (caddr expr))
        )
        ((equal? (car expr) 'planMul)
            (evalMul var_list (cadr expr) (caddr expr))
        )
        ((equal? (car expr) 'planSub)
            (evalSub var_list (cadr expr) (caddr expr))
        )
        ((equal? (car expr) 'planLet) 
            (evalLet var_list (cadr expr) (caddr expr) (cadddr expr))
        )
    )
)


; The evalIf function
(define (evalIf var_list cond_expr then_expr else_expr)
    (cond 
        ((> (evalProg var_list cond_expr) 0) (evalProg var_list then_expr))
        (else (evalProg var_list else_expr))
    )
)


; The evalAdd function
(define (evalAdd var_list left right)
    (+ (evalProg var_list left) (evalProg var_list right))
)


; The evalMul function
(define (evalMul var_list left right)
    (* (evalProg var_list left) (evalProg var_list right))
)


; The evalSub function
(define (evalSub var_list lexpr rexpr)
    (- (evalProg var_list lexpr) (evalProg var_list rexpr))
)


; The evalLet function
(define (evalLet var_list key value expr)
    (evalProg (cons (cons key (evalProg var_list value)) var_list) expr)
)


; A personally made function for finding the id from the list of bindings.
(define (findID var_list key)
    (cond 
        ((equal? key (caar var_list)) (cdar var_list))
        (#t (findID (cdr var_list) key))
    )
)


; The main myinterpreter function to be called for execution
(define (myinterpreter prog_list)
    (evalProg (cons '() '()) (cadr prog_list))
)
