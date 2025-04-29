=========
unused-object.mo
=========

object UnusedTestObject {
    let field = 0;
};

object UsedTestObject {
    public let field1 = 1;
    var field2 = 2;
    let field3 = field1;
    var field4 = field2;

    func unusedMethod(unusedParameter : Any) {
        let local1 = 0;
        let local2 = local1;
    };
};

let result = UsedTestObject.field1;

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
          (lit_exp
            (int_literal))))))
  (obj_dec
    (obj_sort)
    (identifier)
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
                  (identifier)))))))))
  (let_dec
    (var_pat
      (identifier))
    (dot_exp_object
      (var_exp
        (identifier))
      (identifier))))
