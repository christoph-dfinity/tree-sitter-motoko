=========
actor-reference-infer.mo
=========

// actor references

let _ = actor "bfozs-kwa73-7nadi";  // cannot infer

---

(source_file
  (line_comment)
  (let_dec
    (wild_pat)
    (actor_exp
      (lit_exp
        (text_literal))))
  (line_comment))
