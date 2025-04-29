=========
bad-type-comp.mo
=========

// negative tests for type component syntax
// NB: type components are neither binding nor recursive,
// unlike type definitions in blocks

ignore ((module {}) : module { type T = Null });
ignore ((module { public type T = Int}) : module { type T = Null });
ignore ((module { public type T = Null}) : module { type T = Null; type T = Null });

do {
  type O = {
    type T = ?T // not actually recursive, so reject.
  };
};

do {
  type O = {
    type T = ?U; // not actually mutually recursive, so reject;
    type U = ?T
  };
};


do {
  type F = <A>{ type T = A } -> (); // open type, reject
};


do {
  type F = <A>() -> { type T = A }; // open type, reject
};


do {
  type N = {
    type T = { type U = T; } // not actually recursive, reject.
  };
};

---

(source_file
  (line_comment)
  (line_comment)
  (line_comment)
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (par_exp
            (obj_dec
              (obj_sort)
              (obj_body)))
          (obj_sort_typ
            (obj_typ
              (typ_tf
                (type_identifier)
                (path_typ
                  (typ_path
                    (type_identifier))))))))))
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (par_exp
            (obj_dec
              (obj_sort)
              (obj_body
                (dec_field
                  (vis)
                  (typ_dec
                    (type_identifier)
                    (path_typ
                      (typ_path
                        (type_identifier))))))))
          (obj_sort_typ
            (obj_typ
              (typ_tf
                (type_identifier)
                (path_typ
                  (typ_path
                    (type_identifier))))))))))
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (par_exp
            (obj_dec
              (obj_sort)
              (obj_body
                (dec_field
                  (vis)
                  (typ_dec
                    (type_identifier)
                    (path_typ
                      (typ_path
                        (type_identifier))))))))
          (obj_sort_typ
            (obj_typ
              (typ_tf
                (type_identifier)
                (path_typ
                  (typ_path
                    (type_identifier))))
              (typ_tf
                (type_identifier)
                (path_typ
                  (typ_path
                    (type_identifier))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (obj_typ
            (typ_tf
              (type_identifier)
              (quest_typ
                (path_typ
                  (typ_path
                    (type_identifier)))))
            (line_comment))))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (obj_typ
            (typ_tf
              (type_identifier)
              (quest_typ
                (path_typ
                  (typ_path
                    (type_identifier)))))
            (line_comment)
            (typ_tf
              (type_identifier)
              (quest_typ
                (path_typ
                  (typ_path
                    (type_identifier))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (func_typ
            (typ_params
              (typ_bind
                (type_identifier)))
            (obj_typ
              (typ_tf
                (type_identifier)
                (path_typ
                  (typ_path
                    (type_identifier)))))
            (tup_typ)))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (func_typ
            (typ_params
              (typ_bind
                (type_identifier)))
            (tup_typ)
            (obj_typ
              (typ_tf
                (type_identifier)
                (path_typ
                  (typ_path
                    (type_identifier)))))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (obj_typ
            (typ_tf
              (type_identifier)
              (obj_typ
                (typ_tf
                  (type_identifier)
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (line_comment)))))))
