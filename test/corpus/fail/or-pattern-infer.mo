=========
or-pattern-infer.mo
=========

func no_infer(#a or #b) {}

---

(source_file
  (func_dec
    (identifier)
    (tup_pat
      (alt_pat
        (tag_pat
          (identifier))
        (tag_pat
          (identifier))))
    (func_body
      (block_exp))))
