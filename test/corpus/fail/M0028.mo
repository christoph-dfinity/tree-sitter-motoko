=========
M0028.mo
=========

module X {};
let _ : X.Y.t = ();

---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body))
  (let_dec
    (annot_pat
      (wild_pat)
      (typ_annot
        (path_typ
          (typ_path
            (identifier)
            (identifier)
            (type_identifier)))))
    (par_exp)))
