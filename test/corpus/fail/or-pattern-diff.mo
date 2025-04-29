=========
or-pattern-diff.mo
=========

let (#a a) or (#b b) = #a 5;

---

(source_file
  (let_dec
    (alt_pat
      (tup_pat
        (tag_pat
          (identifier)
          (var_pat
            (identifier))))
      (tup_pat
        (tag_pat
          (identifier)
          (var_pat
            (identifier)))))
    (hash_exp
      (identifier)
      (lit_exp
        (int_literal)))))
