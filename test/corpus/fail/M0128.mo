=========
M0128.mo
=========

actor {
  func preupgrade(foo : Bool) {}
}

---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
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
          (func_body
            (block_exp)))))))
