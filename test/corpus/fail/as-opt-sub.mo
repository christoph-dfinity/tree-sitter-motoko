=========
as-opt-sub.mo
=========

let emptyIter = { next = func () : Null { return null} }; // <: { next: () -> ? None };
for (i in emptyIter) { // should be accepted
};

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (object_exp
      (exp_field
        (identifier)
        (func_exp
          (tup_pat)
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (return_exp
                  (lit_exp
                    (null_literal))))))))))
  (line_comment)
  (exp_dec
    (for_exp
      (var_pat
        (identifier))
      (var_exp
        (identifier))
      (block_exp
        (line_comment)))))
