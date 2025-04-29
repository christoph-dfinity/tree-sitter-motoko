=========
suggest-long-ai.mo
=========

//MOC-FLAG --ai-errors
import Prim "mo:⛔";

Prim.stableM;

---

(source_file
  (line_comment)
  (import
    (var_pat
      (identifier))
    (text_literal))
  (exp_dec
    (dot_exp_object
      (var_exp
        (identifier))
      (identifier))))
