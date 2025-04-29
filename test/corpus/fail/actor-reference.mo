=========
actor-reference.mo
=========

// actor references

ignore (actor "IC:bfozs-kwa73-7nadi" : ());  // must be actor type
ignore (actor (45) : actor {});  // argument must be text type

---

(source_file
  (line_comment)
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (actor_exp
            (lit_exp
              (text_literal)))
          (tup_typ)))))
  (line_comment)
  (exp_dec
    (ignore_exp
      (par_exp
        (annot_exp_object
          (actor_exp
            (par_exp
              (lit_exp
                (int_literal))))
          (obj_sort_typ
            (obj_typ))))))
  (line_comment))
