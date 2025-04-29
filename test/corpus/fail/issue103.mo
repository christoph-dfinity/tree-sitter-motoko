=========
issue103.mo
=========

// A (non-shared) function is not sharable
do {
  func invalid1 (f : shared (() -> Nat) -> ()) {
     f (func foo() : Nat = 1)
  };
};

// An object with function fields is not sharable
do {
  func invalid2 (f : shared {foo : () -> Nat} -> ()) {
     f (object { public func foo() : Nat = 1; })
  };
};

// Cannot return a function in an async
do {
  func invalid3 () : (async (() -> Nat)) {
     async { func foo() : Nat = 1 }
  };
};

// Cannot return an object with function fields in an async
do {
  func invalid4 () : (async ({foo : () -> Nat})) {
     async { object { public func foo() : Nat = 1; } }
  };
};

---

(source_file
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (func_dec
          (identifier)
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (tup_typ
                    (typ_item
                      (func_typ
                        (tup_typ)
                        (path_typ
                          (typ_path
                            (type_identifier))))))
                  (tup_typ)))))
          (func_body
            (block_exp
              (exp_dec
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp
                    (func_dec
                      (identifier)
                      (tup_pat)
                      (typ_annot
                        (path_typ
                          (typ_path
                            (type_identifier))))
                      (func_body
                        (lit_exp
                          (int_literal)))))))))))))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (func_dec
          (identifier)
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (obj_typ
                    (val_tf
                      (identifier)
                      (func_typ
                        (tup_typ)
                        (path_typ
                          (typ_path
                            (type_identifier))))))
                  (tup_typ)))))
          (func_body
            (block_exp
              (exp_dec
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp
                    (obj_dec
                      (obj_sort)
                      (obj_body
                        (dec_field
                          (vis)
                          (func_dec
                            (identifier)
                            (tup_pat)
                            (typ_annot
                              (path_typ
                                (typ_path
                                  (type_identifier))))
                            (func_body
                              (lit_exp
                                (int_literal))))))))))))))))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (tup_typ
              (typ_item
                (async_typ
                  (tup_typ
                    (typ_item
                      (func_typ
                        (tup_typ)
                        (path_typ
                          (typ_path
                            (type_identifier))))))))))
          (func_body
            (block_exp
              (exp_dec
                (async_exp
                  (block_exp
                    (func_dec
                      (identifier)
                      (tup_pat)
                      (typ_annot
                        (path_typ
                          (typ_path
                            (type_identifier))))
                      (func_body
                        (lit_exp
                          (int_literal)))))))))))))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (tup_typ
              (typ_item
                (async_typ
                  (tup_typ
                    (typ_item
                      (obj_typ
                        (val_tf
                          (identifier)
                          (func_typ
                            (tup_typ)
                            (path_typ
                              (typ_path
                                (type_identifier))))))))))))
          (func_body
            (block_exp
              (exp_dec
                (async_exp
                  (block_exp
                    (obj_dec
                      (obj_sort)
                      (obj_body
                        (dec_field
                          (vis)
                          (func_dec
                            (identifier)
                            (tup_pat)
                            (typ_annot
                              (path_typ
                                (typ_path
                                  (type_identifier))))
                            (func_body
                              (lit_exp
                                (int_literal)))))))))))))))))
