=========
issue1464.mo
=========

class Foo(bar : { field : () }) {
  public func doFoo() = bar.field;
};

class Bar() = Self {
  public var foo : Foo = Foo(Self);
  public let field = ();
};

Bar().foo.doFoo();


---

(source_file
  (class_dec
    (type_identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (obj_typ
            (val_tf
              (identifier)
              (tup_typ))))))
    (class_body
      (obj_body
        (dec_field
          (vis)
          (func_dec
            (identifier)
            (tup_pat)
            (func_body
              (dot_exp_object
                (var_exp
                  (identifier))
                (identifier))))))))
  (class_dec
    (type_identifier)
    (tup_pat)
    (class_body
      (identifier)
      (obj_body
        (dec_field
          (vis)
          (var_dec
            (var_pat
              (identifier))
            (typ_annot
              (path_typ
                (typ_path
                  (type_identifier))))
            (call_exp_object
              (var_exp
                (identifier))
              (par_exp
                (var_exp
                  (identifier))))))
        (dec_field
          (vis)
          (let_dec
            (var_pat
              (identifier))
            (par_exp))))))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (dot_exp_object
          (call_exp_object
            (var_exp
              (identifier))
            (par_exp))
          (identifier))
        (identifier))
      (par_exp))))
