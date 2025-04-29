=========
send-in-par.mo
=========

ignore (with cycles = await async 42) async 25

---

(source_file
  (exp_dec
    (ignore_exp
      (async_exp
        (parenthetical
          (exp_field
            (identifier)
            (await_exp
              (async_exp
                (lit_exp
                  (int_literal))))))
        (lit_exp
          (int_literal))))))
