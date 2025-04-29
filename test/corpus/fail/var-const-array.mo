=========
var-const-array.mo
=========

let a : [var Nat] = [];

---

(source_file
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (array_typ
          (path_typ
            (typ_path
              (type_identifier))))))
    (array_exp)))
