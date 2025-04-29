=========
unused-class.mo
=========

class UnusedTestClass() {
    let field = 0;
};

class UsedTestClass(classParameter1 : Nat, classParameter2 : Int) {
    public let field1 = 1;
    var field2 = 2;
    let field3 = field1;
    var field4 = field2;

    func unusedMethod(unusedParameter : Any) {
        let local1 = 0;
        let local2 = local1;
    };
};

let test = UsedTestClass(0, 0);
let result = test.field1;

---

(source_file
  (class_dec
    (type_identifier)
    (tup_pat)
    (class_body
      (obj_body
        (dec_field
          (let_dec
            (var_pat
              (identifier))
            (lit_exp
              (int_literal)))))))
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
          (vis)
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
                    (int_literal)))
                (let_dec
                  (var_pat
                    (identifier))
                  (var_exp
                    (identifier))))))))))
  (let_dec
    (var_pat
      (identifier))
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (lit_exp
          (int_literal))
        (lit_exp
          (int_literal)))))
  (let_dec
    (var_pat
      (identifier))
    (dot_exp_object
      (var_exp
        (identifier))
      (identifier))))
