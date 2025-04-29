=========
use-before-define5.mo
=========

// A closing actor needs to eagerly get the values
let a = actor { public func foo() : () { assert (x == 1) } };
let x = 1;

---

(source_file
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (obj_dec
      (obj_sort)
      (obj_body
        (dec_field
          (vis)
          (func_dec
            (identifier)
            (tup_pat)
            (typ_annot
              (tup_typ))
            (func_body
              (block_exp
                (exp_dec
                  (assert_exp
                    (par_exp
                      (bin_exp_object
                        (var_exp
                          (identifier))
                        (rel_op)
                        (lit_exp
                          (int_literal)))))))))))))
  (let_dec
    (var_pat
      (identifier))
    (lit_exp
      (int_literal))))
