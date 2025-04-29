=========
char-low-surrogate.mo
=========

let _ = '\u{d800}';

---

(source_file
  (let_dec
    (wild_pat)
    (lit_exp
      (char_literal))))
