=========
bad-obj-base.mo
=========

{ true with a = 3 };
let act = actor {};
{ act with a = 3 };
{ { y = 3; z = "H" } and { zx = 3 : Nat64 } and { zx = 3 : Nat64 } with y = -25 };


---

(source_file
  (exp_dec
    (object_exp
      (lit_exp
        (bool_literal))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))))
  (let_dec
    (var_pat
      (identifier))
    (obj_dec
      (obj_sort)
      (obj_body)))
  (exp_dec
    (object_exp
      (var_exp
        (identifier))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))))
  (exp_dec
    (object_exp
      (object_exp
        (exp_field
          (identifier)
          (lit_exp
            (int_literal)))
        (exp_field
          (identifier)
          (lit_exp
            (text_literal))))
      (object_exp
        (exp_field
          (identifier)
          (annot_exp_object
            (lit_exp
              (int_literal))
            (path_typ
              (typ_path
                (type_identifier))))))
      (object_exp
        (exp_field
          (identifier)
          (annot_exp_object
            (lit_exp
              (int_literal))
            (path_typ
              (typ_path
                (type_identifier))))))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal))))))
