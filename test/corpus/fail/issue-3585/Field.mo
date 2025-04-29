=========
issue-3585/Field.mo
=========

module {
  public var x = 1; // rejected as non-static
}

---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (vis)
        (var_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))
      (line_comment))))
