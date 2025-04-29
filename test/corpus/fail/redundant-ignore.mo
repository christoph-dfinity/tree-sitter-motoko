=========
redundant-ignore.mo
=========

func f() {};

let u = ();
ignore (); // redundant
ignore f(); // redundant
ignore u; // redundant
ignore { (); }; // redundant, but failed to detect (needs lower bounds passed down analysis)
ignore (if true () else ()); // redundant, but failed to detect (needs lower bounds passed down analysis)

func g () {
  ignore (); // redundant
  ignore f(); // redundant
  ignore u; // redundant
  ignore { (); }; // redundant, but failed to detect (needs lower bounds passed down analysis)
  ignore (if true () else ()); // redundant, but failed to detect (needs lower bounds passed down analysis)
};

---

(source_file
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp)))
  (let_dec
    (var_pat
      (identifier))
    (par_exp))
  (exp_dec
    (ignore_exp
      (par_exp)))
  (line_comment)
  (exp_dec
    (ignore_exp
      (call_exp_block
        (var_exp
          (identifier))
        (par_exp))))
  (line_comment)
  (exp_dec
    (ignore_exp
      (var_exp
        (identifier))))
  (line_comment)
  (exp_dec
    (ignore_exp
      (block_exp
        (exp_dec
          (par_exp)))))
  (line_comment)
  (exp_dec
    (ignore_exp
      (par_exp
        (if_exp
          (lit_exp
            (bool_literal))
          (par_exp)
          (par_exp)))))
  (line_comment)
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (exp_dec
          (ignore_exp
            (par_exp)))
        (line_comment)
        (exp_dec
          (ignore_exp
            (call_exp_block
              (var_exp
                (identifier))
              (par_exp))))
        (line_comment)
        (exp_dec
          (ignore_exp
            (var_exp
              (identifier))))
        (line_comment)
        (exp_dec
          (ignore_exp
            (block_exp
              (exp_dec
                (par_exp)))))
        (line_comment)
        (exp_dec
          (ignore_exp
            (par_exp
              (if_exp
                (lit_exp
                  (bool_literal))
                (par_exp)
                (par_exp)))))
        (line_comment)))))
