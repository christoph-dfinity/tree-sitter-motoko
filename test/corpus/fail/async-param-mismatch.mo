=========
async-param-mismatch.mo
=========

func swap<T,U>(t : T, u: U): async () {
  ();
};
ignore swap<Int>(1,1);

---

(source_file
  (func_dec
    (identifier)
    (typ_params
      (typ_bind
        (type_identifier))
      (typ_bind
        (type_identifier)))
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier)))))
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier))))))
    (typ_annot
      (async_typ
        (tup_typ)))
    (func_body
      (block_exp
        (exp_dec
          (par_exp)))))
  (exp_dec
    (ignore_exp
      (call_exp_block
        (var_exp
          (identifier))
        (inst
          (path_typ
            (typ_path
              (type_identifier))))
        (par_exp
          (lit_exp
            (int_literal))
          (lit_exp
            (int_literal)))))))
