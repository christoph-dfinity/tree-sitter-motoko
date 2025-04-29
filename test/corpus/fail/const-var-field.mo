=========
const-var-field.mo
=========

let o : {x : Nat} = object { public var x = 0 };

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
    (obj_dec
      (obj_sort)
      (obj_body
        (dec_field
          (vis)
          (var_dec
            (var_pat
              (identifier))
            (lit_exp
              (int_literal))))))))
