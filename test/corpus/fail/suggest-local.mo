=========
suggest-local.mo
=========

let xxx = 1;
x;

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (lit_exp
      (int_literal)))
  (exp_dec
    (var_exp
      (identifier))))
