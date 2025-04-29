=========
nonlinear-pat.mo
=========

let (x,(y,x)) = (1,(2,3));

---

(source_file
  (let_dec
    (tup_pat
      (var_pat
        (identifier))
      (tup_pat
        (var_pat
          (identifier))
        (var_pat
          (identifier))))
    (par_exp
      (lit_exp
        (int_literal))
      (par_exp
        (lit_exp
          (int_literal))
        (lit_exp
          (int_literal))))))
