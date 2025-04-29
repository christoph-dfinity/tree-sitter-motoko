=========
usedefbug.mo
=========

class Bar () {
  
  private class Foo(f1:Int -> Int, f2:Int -> Int) { 
    let bomb = f1(666) + f2(666);
  };

  let Bar = Foo(g, g);

  private func g(n:Int) : Int = n + 1;

}

---

(source_file
  (class_dec
    (type_identifier)
    (tup_pat)
    (class_body
      (obj_body
        (dec_field
          (vis)
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
            (var_pat
              (identifier))
            (call_exp_object
              (var_exp
                (identifier))
              (par_exp
                (var_exp
                  (identifier))
                (var_exp
                  (identifier))))))
        (dec_field
          (vis)
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
                  (int_literal))))))))))
