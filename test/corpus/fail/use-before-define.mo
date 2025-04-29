=========
use-before-define.mo
=========

import Prim "mo:⛔";

func f():Int = x;
let y = f();
let x = 1;
Prim.debugPrintInt(x);

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (func_dec
    (identifier)
    (tup_pat)
    (typ_annot
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (var_exp
        (identifier))))
  (let_dec
    (var_pat
      (identifier))
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp)))
  (let_dec
    (var_pat
      (identifier))
    (lit_exp
      (int_literal)))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (par_exp
        (var_exp
          (identifier))))))
