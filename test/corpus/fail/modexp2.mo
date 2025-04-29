=========
modexp2.mo
=========


module X = {
  public func f() { g();};
  func g() { f();};
  let y : Nat = 2;
  type U = Int;
  public type T = U;
};

type Ok = X.T;
type Wrong = X.U;


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
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (path_typ
                (typ_path
                  (type_identifier)))))
          (lit_exp
            (int_literal))))
      (dec_field
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier)))))
      (dec_field
        (vis)
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier)))))))
  (typ_dec
    (type_identifier)
    (path_typ
      (typ_path
        (identifier)
        (type_identifier))))
  (typ_dec
    (type_identifier)
    (path_typ
      (typ_path
        (identifier)
        (type_identifier)))))
