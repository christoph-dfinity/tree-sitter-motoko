=========
unused-actor-fields.mo
=========

actor {
    let _noUnusedWarning = ();

    class TestClass(classParameter1 : Nat, classParameter2 : Int) {
        let field1 = 1;
        var field2 = 2;
        var field3 = field2;

        func unusedMethod(unusedParameter1 : Any) {
            let local1 = 0;
        };
    };

    object TestObject {
        let objectField1 = 1;
        var objectField2 = 2;
        let objectField3 = objectField1;
        var objectField4 = objectField2;
    };

    var variable1 = 0;
    var variable2 = "TEST";

    func testUnusedFunction(parameter1 : Nat, parameter2 : Int) {
        var variable2 = 2;
        var variable3 = 3;
        let variable4 = 4;
        var variable5 = 5;
        if (variable1 == 0 and variable3 == 3) {
            let localFunction = func() {
                let variable2 = parameter1;
                variable5 *= variable2;
            };
        };
    };

    public func publicActorFunction(): async() {};
    public func otherPublicActorFunction(unusedParameter2: Text) {
    };
};

---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (let_dec
          (var_pat
            (identifier))
          (par_exp)))
      (dec_field
        (class_dec
          (type_identifier)
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
          (class_body
            (obj_body
              (dec_field
                (let_dec
                  (var_pat
                    (identifier))
                  (lit_exp
                    (int_literal))))
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
                  (var_exp
                    (identifier))))
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
                  (func_body
                    (block_exp
                      (let_dec
                        (var_pat
                          (identifier))
                        (lit_exp
                          (int_literal)))))))))))
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (let_dec
                (var_pat
                  (identifier))
                (lit_exp
                  (int_literal))))
            (dec_field
              (var_dec
                (var_pat
                  (identifier))
                (lit_exp
                  (int_literal))))
            (dec_field
              (let_dec
                (var_pat
                  (identifier))
                (var_exp
                  (identifier))))
            (dec_field
              (var_dec
                (var_pat
                  (identifier))
                (var_exp
                  (identifier)))))))
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
                            (exp_dec
                              (binassign_exp_object
                                (var_exp
                                  (identifier))
                                (binassign_op)
                                (var_exp
                                  (identifier)))))))))))))))
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp))))
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
          (func_body
            (block_exp)))))))
