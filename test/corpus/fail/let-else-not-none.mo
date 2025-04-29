=========
let-else-not-none.mo
=========

let x = 4 else { 5 }

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
        (lit_exp
          (int_literal))))))
