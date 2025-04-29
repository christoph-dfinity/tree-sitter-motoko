=========
asyncret4.mo
=========

func call3<C <: Any>(f : shared query () -> C) : C { f (); };

---

(source_file
  (func_dec
    (identifier)
    (typ_params
      (typ_bind
        (type_identifier)
        (path_typ
          (typ_path
            (type_identifier)))))
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (func_typ
            (tup_typ)
            (path_typ
              (typ_path
                (type_identifier)))))))
    (typ_annot
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (block_exp
        (exp_dec
          (call_exp_object
            (var_exp
              (identifier))
            (par_exp)))))))
