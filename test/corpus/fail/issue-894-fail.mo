=========
issue-894-fail.mo
=========

import Prim "mo:⛔";
actor a {
  public shared func test() : async () {
    do {
      let o = {var l = 0};
      (await async o).l := await async 1; // type error (o mutable, not shared)
      Prim.debugPrintNat(o.l);
      assert o.l == 1;
    };

    do {
      let a = [var 0];
      (await async a)[0] := await async 1; // type error (a mutable, not shared)
      Prim.debugPrintNat(a[0]);
      assert a[0] == 1;
    };
  }
};

a.test();

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (vis)
        (func_dec
          (shared_pat)
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (do_exp
                  (block_exp
                    (let_dec
                      (var_pat
                        (identifier))
                      (object_exp
                        (exp_field
                          (identifier)
                          (lit_exp
                            (int_literal)))))
                    (exp_dec
                      (assign_exp_object
                        (dot_exp_object
                          (par_exp
                            (await_exp
                              (async_exp
                                (var_exp
                                  (identifier)))))
                          (identifier))
                        (await_exp
                          (async_exp
                            (lit_exp
                              (int_literal))))))
                    (line_comment)
                    (exp_dec
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp
                          (dot_exp_object
                            (var_exp
                              (identifier))
                            (identifier)))))
                    (exp_dec
                      (assert_exp
                        (bin_exp_block
                          (dot_exp_block
                            (var_exp
                              (identifier))
                            (identifier))
                          (rel_op)
                          (lit_exp
                            (int_literal))))))))
              (exp_dec
                (do_exp
                  (block_exp
                    (let_dec
                      (var_pat
                        (identifier))
                      (array_exp
                        (lit_exp
                          (int_literal))))
                    (exp_dec
                      (assign_exp_object
                        (array_idx_exp_object
                          (par_exp
                            (await_exp
                              (async_exp
                                (var_exp
                                  (identifier)))))
                          (lit_exp
                            (int_literal)))
                        (await_exp
                          (async_exp
                            (lit_exp
                              (int_literal))))))
                    (line_comment)
                    (exp_dec
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp
                          (array_idx_exp_object
                            (var_exp
                              (identifier))
                            (lit_exp
                              (int_literal))))))
                    (exp_dec
                      (assert_exp
                        (bin_exp_block
                          (array_idx_exp_block
                            (var_exp
                              (identifier))
                            (lit_exp
                              (int_literal)))
                          (rel_op)
                          (lit_exp
                            (int_literal))))))))))))))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (par_exp))))
