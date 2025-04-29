=========
objpat-duplicate.mo
=========

let o = {a = 1; b = 2};

switch o {
  case {a = x; b; a} {}
};

switch o {
  case {a; b = a} {}
};

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (object_exp
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))))
  (exp_dec
    (switch_exp
      (var_exp
        (identifier))
      (case
        (obj_pat
          (pat_field
            (identifier)
            (var_pat
              (identifier)))
          (pat_field
            (identifier))
          (pat_field
            (identifier)))
        (block_exp))))
  (exp_dec
    (switch_exp
      (var_exp
        (identifier))
      (case
        (obj_pat
          (pat_field
            (identifier))
          (pat_field
            (identifier)
            (var_pat
              (identifier))))
        (block_exp)))))
