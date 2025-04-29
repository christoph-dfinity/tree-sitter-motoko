=========
check-record.mo
=========


ignore ({ foo = 5 * 5 } : { foo : Nat64 }); // accept issue #2240

ignore ({ a = 0; var v = 0 } : {a : Int; var v : Int }); // accept

let r : {a : Int; var v : Int } = { a = 0; var v = 0 }; // accept

ignore ({ v = 0 } : { var v : Nat }); // reject mutability mismatch

ignore ({ var a = 0 } : { a : Nat }); // reject mutability mismatch

ignore ({ a = 0; var v = 0} : { var a : Int;  v : Int }); // reject, mutability mismatches

ignore ({} : { a : Nat }); // reject

ignore ({ a = 0; b = 1} : { a : Nat }); // accept (but warn in the future?)

do {
  let a = 1;
  let b = 2;
  { a = a; b = a; c = 1; d = c}; // reject (c not bound)
};

ignore ({ {} with a = 1  } : { b : Nat }); // reject

---

(source_file
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (object_exp
            (exp_field
              (identifier)
              (bin_exp_object
                (lit_exp
                  (int_literal))
                (bin_op)
                (lit_exp
                  (int_literal)))))
          (obj_typ
            (val_tf
              (identifier)
              (path_typ
                (typ_path
                  (type_identifier)))))))))
  (line_comment)
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (object_exp
            (exp_field
              (identifier)
              (lit_exp
                (int_literal)))
            (exp_field
              (identifier)
              (lit_exp
                (int_literal))))
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
                  (type_identifier)))))))))
  (line_comment)
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
                (type_identifier))))
          (val_tf
            (identifier)
            (path_typ
              (typ_path
                (type_identifier)))))))
    (object_exp
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))))
  (line_comment)
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
                  (type_identifier)))))))))
  (line_comment)
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
                  (type_identifier)))))))))
  (line_comment)
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (object_exp
            (exp_field
              (identifier)
              (lit_exp
                (int_literal)))
            (exp_field
              (identifier)
              (lit_exp
                (int_literal))))
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
                  (type_identifier)))))))))
  (line_comment)
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (object_exp)
          (obj_typ
            (val_tf
              (identifier)
              (path_typ
                (typ_path
                  (type_identifier)))))))))
  (line_comment)
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (object_exp
            (exp_field
              (identifier)
              (lit_exp
                (int_literal)))
            (exp_field
              (identifier)
              (lit_exp
                (int_literal))))
          (obj_typ
            (val_tf
              (identifier)
              (path_typ
                (typ_path
                  (type_identifier)))))))))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal)))
        (let_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal)))
        (exp_dec
          (object_exp
            (exp_field
              (identifier)
              (var_exp
                (identifier)))
            (exp_field
              (identifier)
              (var_exp
                (identifier)))
            (exp_field
              (identifier)
              (lit_exp
                (int_literal)))
            (exp_field
              (identifier)
              (var_exp
                (identifier)))))
        (line_comment))))
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (object_exp
            (object_exp)
            (exp_field
              (identifier)
              (lit_exp
                (int_literal))))
          (obj_typ
            (val_tf
              (identifier)
              (path_typ
                (typ_path
                  (type_identifier)))))))))
  (line_comment))
