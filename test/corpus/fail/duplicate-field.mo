=========
duplicate-field.mo
=========

do { actor class C() {
  public func m() {};
  public func n() {};
  public func m() {};  // Illegal!
}; };

do {
type T = {foo : Int; foo: Bool}
};

do {
type T = {foo : Int; nxnnbkddcv: Bool}
};

do {
type T = {#foo : Int; #nxnnbkddcv: Bool}
};

do {
ignore({foo = 5; foo = true});
};

do {
ignore({foo = 5; nxnnbkddcv = true});
};

do {
ignore(object {public func foo() = (); public func nxnnbkddcv() = ()});
};

do {
ignore(actor {public func foo() {}; public func nxnnbkddcv() {}});
};

do {
ignore(module {public func foo() = (); public func nxnnbkddcv() = ()});
};

do {
// not a clash
ignore(module {
  public let foo = 1;
  public type foo = Int;
  public type nxnnbkddcv = Nat
});};

do {
// not a clash
// syntax not supported yet
// type T = {type foo = Int; nxnnbkddcv: Bool}
};

---

(source_file
  (exp_dec
    (do_exp
      (block_exp
        (class_dec
          (obj_sort)
          (type_identifier)
          (tup_pat)
          (class_body
            (obj_body
              (dec_field
                (vis)
                (func_dec
                  (identifier)
                  (tup_pat)
                  (func_body
                    (block_exp))))
              (dec_field
                (vis)
                (func_dec
                  (identifier)
                  (tup_pat)
                  (func_body
                    (block_exp))))
              (dec_field
                (vis)
                (func_dec
                  (identifier)
                  (tup_pat)
                  (func_body
                    (block_exp))))
              (line_comment)))))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
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
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
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
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (variant_typ
            (typ_tag
              (identifier)
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier)))))
            (typ_tag
              (identifier)
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (exp_dec
          (ignore_exp
            (par_exp
              (object_exp
                (exp_field
                  (identifier)
                  (lit_exp
                    (int_literal)))
                (exp_field
                  (identifier)
                  (lit_exp
                    (bool_literal))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (exp_dec
          (ignore_exp
            (par_exp
              (object_exp
                (exp_field
                  (identifier)
                  (lit_exp
                    (int_literal)))
                (exp_field
                  (identifier)
                  (lit_exp
                    (bool_literal))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (exp_dec
          (ignore_exp
            (par_exp
              (obj_dec
                (obj_sort)
                (obj_body
                  (dec_field
                    (vis)
                    (func_dec
                      (identifier)
                      (tup_pat)
                      (func_body
                        (par_exp))))
                  (dec_field
                    (vis)
                    (func_dec
                      (identifier)
                      (tup_pat)
                      (func_body
                        (par_exp))))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (exp_dec
          (ignore_exp
            (par_exp
              (obj_dec
                (obj_sort)
                (obj_body
                  (dec_field
                    (vis)
                    (func_dec
                      (identifier)
                      (tup_pat)
                      (func_body
                        (block_exp))))
                  (dec_field
                    (vis)
                    (func_dec
                      (identifier)
                      (tup_pat)
                      (func_body
                        (block_exp))))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (exp_dec
          (ignore_exp
            (par_exp
              (obj_dec
                (obj_sort)
                (obj_body
                  (dec_field
                    (vis)
                    (func_dec
                      (identifier)
                      (tup_pat)
                      (func_body
                        (par_exp))))
                  (dec_field
                    (vis)
                    (func_dec
                      (identifier)
                      (tup_pat)
                      (func_body
                        (par_exp))))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
        (exp_dec
          (ignore_exp
            (par_exp
              (obj_dec
                (obj_sort)
                (obj_body
                  (dec_field
                    (vis)
                    (let_dec
                      (var_pat
                        (identifier))
                      (lit_exp
                        (int_literal))))
                  (dec_field
                    (vis)
                    (typ_dec
                      (type_identifier)
                      (path_typ
                        (typ_path
                          (type_identifier)))))
                  (dec_field
                    (vis)
                    (typ_dec
                      (type_identifier)
                      (path_typ
                        (typ_path
                          (type_identifier)))))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
        (line_comment)
        (line_comment)))))
