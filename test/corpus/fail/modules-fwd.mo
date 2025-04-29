=========
modules-fwd.mo
=========

module X = {

let C = A.B;

let u = C.v;

module A = {
  public module B = {
    public type T = ();
    public let v = ();
  };
};

};

---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (let_dec
          (var_pat
            (identifier))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
      (dec_field
        (let_dec
          (var_pat
            (identifier))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
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
                      (tup_typ)))
                  (dec_field
                    (vis)
                    (let_dec
                      (var_pat
                        (identifier))
                      (par_exp))))))))))))
