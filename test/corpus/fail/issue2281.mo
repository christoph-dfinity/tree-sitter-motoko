=========
issue2281.mo
=========

do {
  let () = (true, false);
};
do {
  let (_,_) = (true, false, true);
};

---

(source_file
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (tup_pat)
          (par_exp
            (lit_exp
              (bool_literal))
            (lit_exp
              (bool_literal)))))))
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (tup_pat
            (wild_pat)
            (wild_pat))
          (par_exp
            (lit_exp
              (bool_literal))
            (lit_exp
              (bool_literal))
            (lit_exp
              (bool_literal))))))))
