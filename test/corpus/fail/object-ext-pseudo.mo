=========
object-ext-pseudo.mo
=========

let tb_bad = { "Text base" with bar = 42 };
let ab_bad = { ["Array base"] with bar = 42 };

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (object_exp
      (lit_exp
        (text_literal))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))))
  (let_dec
    (var_pat
      (identifier))
    (object_exp
      (array_exp
        (lit_exp
          (text_literal)))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal))))))
