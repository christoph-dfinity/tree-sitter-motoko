=========
missing-semi.mo
=========

func fo(){};

fo()
fo();
fo();

func f(){ 
  fo();
  fo()
  fo()
};

---

(source_file
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp)))
  (exp_dec
    (call_exp_object
      (call_exp_object
        (call_exp_object
          (var_exp
            (identifier))
          (par_exp))
        (var_exp
          (identifier)))
      (par_exp)))
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp)))
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (exp_dec
          (call_exp_object
            (var_exp
              (identifier))
            (par_exp)))
        (exp_dec
          (call_exp_object
            (call_exp_object
              (call_exp_object
                (var_exp
                  (identifier))
                (par_exp))
              (var_exp
                (identifier)))
            (par_exp)))))))
