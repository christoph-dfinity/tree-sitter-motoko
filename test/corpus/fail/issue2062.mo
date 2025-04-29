=========
issue2062.mo
=========

func fac(n : Nat) : Nat {
  if (n == 0) return
  return 1;
};

---

(source_file
  (func_dec
    (identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier))))))
    (typ_annot
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (block_exp
        (exp_dec
          (if_exp
            (par_exp
              (bin_exp_object
                (var_exp
                  (identifier))
                (rel_op)
                (lit_exp
                  (int_literal))))
            (return_exp
              (return_exp
                (lit_exp
                  (int_literal))))))))))
