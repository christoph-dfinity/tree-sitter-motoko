=========
M0044.mo
=========

func foo<A, A>() {}

---

(source_file
  (func_dec
    (identifier)
    (typ_params
      (typ_bind
        (type_identifier))
      (typ_bind
        (type_identifier)))
    (tup_pat)
    (func_body
      (block_exp))))
