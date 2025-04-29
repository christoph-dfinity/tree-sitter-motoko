=========
unused-shadowing.mo
=========

let variable1 = 1;
var variable2 = 2;

func testUnusedFunction(parameter1 : Nat, parameter2 : Int) {
    var variable2 = 2;
    let variable3 = 3;
    var variable4 = 4;
    var variable5 = 5;
    if (variable1 == 0 and variable3 == 3) {
        let localFunction = func() {
            let variable2 = parameter1;
            let parameter2 = 2;
            variable5 *= variable2 + parameter2;
        };
    };
};

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (lit_exp
      (int_literal)))
  (var_dec
    (var_pat
      (identifier))
    (lit_exp
      (int_literal)))
  (func_dec
    (identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier)))))
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier))))))
    (func_body
      (block_exp
        (var_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal)))
        (let_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal)))
        (var_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal)))
        (var_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal)))
        (exp_dec
          (if_exp
            (par_exp
              (bin_exp_object
                (bin_exp_object
                  (bin_exp_object
                    (var_exp
                      (identifier))
                    (rel_op)
                    (lit_exp
                      (int_literal)))
                  (bin_op)
                  (var_exp
                    (identifier)))
                (rel_op)
                (lit_exp
                  (int_literal))))
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (func_exp
                  (tup_pat)
                  (func_body
                    (block_exp
                      (let_dec
                        (var_pat
                          (identifier))
                        (var_exp
                          (identifier)))
                      (let_dec
                        (var_pat
                          (identifier))
                        (lit_exp
                          (int_literal)))
                      (exp_dec
                        (binassign_exp_object
                          (var_exp
                            (identifier))
                          (binassign_op)
                          (bin_exp_object
                            (var_exp
                              (identifier))
                            (bin_op)
                            (var_exp
                              (identifier))))))))))))))))
