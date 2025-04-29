=========
M0063.mo
=========

ignore debug_show (func () {})

---

(source_file
  (exp_dec
    (ignore_exp
      (debug_show_exp
        (par_exp
          (func_exp
            (tup_pat)
            (func_body
              (block_exp))))))))
