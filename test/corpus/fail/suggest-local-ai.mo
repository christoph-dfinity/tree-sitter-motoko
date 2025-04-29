=========
suggest-local-ai.mo
=========

//MOC-FLAG --ai-errors
let xxx = 1;
x;

---

(source_file
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (lit_exp
      (int_literal)))
  (exp_dec
    (var_exp
      (identifier))))
