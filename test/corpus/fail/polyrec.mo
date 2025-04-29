=========
polyrec.mo
=========

// this example triggers non-termination in subtyping due to non-regular type recursion in map<R>
module {

  public class Iter<T>({next = n : () -> ?T}) = this {

    public let next = n;

    public func map<R>(f : T -> R) : Iter<R> {
       loop {}
    };
  }

}

---

(source_file
  (line_comment)
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (vis)
        (class_dec
          (type_identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (obj_pat
              (pat_field
                (identifier)
                (annot_pat
                  (var_pat
                    (identifier))
                  (typ_annot
                    (func_typ
                      (tup_typ)
                      (quest_typ
                        (path_typ
                          (typ_path
                            (type_identifier))))))))))
          (class_body
            (identifier)
            (obj_body
              (dec_field
                (vis)
                (let_dec
                  (var_pat
                    (identifier))
                  (var_exp
                    (identifier))))
              (dec_field
                (vis)
                (func_dec
                  (identifier)
                  (typ_params
                    (typ_bind
                      (type_identifier)))
                  (tup_pat
                    (annot_pat
                      (var_pat
                        (identifier))
                      (typ_annot
                        (func_typ
                          (path_typ
                            (typ_path
                              (type_identifier)))
                          (path_typ
                            (typ_path
                              (type_identifier)))))))
                  (typ_annot
                    (path_typ
                      (typ_path
                        (type_identifier))
                      (path_typ
                        (typ_path
                          (type_identifier)))))
                  (func_body
                    (block_exp
                      (exp_dec
                        (loop_exp
                          (block_exp))))))))))))))
