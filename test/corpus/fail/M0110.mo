=========
M0110.mo
=========

let true : Any = true

---

(source_file
  (let_dec
    (annot_pat
      (lit_pat
        (bool_literal))
      (typ_annot
        (path_typ
          (typ_path
            (type_identifier)))))
    (lit_exp
      (bool_literal))))
