=========
suggest-unprivileged.mo
=========

import Prim "mo:⛔";

// should not suggest @cycles because privileged

cycles;

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (line_comment)
  (exp_dec
    (var_exp
      (identifier))))
