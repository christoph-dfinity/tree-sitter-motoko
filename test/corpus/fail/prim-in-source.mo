=========
prim-in-source.mo
=========

let x : Int -> Int = prim "aprim"; ()

---

(source_file
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (func_typ
          (path_typ
            (typ_path
              (type_identifier)))
          (path_typ
            (typ_path
              (type_identifier))))))
    (prim_exp
      (text_literal)))
  (exp_dec
    (par_exp)))
