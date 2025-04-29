=========
issue-2391.mo
=========

// check class types are closed
func f<T>() {
  class C(x:T){ public let y = x }; // reject
  // ... because outer parameter T occurs in type of public field y
};



func g<T>() {
  class C<U>(x : T, u: U){ public let y = x; }; // reject
  // ... because outer parameter T occurs in type of public field y
};


func h<T1, T2>() {
  class C<U>(x1 : T1, x2: T2, u: U){ public let y = (x1, x2); }; // reject
  // ... because outer parameters T1, T2 occur in type of public field y
};

---

(source_file
  (line_comment)
  (func_dec
    (identifier)
    (typ_params
      (typ_bind
        (type_identifier)))
    (tup_pat)
    (func_body
      (block_exp
        (class_dec
          (type_identifier)
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (class_body
            (obj_body
              (dec_field
                (vis)
                (let_dec
                  (var_pat
                    (identifier))
                  (var_exp
                    (identifier)))))))
        (line_comment)
        (line_comment))))
  (func_dec
    (identifier)
    (typ_params
      (typ_bind
        (type_identifier)))
    (tup_pat)
    (func_body
      (block_exp
        (class_dec
          (type_identifier)
          (typ_params
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
          (class_body
            (obj_body
              (dec_field
                (vis)
                (let_dec
                  (var_pat
                    (identifier))
                  (var_exp
                    (identifier)))))))
        (line_comment)
        (line_comment))))
  (func_dec
    (identifier)
    (typ_params
      (typ_bind
        (type_identifier))
      (typ_bind
        (type_identifier)))
    (tup_pat)
    (func_body
      (block_exp
        (class_dec
          (type_identifier)
          (typ_params
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
                    (type_identifier)))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (class_body
            (obj_body
              (dec_field
                (vis)
                (let_dec
                  (var_pat
                    (identifier))
                  (par_exp
                    (var_exp
                      (identifier))
                    (var_exp
                      (identifier))))))))
        (line_comment)
        (line_comment)))))
