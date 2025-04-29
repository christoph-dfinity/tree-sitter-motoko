=========
modexp4.mo
=========


module X = {
  public func f() { g();};
  func g() { f();};
  module Y = {
    public type U = U -> U;
  };
  public type T = Y.U; // ok public field even though Y private and U "unavoidable"
  public func h():T { h() }; // ditto
};



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
                  (par_exp)))))))
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (vis)
              (typ_dec
                (type_identifier)
                (func_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))))
      (dec_field
        (vis)
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (identifier)
              (type_identifier)))))
      (line_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp)))))))
      (line_comment))))
