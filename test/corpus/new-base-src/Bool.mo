=========
Bool.mo
=========

/// Boolean type and operations.
///
/// While boolean operators `_ and _` and `_ or _` are short-circuiting,
/// avoiding computation of the right argument when possible, the functions
/// `logand(_, _)` and `logor(_, _)` are *strict* and will always evaluate *both*
/// of their arguments.

import Prim "mo:⛔";
import Iter "Iter";
import Order "Order";

module {

  /// Booleans with constants `true` and `false`.
  public type Bool = Prim.Types.Bool;

  /// Returns `a and b`.
  public func logicalAnd(a : Bool, b : Bool) : Bool { a and b };

  /// Returns `a or b`.
  public func logicalOr(a : Bool, b : Bool) : Bool { a or b };

  /// Returns exclusive or of `a` and `y`, `a != b`.
  public func logicalXor(a : Bool, b : Bool) : Bool { a != b };

  /// Returns `not bool`.
  public func logicalNot(bool : Bool) : Bool { not bool };

  /// Returns `a == b`.
  public func equal(a : Bool, b : Bool) : Bool {
    a == b
  };

  /// Returns `a != b`.
  public func compare(a : Bool, b : Bool) : Order.Order {
    if (a == b) { #equal } else if (a) { #greater } else { #less }
  };

  // Returns a text value which is either `"true"` or `"false"` depending on the input value.
  public func toText(bool : Bool) : Text {
    if bool "true" else "false"
  };

  // Returns an iterator over all possible boolean values (`true` and `false`).
  public func allValues() : Iter.Iter<Bool> = object {
    var state : ?Bool = ?true;
    public func next() : ?Bool {
      switch state {
        case (?true) { state := ?false; ?true };
        case (?false) { state := null; ?false };
        case null { null }
      }
    }
  };

}

---

(source_file
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (import
    (var_pat
      (identifier))
    (text_literal))
  (import
    (var_pat
      (identifier))
    (text_literal))
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
                (bin_exp_object
                  (var_exp
                    (identifier))
                  (bin_op)
                  (var_exp
                    (identifier))))))))
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
                (bin_exp_object
                  (var_exp
                    (identifier))
                  (bin_op)
                  (var_exp
                    (identifier))))))))
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
                (bin_exp_object
                  (var_exp
                    (identifier))
                  (rel_op)
                  (var_exp
                    (identifier))))))))
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
                (not_exp
                  (var_exp
                    (identifier))))))))
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
                (bin_exp_object
                  (var_exp
                    (identifier))
                  (rel_op)
                  (var_exp
                    (identifier))))))))
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
                (identifier)
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (if_exp
                  (par_exp
                    (bin_exp_object
                      (var_exp
                        (identifier))
                      (rel_op)
                      (var_exp
                        (identifier))))
                  (block_exp
                    (exp_dec
                      (hash_exp
                        (identifier))))
                  (if_exp
                    (par_exp
                      (var_exp
                        (identifier)))
                    (block_exp
                      (exp_dec
                        (hash_exp
                          (identifier))))
                    (block_exp
                      (exp_dec
                        (hash_exp
                          (identifier)))))))))))
      (line_comment)
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
                (if_exp
                  (var_exp
                    (identifier))
                  (lit_exp
                    (text_literal))
                  (lit_exp
                    (text_literal))))))))
      (line_comment)
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
            (obj_dec
              (obj_sort)
              (obj_body
                (dec_field
                  (var_dec
                    (var_pat
                      (identifier))
                    (typ_annot
                      (quest_typ
                        (path_typ
                          (typ_path
                            (type_identifier)))))
                    (quest_exp
                      (lit_exp
                        (bool_literal)))))
                (dec_field
                  (vis)
                  (func_dec
                    (identifier)
                    (tup_pat)
                    (typ_annot
                      (quest_typ
                        (path_typ
                          (typ_path
                            (type_identifier)))))
                    (func_body
                      (block_exp
                        (exp_dec
                          (switch_exp
                            (var_exp
                              (identifier))
                            (case
                              (tup_pat
                                (quest_pat
                                  (lit_pat
                                    (bool_literal))))
                              (block_exp
                                (exp_dec
                                  (assign_exp_object
                                    (var_exp
                                      (identifier))
                                    (quest_exp
                                      (lit_exp
                                        (bool_literal)))))
                                (exp_dec
                                  (quest_exp
                                    (lit_exp
                                      (bool_literal))))))
                            (case
                              (tup_pat
                                (quest_pat
                                  (lit_pat
                                    (bool_literal))))
                              (block_exp
                                (exp_dec
                                  (assign_exp_object
                                    (var_exp
                                      (identifier))
                                    (lit_exp
                                      (null_literal))))
                                (exp_dec
                                  (quest_exp
                                    (lit_exp
                                      (bool_literal))))))
                            (case
                              (lit_pat
                                (null_literal))
                              (block_exp
                                (exp_dec
                                  (lit_exp
                                    (null_literal)))))))))))))))))))
