=========
issue-874-b.mo
=========

let m = object {
   public module X {
     public type T = Int;
     public func bar() { m.X.bar();  };
     let _ = m.X.bar();
  }
};


---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (obj_dec
      (obj_sort)
      (obj_body
        (dec_field
          (vis)
          (obj_dec
            (obj_sort)
            (identifier)
            (obj_body
              (dec_field
                (vis)
                (typ_dec
                  (type_identifier)
                  (path_typ
                    (typ_path
                      (type_identifier)))))
              (dec_field
                (vis)
                (func_dec
                  (identifier)
                  (tup_pat)
                  (func_body
                    (block_exp
                      (exp_dec
                        (call_exp_object
                          (dot_exp_object
                            (dot_exp_object
                              (var_exp
                                (identifier))
                              (identifier))
                            (identifier))
                          (par_exp)))))))
              (dec_field
                (let_dec
                  (wild_pat)
                  (call_exp_object
                    (dot_exp_object
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))
                      (identifier))
                    (par_exp)))))))))))
