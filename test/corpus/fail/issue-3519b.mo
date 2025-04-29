=========
issue-3519b.mo
=========

// reject generic shared functions
do { type wrong1 = shared <T>()-> async (); };
do { type wrong2 = shared query <T>()-> async (); };
do { type wrong3 = shared <T>()->(); };

---

(source_file
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (func_typ
            (typ_params
              (typ_bind
                (type_identifier)))
            (tup_typ)
            (async_typ
              (tup_typ)))))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (func_typ
            (typ_params
              (typ_bind
                (type_identifier)))
            (tup_typ)
            (async_typ
              (tup_typ)))))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (func_typ
            (typ_params
              (typ_bind
                (type_identifier)))
            (tup_typ)
            (tup_typ)))))))
