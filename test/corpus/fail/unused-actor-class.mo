=========
unused-actor-class.mo
=========

import TestActor "unused-actor-class/test-actor-class";

actor {
    public func test(): async() {
        ignore await TestActor.TestActorClass(1);
    };
};

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (ignore_exp
                  (await_exp
                    (call_exp_block
                      (dot_exp_block
                        (var_exp
                          (identifier))
                        (identifier))
                      (par_exp
                        (lit_exp
                          (int_literal))))))))))))))
