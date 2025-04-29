=========
object-ext-poly.mo
=========

func mix<A <: { a : Int }, B <: { b : Char }>(a : A, b : B) : A =
    { a and b with c = "Nope" };

---

(source_file
  (func_dec
    (identifier)
    (typ_params
      (typ_bind
        (type_identifier)
        (obj_typ
          (val_tf
            (identifier)
            (path_typ
              (typ_path
                (type_identifier))))))
      (typ_bind
        (type_identifier)
        (obj_typ
          (val_tf
            (identifier)
            (path_typ
              (typ_path
                (type_identifier)))))))
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier)))))
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier))))))
    (typ_annot
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (object_exp
        (var_exp
          (identifier))
        (var_exp
          (identifier))
        (exp_field
          (identifier)
          (lit_exp
            (text_literal)))))))
