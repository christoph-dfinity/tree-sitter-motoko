=========
used-exception.mo
=========

module {
    public func foo() : async () {
        var x = try {} catch (exception) {
            throw exception;
        };
        x;
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
              (var_dec
                (var_pat
                  (identifier))
                (try_exp
                  (block_exp)
                  (catch
                    (tup_pat
                      (var_pat
                        (identifier)))
                    (block_exp
                      (exp_dec
                        (throw_exp
                          (var_exp
                            (identifier))))))))
              (exp_dec
                (var_exp
                  (identifier))))))))))
