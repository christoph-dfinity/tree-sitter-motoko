=========
suggest-label.mo
=========

label foo {
  break fo;
};

---

(source_file
  (exp_dec
    (label_exp
      (identifier)
      (block_exp
        (exp_dec
          (break_exp
            (identifier)))))))
