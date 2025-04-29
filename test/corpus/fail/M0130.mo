=========
M0130.mo
=========

actor {
  system let foo = ()
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
          (par_exp))))))
