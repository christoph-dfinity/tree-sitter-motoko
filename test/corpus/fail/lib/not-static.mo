=========
lib/not-static.mo
=========

assert "This is not a static files"

---

(source_file
  (exp_dec
    (assert_exp
      (lit_exp
        (text_literal)))))
