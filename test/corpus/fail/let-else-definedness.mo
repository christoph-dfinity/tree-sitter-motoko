=========
let-else-definedness.mo
=========

let x = 4 else { ignore x; loop () }

---

(source_file
  (let_else_dec
    (let_dec
      (var_pat
        (identifier))
      (lit_exp
        (int_literal)))
    (block_exp
      (exp_dec
        (ignore_exp
          (var_exp
            (identifier))))
      (exp_dec
        (loop_exp
          (par_exp))))))
