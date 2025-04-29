=========
bad-shared-async-star.mo
=========

actor {

  public func bad()  : async* Nat { // reject (shared function can't return async*)
    666
  };

}

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
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (line_comment)
              (exp_dec
                (lit_exp
                  (int_literal))))))))))
