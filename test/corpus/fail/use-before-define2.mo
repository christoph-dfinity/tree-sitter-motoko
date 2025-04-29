=========
use-before-define2.mo
=========

// This line is fine (no use-before-define)
let f1 = do { func f():Int = x };
// This is a false positive, due to the unsaturated occurence of f
// A more elaborate dependency analysis in freevars.ml could catch this.
let f2 = do { let f3 = func ():Int = x;  f3 };
let x = 1;
let y = f1() + f2();
assert(y == 1);

---

(source_file
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (do_exp
      (block_exp
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (var_exp
              (identifier)))))))
  (line_comment)
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (do_exp
      (block_exp
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
              (var_exp
                (identifier)))))
        (exp_dec
          (var_exp
            (identifier))))))
  (let_dec
    (var_pat
      (identifier))
    (lit_exp
      (int_literal)))
  (let_dec
    (var_pat
      (identifier))
    (bin_exp_object
      (call_exp_object
        (var_exp
          (identifier))
        (par_exp))
      (bin_op)
      (call_exp_object
        (var_exp
          (identifier))
        (par_exp))))
  (exp_dec
    (assert_exp
      (par_exp
        (bin_exp_object
          (var_exp
            (identifier))
          (rel_op)
          (lit_exp
            (int_literal)))))))
