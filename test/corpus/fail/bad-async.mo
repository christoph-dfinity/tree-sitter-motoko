=========
bad-async.mo
=========

actor a {
    public func getNat() : async Nat { 0 };
    flexible var x : [async Nat] = [];
    public func foo1() { x := [a.getNat()] };
    public func foo2() : async Nat {
                10 +
         (await x[0])
    };
};

---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (exp_dec
                (lit_exp
                  (int_literal)))))))
      (dec_field
        (stab)
        (var_dec
          (var_pat
            (identifier))
          (typ_annot
            (array_typ
              (async_typ
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (array_exp)))
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp
              (exp_dec
                (assign_exp_object
                  (var_exp
                    (identifier))
                  (array_exp
                    (call_exp_object
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))
                      (par_exp)))))))))
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (exp_dec
                (bin_exp_object
                  (lit_exp
                    (int_literal))
                  (bin_op)
                  (par_exp
                    (await_exp
                      (array_idx_exp_block
                        (var_exp
                          (identifier))
                        (lit_exp
                          (int_literal))))))))))))))
