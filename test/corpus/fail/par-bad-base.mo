=========
par-bad-base.mo
=========

class migration({}) = {};

(with migration; moot = "MOOT")
actor {
  func a() : async () {
    await ({ cycles = -3 } with) async ();
    await ({ cycles = "" } with) async ();
    await (with cycles = "") async ();
    func cycles() {};
    await (with cycles) async ();
    await (with timeout = "") async ();
  };
  func b() : async () {
    object base {
      public func cycles() {}
    };
    await (base with) async ();
  };
};

---

(source_file
  (class_dec
    (type_identifier)
    (tup_pat
      (obj_pat))
    (class_body
      (obj_body)))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier))
      (exp_field
        (identifier)
        (lit_exp
          (text_literal))))
    (obj_sort)
    (obj_body
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (await_exp
                  (async_exp
                    (parenthetical
                      (object_exp
                        (exp_field
                          (identifier)
                          (lit_exp
                            (int_literal)))))
                    (par_exp))))
              (exp_dec
                (await_exp
                  (async_exp
                    (parenthetical
                      (object_exp
                        (exp_field
                          (identifier)
                          (lit_exp
                            (text_literal)))))
                    (par_exp))))
              (exp_dec
                (await_exp
                  (async_exp
                    (parenthetical
                      (exp_field
                        (identifier)
                        (lit_exp
                          (text_literal))))
                    (par_exp))))
              (func_dec
                (identifier)
                (tup_pat)
                (func_body
                  (block_exp)))
              (exp_dec
                (await_exp
                  (async_exp
                    (parenthetical
                      (exp_field
                        (identifier)))
                    (par_exp))))
              (exp_dec
                (await_exp
                  (async_exp
                    (parenthetical
                      (exp_field
                        (identifier)
                        (lit_exp
                          (text_literal))))
                    (par_exp))))))))
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (obj_dec
                (obj_sort)
                (identifier)
                (obj_body
                  (dec_field
                    (vis)
                    (func_dec
                      (identifier)
                      (tup_pat)
                      (func_body
                        (block_exp))))))
              (exp_dec
                (await_exp
                  (async_exp
                    (parenthetical
                      (var_exp
                        (identifier)))
                    (par_exp)))))))))))
