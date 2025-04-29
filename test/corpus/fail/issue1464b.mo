=========
issue1464b.mo
=========

type Mean = ?Mean;
class Bar() = Self {
  public let mean : Mean = ?Self.mean;
};
Bar();

---

(source_file
  (typ_dec
    (type_identifier)
    (quest_typ
      (path_typ
        (typ_path
          (type_identifier)))))
  (class_dec
    (type_identifier)
    (tup_pat)
    (class_body
      (identifier)
      (obj_body
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
            (quest_exp
              (dot_exp_object
                (var_exp
                  (identifier))
                (identifier))))))))
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp))))
