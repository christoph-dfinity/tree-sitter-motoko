=========
suggest-label-ai.mo
=========

//MOC-FLAG --ai-errors
label foo {
  break fo;
};

---

(source_file
  (line_comment)
  (exp_dec
    (label_exp
      (identifier)
      (block_exp
        (exp_dec
          (break_exp
            (identifier)))))))
