=========
bad-char-lit3.mo
=========

ignore('\e2\98\83'); // actually good
ignore('\ff')

---

(source_file
  (exp_dec
    (ignore_exp
      (par_exp
        (lit_exp
          (char_literal)))))
  (line_comment)
  (exp_dec
    (ignore_exp
      (par_exp
        (lit_exp
          (char_literal))))))
