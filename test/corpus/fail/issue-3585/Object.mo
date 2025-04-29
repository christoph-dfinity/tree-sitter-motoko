=========
issue-3585/Object.mo
=========

module  {
  public let x = object { var v = 1 }; // rejected as non-static
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
          (obj_dec
            (obj_sort)
            (obj_body
              (dec_field
                (var_dec
                  (var_pat
                    (identifier))
                  (lit_exp
                    (int_literal))))))))
      (line_comment))))
