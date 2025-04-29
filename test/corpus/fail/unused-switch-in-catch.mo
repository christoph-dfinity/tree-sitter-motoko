=========
unused-switch-in-catch.mo
=========

module {
    public func test() : async () {
        try {} catch exception {
            switch exception {
                case unused {
                    assert false;
                };
            };
        };
    };
};

---

(source_file
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
                (try_exp
                  (block_exp)
                  (catch
                    (var_pat
                      (identifier))
                    (block_exp
                      (exp_dec
                        (switch_exp
                          (var_exp
                            (identifier))
                          (case
                            (var_pat
                              (identifier))
                            (block_exp
                              (exp_dec
                                (assert_exp
                                  (lit_exp
                                    (bool_literal)))))))))))))))))))
