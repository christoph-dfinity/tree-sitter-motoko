=========
suggest-long.mo
=========

import Prim "mo:⛔";

Prim.stableM;

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (exp_dec
    (dot_exp_object
      (var_exp
        (identifier))
      (identifier))))
