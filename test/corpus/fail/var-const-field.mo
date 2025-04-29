=========
var-const-field.mo
=========

let o : {var x : Nat} = {x = 0};

---

(source_file
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (obj_typ
          (val_tf
            (identifier)
            (path_typ
              (typ_path
                (type_identifier)))))))
    (object_exp
      (exp_field
        (identifier)
        (lit_exp
          (int_literal))))))
