=========
bad-char-lit2.mo
=========

ignore('ab')

---

(source_file
  (exp_dec
    (ignore_exp
      (par_exp
        (lit_exp
          (char_literal))))))
