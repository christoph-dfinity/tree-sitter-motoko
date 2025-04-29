=========
modules-shadow.mo
=========

object X { public type t  = Int };

object Y {
  let X = 1;
  type t = X.t
};

---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (vis)
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier)))))))
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (let_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))
      (dec_field
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (identifier)
              (type_identifier))))))))
