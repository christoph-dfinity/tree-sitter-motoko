=========
unused-actor-class/test-actor-class.mo
=========

actor class TestActorClass(actorClassParameter1 : Nat) {
    var actorClassVariable1 = 0;
    var actorClassVariable2 = "TEST";

    func unusedActorClassMethod(parameter1 : Nat, parameter2 : Int) {
        actorClassVariable1 := 1;
    };

    public func publicActorClassMethod() : async() {
    };
};

---

(source_file
  (class_dec
    (obj_sort)
    (type_identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier))))))
    (class_body
      (obj_body
        (dec_field
          (var_dec
            (var_pat
              (identifier))
            (lit_exp
              (int_literal))))
        (dec_field
          (var_dec
            (var_pat
              (identifier))
            (lit_exp
              (text_literal))))
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
                (exp_dec
                  (assign_exp_object
                    (var_exp
                      (identifier))
                    (lit_exp
                      (int_literal))))))))
        (dec_field
          (vis)
          (func_dec
            (identifier)
            (tup_pat)
            (typ_annot
              (async_typ
                (tup_typ)))
            (func_body
              (block_exp))))))))
