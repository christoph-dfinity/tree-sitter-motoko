=========
modexp1.mo
=========


module X = {
  public func f() { g();};
  func g() { f();};
};

let ok = X.f;
let wrong = X.g;

---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp
              (exp_dec
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp)))))))
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp
              (exp_dec
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp)))))))))
  (let_dec
    (var_pat
      (identifier))
    (dot_exp_object
      (var_exp
        (identifier))
      (identifier)))
  (let_dec
    (var_pat
      (identifier))
    (dot_exp_object
      (var_exp
        (identifier))
      (identifier))))
