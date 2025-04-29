=========
issue-3426.mo
=========

actor Counter {
  let r1 = {y=1};
  let r2 = {r1 and r1 with x = 1};
}

---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (let_dec
          (var_pat
            (identifier))
          (object_exp
            (exp_field
              (identifier)
              (lit_exp
                (int_literal))))))
      (dec_field
        (let_dec
          (var_pat
            (identifier))
          (object_exp
            (var_exp
              (identifier))
            (var_exp
              (identifier))
            (exp_field
              (identifier)
              (lit_exp
                (int_literal)))))))))
