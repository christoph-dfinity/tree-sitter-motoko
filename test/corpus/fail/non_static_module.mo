=========
non_static_module.mo
=========

module Wrong = {
  func f() { assert false;};
  let _ = f(); // non_static!
  let _ = [var 0]; // non static
  var x = 0; // non-static
  let a = [0];

  object WrongO = {
   let _ = f(); // non_static!
   let _ = [var 0]; // non static
   var x = 0; // non-static
  };

  object OkO = {
    func f(){};
    let a = [0];
  };

  module WrongM = {
   let _ = f(); // non_static!
   let _ = [var 0]; // non static
   var x = 0; // non-static
  };

  object OkM = {
    func f(){};
    let a = [0];
  };


};


---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp
              (exp_dec
                (assert_exp
                  (lit_exp
                    (bool_literal))))))))
      (dec_field
        (let_dec
          (wild_pat)
          (call_exp_object
            (var_exp
              (identifier))
            (par_exp))))
      (line_comment)
      (dec_field
        (let_dec
          (wild_pat)
          (array_exp
            (lit_exp
              (int_literal)))))
      (line_comment)
      (dec_field
        (var_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))
      (line_comment)
      (dec_field
        (let_dec
          (var_pat
            (identifier))
          (array_exp
            (lit_exp
              (int_literal)))))
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (let_dec
                (wild_pat)
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp))))
            (line_comment)
            (dec_field
              (let_dec
                (wild_pat)
                (array_exp
                  (lit_exp
                    (int_literal)))))
            (line_comment)
            (dec_field
              (var_dec
                (var_pat
                  (identifier))
                (lit_exp
                  (int_literal))))
            (line_comment))))
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (func_dec
                (identifier)
                (tup_pat)
                (func_body
                  (block_exp))))
            (dec_field
              (let_dec
                (var_pat
                  (identifier))
                (array_exp
                  (lit_exp
                    (int_literal))))))))
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (let_dec
                (wild_pat)
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp))))
            (line_comment)
            (dec_field
              (let_dec
                (wild_pat)
                (array_exp
                  (lit_exp
                    (int_literal)))))
            (line_comment)
            (dec_field
              (var_dec
                (var_pat
                  (identifier))
                (lit_exp
                  (int_literal))))
            (line_comment))))
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (func_dec
                (identifier)
                (tup_pat)
                (func_body
                  (block_exp))))
            (dec_field
              (let_dec
                (var_pat
                  (identifier))
                (array_exp
                  (lit_exp
                    (int_literal)))))))))))
