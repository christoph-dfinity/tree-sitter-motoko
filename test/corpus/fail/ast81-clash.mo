=========
ast81-clash.mo
=========

func foo() { }; // <-- removing this definition avoids the compiler exception

actor class Test() = this { // <-- removing this stuff around the inner block avoids compiler exception
  public func go() {
    ignore(async
    {
      let x = 123;
      let x = 123;
    }
    )
  }
};

---

(source_file
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp)))
  (line_comment)
  (class_dec
    (obj_sort)
    (type_identifier)
    (tup_pat)
    (class_body
      (identifier)
      (obj_body
        (line_comment)
        (dec_field
          (vis)
          (func_dec
            (identifier)
            (tup_pat)
            (func_body
              (block_exp
                (exp_dec
                  (ignore_exp
                    (par_exp
                      (async_exp
                        (block_exp
                          (let_dec
                            (var_pat
                              (identifier))
                            (lit_exp
                              (int_literal)))
                          (let_dec
                            (var_pat
                              (identifier))
                            (lit_exp
                              (int_literal))))))))))))))))
