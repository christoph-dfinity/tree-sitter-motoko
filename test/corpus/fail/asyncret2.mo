=========
asyncret2.mo
=========

func call3(f : shared () -> async Int) : async Int { f(); };

---

(source_file
  (func_dec
    (identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (func_typ
            (tup_typ)
            (async_typ
              (path_typ
                (typ_path
                  (type_identifier))))))))
    (typ_annot
      (async_typ
        (path_typ
          (typ_path
            (type_identifier)))))
    (func_body
      (block_exp
        (exp_dec
          (call_exp_object
            (var_exp
              (identifier))
            (par_exp)))))))
