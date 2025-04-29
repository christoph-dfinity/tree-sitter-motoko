=========
branch-before-define.mo
=========

import Prim "mo:⛔";

func f():() -> Int {
  do {
    label exit : (() -> Int) {
      func g() : Int = x; // reference x
      break exit (func() : Int{ g(); }); // early exit omits definition of x
      let x:Int = 666;
      func():Int{777;};
    }
  };
};

Prim.debugPrint "1";
let h = f();

Prim.debugPrint "2";
let wrong = h();

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (func_dec
    (identifier)
    (tup_pat)
    (typ_annot
      (func_typ
        (tup_typ)
        (path_typ
          (typ_path
            (type_identifier)))))
    (func_body
      (block_exp
        (exp_dec
          (do_exp
            (block_exp
              (exp_dec
                (label_exp
                  (identifier)
                  (typ_annot
                    (tup_typ
                      (typ_item
                        (func_typ
                          (tup_typ)
                          (path_typ
                            (typ_path
                              (type_identifier)))))))
                  (block_exp
                    (func_dec
                      (identifier)
                      (tup_pat)
                      (typ_annot
                        (path_typ
                          (typ_path
                            (type_identifier))))
                      (func_body
                        (var_exp
                          (identifier))))
                    (line_comment)
                    (exp_dec
                      (break_exp
                        (identifier)
                        (par_exp
                          (func_exp
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
                                    (par_exp)))))))))
                    (line_comment)
                    (let_dec
                      (annot_pat
                        (var_pat
                          (identifier))
                        (typ_annot
                          (path_typ
                            (typ_path
                              (type_identifier)))))
                      (lit_exp
                        (int_literal)))
                    (exp_dec
                      (func_exp
                        (tup_pat)
                        (typ_annot
                          (path_typ
                            (typ_path
                              (type_identifier))))
                        (func_body
                          (block_exp
                            (exp_dec
                              (lit_exp
                                (int_literal))))))))))))))))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (lit_exp
        (text_literal))))
  (let_dec
    (var_pat
      (identifier))
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp)))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (lit_exp
        (text_literal))))
  (let_dec
    (var_pat
      (identifier))
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp))))
