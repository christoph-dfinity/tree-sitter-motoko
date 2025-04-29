=========
nat-module.mo
=========

module { public let why = 42 }

---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (vis)
        (let_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal)))))))
