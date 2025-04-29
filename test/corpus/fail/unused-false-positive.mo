=========
unused-false-positive.mo
=========



(switch (true,false) {
  case (a,b) { d # a # b };
}) : Text;

---

(source_file
  (exp_dec
    (annot_exp_object
      (par_exp
        (switch_exp
          (par_exp
            (lit_exp
              (bool_literal))
            (lit_exp
              (bool_literal)))
          (case
            (tup_pat
              (var_pat
                (identifier))
              (var_pat
                (identifier)))
            (block_exp
              (exp_dec
                (bin_exp_object
                  (bin_exp_object
                    (var_exp
                      (identifier))
                    (bin_op)
                    (var_exp
                      (identifier)))
                  (bin_op)
                  (var_exp
                    (identifier))))))))
      (path_typ
        (typ_path
          (type_identifier))))))
