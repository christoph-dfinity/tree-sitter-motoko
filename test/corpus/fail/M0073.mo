=========
M0073.mo
=========

let x = ();
x := ()

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (par_exp))
  (exp_dec
    (assign_exp_object
      (var_exp
        (identifier))
      (par_exp))))
