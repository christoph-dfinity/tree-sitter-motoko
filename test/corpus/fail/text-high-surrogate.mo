=========
text-high-surrogate.mo
=========

let _ = "\u{dfff}";

---

(source_file
  (let_dec
    (wild_pat)
    (lit_exp
      (text_literal))))
