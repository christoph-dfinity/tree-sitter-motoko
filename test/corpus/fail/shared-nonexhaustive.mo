=========
shared-nonexhaustive.mo
=========

// patterns on shared functions must be exhaustive

shared func wrong1(true : Bool) : async () {};

((shared func wrong2(true : Bool) : async () {}) : shared Bool -> async ());

shared func wrong2(true : Bool)  {};

((shared func wrong2(true : Bool)  {}) : shared Bool -> ());

---

(source_file
  (line_comment)
  (func_dec
    (shared_pat)
    (identifier)
    (tup_pat
      (annot_pat
        (lit_pat
          (bool_literal))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier))))))
    (typ_annot
      (async_typ
        (tup_typ)))
    (func_body
      (block_exp)))
  (exp_dec
    (par_exp
      (annot_exp_object
        (par_exp
          (func_dec
            (shared_pat)
            (identifier)
            (tup_pat
              (annot_pat
                (lit_pat
                  (bool_literal))
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (typ_annot
              (async_typ
                (tup_typ)))
            (func_body
              (block_exp))))
        (func_typ
          (path_typ
            (typ_path
              (type_identifier)))
          (async_typ
            (tup_typ))))))
  (func_dec
    (shared_pat)
    (identifier)
    (tup_pat
      (annot_pat
        (lit_pat
          (bool_literal))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier))))))
    (func_body
      (block_exp)))
  (exp_dec
    (par_exp
      (annot_exp_object
        (par_exp
          (func_dec
            (shared_pat)
            (identifier)
            (tup_pat
              (annot_pat
                (lit_pat
                  (bool_literal))
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (func_body
              (block_exp))))
        (func_typ
          (path_typ
            (typ_path
              (type_identifier)))
          (tup_typ))))))
