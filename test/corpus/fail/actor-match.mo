=========
actor-match.mo
=========

let a : actor {f : () -> (); g : () -> ()} = actor {
  public func f() {};
  public func g() {}
};

func foo() = switch a {
  case {f; g} { () }
};

assert ((switch (foo()) { case () 0 }) == 0)

---

(source_file
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (obj_sort_typ
          (obj_typ
            (val_tf
              (identifier)
              (func_typ
                (tup_typ)
                (tup_typ)))
            (val_tf
              (identifier)
              (func_typ
                (tup_typ)
                (tup_typ)))))))
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
              (block_exp)))))))
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (switch_exp
        (var_exp
          (identifier))
        (case
          (obj_pat
            (pat_field
              (identifier))
            (pat_field
              (identifier)))
          (block_exp
            (exp_dec
              (par_exp)))))))
  (exp_dec
    (assert_exp
      (par_exp
        (bin_exp_object
          (par_exp
            (switch_exp
              (par_exp
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp)))
              (case
                (tup_pat)
                (lit_exp
                  (int_literal)))))
          (rel_op)
          (lit_exp
            (int_literal)))))))
