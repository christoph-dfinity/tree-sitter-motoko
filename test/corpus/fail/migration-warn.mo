=========
migration-warn.mo
=========

// Warn about fields that are consumed, not produced and re-declared.
// These fields will be re-initialized, not retained.
// This may be intentional or a sign of data loss, hence just a warning.
(with migration =
  func({data : Nat}) : {} {
    ignore data;
    {}
   })
actor A {

   stable var data = 0;

   ignore data;

};

// fix 1: remove from domain
(with migration =
  func({}) : {} {
    {}
  })
actor B {

   stable var data = 0;

   ignore data;

};

// fix 2: add to range
(with migration =
  func({data : Nat}) : {data : Nat} {
    {data}
  })
actor C {

   stable var data = 0;

   ignore data;

};

---

(source_file
  (line_comment)
  (line_comment)
  (line_comment)
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
          (tup_pat
            (obj_pat
              (pat_field
                (identifier)
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (obj_typ))
          (func_body
            (block_exp
              (exp_dec
                (ignore_exp
                  (var_exp
                    (identifier))))
              (exp_dec
                (object_exp)))))))
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (stab)
        (var_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))
      (dec_field
        (exp_dec
          (ignore_exp
            (var_exp
              (identifier)))))))
  (line_comment)
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
          (tup_pat
            (obj_pat))
          (typ_annot
            (obj_typ))
          (func_body
            (block_exp
              (exp_dec
                (object_exp)))))))
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (stab)
        (var_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))
      (dec_field
        (exp_dec
          (ignore_exp
            (var_exp
              (identifier)))))))
  (line_comment)
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
          (tup_pat
            (obj_pat
              (pat_field
                (identifier)
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (obj_typ
              (val_tf
                (identifier)
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (func_body
            (block_exp
              (exp_dec
                (object_exp
                  (exp_field
                    (identifier)))))))))
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (stab)
        (var_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))
      (dec_field
        (exp_dec
          (ignore_exp
            (var_exp
              (identifier))))))))
