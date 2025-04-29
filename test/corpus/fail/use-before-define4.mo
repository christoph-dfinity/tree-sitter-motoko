=========
use-before-define4.mo
=========

let f = func() : Int {g ()};
let g = func() : Int {x};
assert(f() == 1);
let x = 1;

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (func_exp
      (tup_pat)
      (typ_annot
        (path_typ
          (typ_path
            (type_identifier))))
      (func_body
        (block_exp
          (exp_dec
            (call_exp_object
              (var_exp
                (identifier))
              (par_exp)))))))
  (let_dec
    (var_pat
      (identifier))
    (func_exp
      (tup_pat)
      (typ_annot
        (path_typ
          (typ_path
            (type_identifier))))
      (func_body
        (block_exp
          (exp_dec
            (var_exp
              (identifier)))))))
  (exp_dec
    (assert_exp
      (par_exp
        (bin_exp_object
          (call_exp_object
            (var_exp
              (identifier))
            (par_exp))
          (rel_op)
          (lit_exp
            (int_literal))))))
  (let_dec
    (var_pat
      (identifier))
    (lit_exp
      (int_literal))))
