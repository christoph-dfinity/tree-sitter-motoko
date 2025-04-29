=========
debug.mo
=========

debug { 42 }; // error: result Int

---

(source_file
  (exp_dec
    (debug_exp
      (block_exp
        (exp_dec
          (lit_exp
            (int_literal))))))
  (line_comment))
