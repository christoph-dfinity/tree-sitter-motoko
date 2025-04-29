=========
object-ext-var-base.mo
=========

object has_var {
    public var v = 42
};

object no_var {
    public let w = 25
};

// analysis
let _ : {var v : Nat; w : Nat } = { has_var and no_var };

//synthesis
let _ = { has_var and no_var }

---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (vis)
        (var_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))))
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
            (int_literal))))))
  (line_comment)
  (let_dec
    (annot_pat
      (wild_pat)
      (typ_annot
        (obj_typ
          (val_tf
            (identifier)
            (path_typ
              (typ_path
                (type_identifier))))
          (val_tf
            (identifier)
            (path_typ
              (typ_path
                (type_identifier)))))))
    (object_exp
      (var_exp
        (identifier))
      (var_exp
        (identifier))))
  (line_comment)
  (let_dec
    (wild_pat)
    (object_exp
      (var_exp
        (identifier))
      (var_exp
        (identifier)))))
