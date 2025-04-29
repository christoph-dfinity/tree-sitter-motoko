=========
wall.mo
=========

//MOC-FLAG -Werror

// Warnings should become errors here

do {
 let true = true;
};

do {
 ignore [true, 1];
};


---

(source_file
  (line_comment)
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (lit_pat
            (bool_literal))
          (lit_exp
            (bool_literal))))))
  (exp_dec
    (do_exp
      (block_exp
        (exp_dec
          (ignore_exp
            (array_exp
              (lit_exp
                (bool_literal))
              (lit_exp
                (int_literal)))))))))
