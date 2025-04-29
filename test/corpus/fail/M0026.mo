=========
M0026.mo
=========

let _ : A.Foo = ();

---

(source_file
  (let_dec
    (annot_pat
      (wild_pat)
      (typ_annot
        (path_typ
          (typ_path
            (identifier)
            (type_identifier)))))
    (par_exp)))
