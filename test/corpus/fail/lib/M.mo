=========
lib/M.mo
=========

module {
  public module class F() {
    public type T = Int;
    public let x : T = 1;
  }
};


---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (vis)
        (class_dec
          (obj_sort)
          (type_identifier)
          (tup_pat)
          (class_body
            (obj_body
              (dec_field
                (vis)
                (typ_dec
                  (type_identifier)
                  (path_typ
                    (typ_path
                      (type_identifier)))))
              (dec_field
                (vis)
                (let_dec
                  (annot_pat
                    (var_pat
                      (identifier))
                    (typ_annot
                      (path_typ
                        (typ_path
                          (type_identifier)))))
                  (lit_exp
                    (int_literal)))))))))))
