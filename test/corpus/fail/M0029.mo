=========
M0029.mo
=========

let _ : Foo = ();

---

(source_file
  (let_dec
    (annot_pat
      (wild_pat)
      (typ_annot
        (path_typ
          (typ_path
            (type_identifier)))))
    (par_exp)))
