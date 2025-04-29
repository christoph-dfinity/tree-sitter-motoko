=========
issue2331.mo
=========

ignore ({foo = 0} : { bar : Nat });

---

(source_file
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (object_exp
            (exp_field
              (identifier)
              (lit_exp
                (int_literal))))
          (obj_typ
            (val_tf
              (identifier)
              (path_typ
                (typ_path
                  (type_identifier))))))))))
