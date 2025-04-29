=========
M0027.mo
=========

object X { public type t  = Int };

object Y {
  module X { public let Y = 1; };
  type t = X.Y.t
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
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (vis)
              (let_dec
                (var_pat
                  (identifier))
                (lit_exp
                  (int_literal)))))))
      (dec_field
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (identifier)
              (identifier)
              (type_identifier))))))))
