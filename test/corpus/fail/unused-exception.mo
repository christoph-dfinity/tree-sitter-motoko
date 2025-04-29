=========
unused-exception.mo
=========

module {
    public func foo() : async () {
        try { } catch (exception) {};
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
                    (tup_pat
                      (var_pat
                        (identifier)))
                    (block_exp)))))))))))
