=========
M0129.mo
=========

actor {
  system func foobar() {}
}

---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp)))))))
