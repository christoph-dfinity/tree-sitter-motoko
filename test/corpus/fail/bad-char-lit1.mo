=========
bad-char-lit1.mo
=========

ignore('\a')

---

(source_file
  (exp_dec
    (ignore_exp
      (par_exp
        (lit_exp
          (char_literal))))))
