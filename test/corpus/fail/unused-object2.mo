=========
unused-object2.mo
=========

let o = object abc {
  let usedVariable = "ea";
  public func usedFunction() : Text { usedVariable };
};
ignore o.usedFunction();

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (obj_dec
      (obj_sort)
      (identifier)
      (obj_body
        (dec_field
          (let_dec
            (var_pat
              (identifier))
            (lit_exp
              (text_literal))))
        (dec_field
          (vis)
          (func_dec
            (identifier)
            (tup_pat)
            (typ_annot
              (path_typ
                (typ_path
                  (type_identifier))))
            (func_body
              (block_exp
                (exp_dec
                  (var_exp
                    (identifier))))))))))
  (exp_dec
    (ignore_exp
      (call_exp_block
        (dot_exp_block
          (var_exp
            (identifier))
          (identifier))
        (par_exp)))))
