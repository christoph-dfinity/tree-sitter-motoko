=========
issue-3585/Record.mo
=========

module  {
  public let x =  { var v = 1 }; // was allowed, though impure, now reject as non-static!
}

---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (vis)
        (let_dec
          (var_pat
            (identifier))
          (object_exp
            (exp_field
              (identifier)
              (lit_exp
                (int_literal))))))
      (line_comment))))
