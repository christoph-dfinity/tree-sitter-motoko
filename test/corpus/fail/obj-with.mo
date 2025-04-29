=========
obj-with.mo
=========

import Prim "mo:⛔";

// syntax
// trailing semis optional
let b = { b = 6 };
let ba = { b with a = 8 };
let ba_semi = { b with a = 8; };

let bac = { b with a = 8; c = true };
let bac_semi = { b with a = 8; c = true; };


---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (line_comment)
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (object_exp
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))))
  (let_dec
    (var_pat
      (identifier))
    (object_exp
      (var_exp
        (identifier))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))))
  (let_dec
    (var_pat
      (identifier))
    (object_exp
      (var_exp
        (identifier))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))))
  (let_dec
    (var_pat
      (identifier))
    (object_exp
      (var_exp
        (identifier))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))
      (exp_field
        (identifier)
        (lit_exp
          (bool_literal)))))
  (let_dec
    (var_pat
      (identifier))
    (object_exp
      (var_exp
        (identifier))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))
      (exp_field
        (identifier)
        (lit_exp
          (bool_literal))))))
