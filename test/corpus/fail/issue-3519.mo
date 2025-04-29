=========
issue-3519.mo
=========

shared ({ caller = owner }) actor class Service(playerPrincipal : Principal) = this {

  type GenericType<T> = {
    thing : Nat;
  };

  // test
  public shared ({ caller }) func asplode<T>() : async GenericType<T> {
    return {
      thing = 1;
    };
  };

};

---

(source_file
  (class_dec
    (shared_pat
      (tup_pat
        (obj_pat
          (pat_field
            (identifier)
            (var_pat
              (identifier))))))
    (obj_sort)
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
      (identifier)
      (obj_body
        (dec_field
          (typ_dec
            (type_identifier)
            (typ_params
              (typ_bind
                (type_identifier)))
            (obj_typ
              (val_tf
                (identifier)
                (path_typ
                  (typ_path
                    (type_identifier)))))))
        (line_comment)
        (dec_field
          (vis)
          (func_dec
            (shared_pat
              (tup_pat
                (obj_pat
                  (pat_field
                    (identifier)))))
            (identifier)
            (typ_params
              (typ_bind
                (type_identifier)))
            (tup_pat)
            (typ_annot
              (async_typ
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (func_body
              (block_exp
                (exp_dec
                  (return_exp
                    (object_exp
                      (exp_field
                        (identifier)
                        (lit_exp
                          (int_literal))))))))))))))
