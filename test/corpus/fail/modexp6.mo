=========
modexp6.mo
=========

module A {
  let #foo = #foo
}

---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (let_dec
          (tag_pat
            (identifier))
          (hash_exp
            (identifier)))))))
