=========
unused-module/test-module.mo
=========

module {
    let unusedModuleVariable1 = 1;

    func localModuleFunction() {

    };

    public func publicModuleFunction() {

    };

    public object publicObject {
        public let publicObjectField = 0;
    };

    object localObject {
    }
}

---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (let_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp))))
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp))))
      (dec_field
        (vis)
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
                  (int_literal)))))))
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body))))))
