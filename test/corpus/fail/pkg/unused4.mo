=========
pkg/unused4.mo
=========

module {

  // a private, unused definition
  let unused4 = 1;

}

---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (line_comment)
      (dec_field
        (let_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal)))))))
