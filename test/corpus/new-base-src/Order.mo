=========
Order.mo
=========

/// Utilities for `Order` (comparison between two values).

import Types "Types";

module {

  /// A type to represent an order.
  public type Order = Types.Order;

  /// Check if an order is #less.
  public func isLess(order : Order) : Bool {
    switch order {
      case (#less) { true };
      case _ { false }
    }
  };

  /// Check if an order is #equal.
  public func isEqual(order : Order) : Bool {
    switch order {
      case (#equal) { true };
      case _ { false }
    }
  };

  /// Check if an order is #greater.
  public func isGreater(order : Order) : Bool {
    switch order {
      case (#greater) { true };
      case _ { false }
    }
  };

  /// Returns true if only if  `order1` and `order2` are the same.
  public func equal(order1 : Order, order2 : Order) : Bool {
    switch (order1, order2) {
      case (#less, #less) { true };
      case (#equal, #equal) { true };
      case (#greater, #greater) { true };
      case _ { false }
    }
  };

  /// Returns an iterator that yields all possible `Order` values:
  /// `#less`, `#equal`, `#greater`.
  public func allValues() : Types.Iter<Order> {
    var nextState : ?Order = ?#less;
    {
      next = func() : ?Order {
        let state = nextState;
        switch state {
          case (?#less) { nextState := ?#equal };
          case (?#equal) { nextState := ?#greater };
          case (?#greater) { nextState := null };
          case (null) {}
        };
        state
      }
    }
  }

}

---

(source_file
  (doc_comment)
  (import
    (var_pat
      (identifier))
    (text_literal))
  (obj_dec
    (obj_sort)
    (obj_body
      (doc_comment)
      (dec_field
        (vis)
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (identifier)
              (type_identifier)))))
      (doc_comment)
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
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (switch_exp
                  (var_exp
                    (identifier))
                  (case
                    (tup_pat
                      (tag_pat
                        (identifier)))
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (bool_literal)))))
                  (case
                    (wild_pat)
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (bool_literal)))))))))))
      (doc_comment)
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
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (switch_exp
                  (var_exp
                    (identifier))
                  (case
                    (tup_pat
                      (tag_pat
                        (identifier)))
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (bool_literal)))))
                  (case
                    (wild_pat)
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (bool_literal)))))))))))
      (doc_comment)
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
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (switch_exp
                  (var_exp
                    (identifier))
                  (case
                    (tup_pat
                      (tag_pat
                        (identifier)))
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (bool_literal)))))
                  (case
                    (wild_pat)
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (bool_literal)))))))))))
      (doc_comment)
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
                    (type_identifier)))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (switch_exp
                  (par_exp
                    (var_exp
                      (identifier))
                    (var_exp
                      (identifier)))
                  (case
                    (tup_pat
                      (tag_pat
                        (identifier))
                      (tag_pat
                        (identifier)))
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (bool_literal)))))
                  (case
                    (tup_pat
                      (tag_pat
                        (identifier))
                      (tag_pat
                        (identifier)))
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (bool_literal)))))
                  (case
                    (tup_pat
                      (tag_pat
                        (identifier))
                      (tag_pat
                        (identifier)))
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (bool_literal)))))
                  (case
                    (wild_pat)
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (bool_literal)))))))))))
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (path_typ
              (typ_path
                (identifier)
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (var_dec
                (var_pat
                  (identifier))
                (typ_annot
                  (quest_typ
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (quest_exp
                  (hash_exp
                    (identifier))))
              (exp_dec
                (object_exp
                  (exp_field
                    (identifier)
                    (func_exp
                      (tup_pat)
                      (typ_annot
                        (quest_typ
                          (path_typ
                            (typ_path
                              (type_identifier)))))
                      (func_body
                        (block_exp
                          (let_dec
                            (var_pat
                              (identifier))
                            (var_exp
                              (identifier)))
                          (exp_dec
                            (switch_exp
                              (var_exp
                                (identifier))
                              (case
                                (tup_pat
                                  (quest_pat
                                    (tag_pat
                                      (identifier))))
                                (block_exp
                                  (exp_dec
                                    (assign_exp_object
                                      (var_exp
                                        (identifier))
                                      (quest_exp
                                        (hash_exp
                                          (identifier)))))))
                              (case
                                (tup_pat
                                  (quest_pat
                                    (tag_pat
                                      (identifier))))
                                (block_exp
                                  (exp_dec
                                    (assign_exp_object
                                      (var_exp
                                        (identifier))
                                      (quest_exp
                                        (hash_exp
                                          (identifier)))))))
                              (case
                                (tup_pat
                                  (quest_pat
                                    (tag_pat
                                      (identifier))))
                                (block_exp
                                  (exp_dec
                                    (assign_exp_object
                                      (var_exp
                                        (identifier))
                                      (lit_exp
                                        (null_literal))))))
                              (case
                                (tup_pat
                                  (lit_pat
                                    (null_literal)))
                                (block_exp))))
                          (exp_dec
                            (var_exp
                              (identifier))))))))))))))))
