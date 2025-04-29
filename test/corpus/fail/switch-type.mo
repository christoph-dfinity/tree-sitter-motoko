=========
switch-type.mo
=========

let x = switch (-5) { case (x : Nat) x };

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (switch_exp
      (par_exp
        (lit_exp
          (int_literal)))
      (case
        (tup_pat
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (path_typ
                (typ_path
                  (type_identifier))))))
        (var_exp
          (identifier))))))
