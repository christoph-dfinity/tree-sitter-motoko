=========
unused-parameter.mo
=========

func test(param:Int) {};

let _ = switch (42,) { case (param) param};

---

(source_file
  (func_dec
    (identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier))))))
    (func_body
      (block_exp)))
  (let_dec
    (wild_pat)
    (switch_exp
      (par_exp
        (lit_exp
          (int_literal)))
      (case
        (tup_pat
          (var_pat
            (identifier)))
        (var_exp
          (identifier))))))
