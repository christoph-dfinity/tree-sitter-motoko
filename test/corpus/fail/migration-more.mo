=========
migration-more.mo
=========

(with migration = func(n:Nat) : Int {n}) // reject - expect function on records
actor {
};

---

(source_file
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
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
                (var_exp
                  (identifier))))))))
    (line_comment)
    (obj_sort)
    (obj_body)))
