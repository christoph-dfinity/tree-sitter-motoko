=========
use-before-define6.mo
=========

class Bar () {
  class Foo(f1 : Int -> Int, f2 : Int -> Int) {
    let bomb = f1(666) + f2(666);
  };

  let _ = Foo(g, g);

  func g(n : Int) : Int = n + 1;
};

let _ = Bar();

---

(source_file
  (class_dec
    (type_identifier)
    (tup_pat)
    (class_body
      (obj_body
        (dec_field
          (class_dec
            (type_identifier)
            (tup_pat
              (annot_pat
                (var_pat
                  (identifier))
                (typ_annot
                  (func_typ
                    (path_typ
                      (typ_path
                        (type_identifier)))
                    (path_typ
                      (typ_path
                        (type_identifier))))))
              (annot_pat
                (var_pat
                  (identifier))
                (typ_annot
                  (func_typ
                    (path_typ
                      (typ_path
                        (type_identifier)))
                    (path_typ
                      (typ_path
                        (type_identifier)))))))
            (class_body
              (obj_body
                (dec_field
                  (let_dec
                    (var_pat
                      (identifier))
                    (bin_exp_object
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (par_exp
                          (lit_exp
                            (int_literal))))
                      (bin_op)
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (par_exp
                          (lit_exp
                            (int_literal)))))))))))
        (dec_field
          (let_dec
            (wild_pat)
            (call_exp_object
              (var_exp
                (identifier))
              (par_exp
                (var_exp
                  (identifier))
                (var_exp
                  (identifier))))))
        (dec_field
          (func_dec
            (identifier)
            (tup_pat
              (annot_pat
                (var_pat
                  (identifier))
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (typ_annot
              (path_typ
                (typ_path
                  (type_identifier))))
            (func_body
              (bin_exp_object
                (var_exp
                  (identifier))
                (bin_op)
                (lit_exp
                  (int_literal)))))))))
  (let_dec
    (wild_pat)
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp))))
