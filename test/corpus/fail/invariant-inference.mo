=========
invariant-inference.mo
=========

import Prim "mo:⛔";
// illustrate inconsistency of non-principal mutable array literal inference and 
// principal type parameter inference
do {
  let a = Prim.Array_init(1, 0); // rejected as ambiguous
};

do {
  let a = Prim.Array_init(1, 0) : [var Int]; // accepted
  a[0] := -1;
};

do { 
  let a = [var 0]; // accepted as [var Nat], but did the programmer actually intend [var Int]?
  a[0] := -1; // rejected
};

do { 
  let a = [var 0] : [var Int]; // accepted as [var Int] 
  a[0] := -1; // accepted
};

do { 
  let a : [var Int] = [var 0]; // ditto, accepted as [var Int] 
  a[0] := -1; // accepted
};

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (line_comment)
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (var_pat
            (identifier))
          (call_exp_object
            (dot_exp_object
              (var_exp
                (identifier))
              (identifier))
            (par_exp
              (lit_exp
                (int_literal))
              (lit_exp
                (int_literal)))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (var_pat
            (identifier))
          (annot_exp_object
            (call_exp_object
              (dot_exp_object
                (var_exp
                  (identifier))
                (identifier))
              (par_exp
                (lit_exp
                  (int_literal))
                (lit_exp
                  (int_literal))))
            (array_typ
              (path_typ
                (typ_path
                  (type_identifier))))))
        (line_comment)
        (exp_dec
          (assign_exp_object
            (array_idx_exp_object
              (var_exp
                (identifier))
              (lit_exp
                (int_literal)))
            (lit_exp
              (int_literal)))))))
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (var_pat
            (identifier))
          (array_exp
            (lit_exp
              (int_literal))))
        (line_comment)
        (exp_dec
          (assign_exp_object
            (array_idx_exp_object
              (var_exp
                (identifier))
              (lit_exp
                (int_literal)))
            (lit_exp
              (int_literal))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (var_pat
            (identifier))
          (annot_exp_object
            (array_exp
              (lit_exp
                (int_literal)))
            (array_typ
              (path_typ
                (typ_path
                  (type_identifier))))))
        (line_comment)
        (exp_dec
          (assign_exp_object
            (array_idx_exp_object
              (var_exp
                (identifier))
              (lit_exp
                (int_literal)))
            (lit_exp
              (int_literal))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (array_typ
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (array_exp
            (lit_exp
              (int_literal))))
        (line_comment)
        (exp_dec
          (assign_exp_object
            (array_idx_exp_object
              (var_exp
                (identifier))
              (lit_exp
                (int_literal)))
            (lit_exp
              (int_literal))))
        (line_comment)))))
