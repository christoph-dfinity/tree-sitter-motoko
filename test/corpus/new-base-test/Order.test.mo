=========
Order.test.mo
=========

import Order "../src/Order";
import { test } "mo:test";

test(
  "isLess",
  func() {
    assert (Order.isLess(#less));
    assert (not Order.isLess(#equal));
    assert (not Order.isLess(#greater))
  }
);

test(
  "isEqual",
  func() {
    assert (not Order.isEqual(#less));
    assert (Order.isEqual(#equal));
    assert (not Order.isEqual(#greater))
  }
);

test(
  "isGreater",
  func() {
    assert (not Order.isGreater(#less));
    assert (not Order.isGreater(#equal));
    assert (Order.isGreater(#greater))
  }
);

test(
  "allValues",
  func() {
    let iter = Order.allValues();
    assert (iter.next() == ?#less);
    assert (iter.next() == ?#equal);
    assert (iter.next() == ?#greater);
    assert (iter.next() == null);
    assert (iter.next() == null)
  }
)

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (import
    (obj_pat
      (pat_field
        (identifier)))
    (text_literal))
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (lit_exp
          (text_literal))
        (func_exp
          (tup_pat)
          (func_body
            (block_exp
              (exp_dec
                (assert_exp
                  (par_exp
                    (call_exp_object
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))
                      (par_exp
                        (hash_exp
                          (identifier)))))))
              (exp_dec
                (assert_exp
                  (par_exp
                    (not_exp
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp
                          (hash_exp
                            (identifier))))))))
              (exp_dec
                (assert_exp
                  (par_exp
                    (not_exp
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp
                          (hash_exp
                            (identifier))))))))))))))
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (lit_exp
          (text_literal))
        (func_exp
          (tup_pat)
          (func_body
            (block_exp
              (exp_dec
                (assert_exp
                  (par_exp
                    (not_exp
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp
                          (hash_exp
                            (identifier))))))))
              (exp_dec
                (assert_exp
                  (par_exp
                    (call_exp_object
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))
                      (par_exp
                        (hash_exp
                          (identifier)))))))
              (exp_dec
                (assert_exp
                  (par_exp
                    (not_exp
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp
                          (hash_exp
                            (identifier))))))))))))))
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (lit_exp
          (text_literal))
        (func_exp
          (tup_pat)
          (func_body
            (block_exp
              (exp_dec
                (assert_exp
                  (par_exp
                    (not_exp
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp
                          (hash_exp
                            (identifier))))))))
              (exp_dec
                (assert_exp
                  (par_exp
                    (not_exp
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp
                          (hash_exp
                            (identifier))))))))
              (exp_dec
                (assert_exp
                  (par_exp
                    (call_exp_object
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))
                      (par_exp
                        (hash_exp
                          (identifier)))))))))))))
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (lit_exp
          (text_literal))
        (func_exp
          (tup_pat)
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp)))
              (exp_dec
                (assert_exp
                  (par_exp
                    (bin_exp_object
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp))
                      (rel_op)
                      (quest_exp
                        (hash_exp
                          (identifier)))))))
              (exp_dec
                (assert_exp
                  (par_exp
                    (bin_exp_object
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp))
                      (rel_op)
                      (quest_exp
                        (hash_exp
                          (identifier)))))))
              (exp_dec
                (assert_exp
                  (par_exp
                    (bin_exp_object
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp))
                      (rel_op)
                      (quest_exp
                        (hash_exp
                          (identifier)))))))
              (exp_dec
                (assert_exp
                  (par_exp
                    (bin_exp_object
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp))
                      (rel_op)
                      (lit_exp
                        (null_literal))))))
              (exp_dec
                (assert_exp
                  (par_exp
                    (bin_exp_object
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp))
                      (rel_op)
                      (lit_exp
                        (null_literal)))))))))))))
