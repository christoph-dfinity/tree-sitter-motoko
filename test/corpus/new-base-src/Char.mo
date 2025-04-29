=========
Char.mo
=========

/// Utilities for `Char` (character)

import Prim "mo:⛔";
import Order "Order";

module {

  /// Characters represented as Unicode code points.
  public type Char = Prim.Types.Char;

  /// Convert character `char` to a word containing its Unicode scalar value.
  public let toNat32 : (char : Char) -> Nat32 = Prim.charToNat32;

  /// Convert `w` to a character.
  /// Traps if `w` is not a valid Unicode scalar value.
  /// Value `w` is valid if, and only if, `w < 0xD800 or (0xE000 <= w and w <= 0x10FFFF)`.
  public let fromNat32 : (nat32 : Nat32) -> Char = Prim.nat32ToChar;

  /// Convert character `char` to single character text.
  public let toText : (char : Char) -> Text = Prim.charToText;

  // Not exposed pending multi-char implementation.
  private let _toUpper : (char : Char) -> Char = Prim.charToUpper;

  // Not exposed pending multi-char implementation.
  private let _toLower : (char : Char) -> Char = Prim.charToLower;

  /// Returns `true` when `char` is a decimal digit between `0` and `9`, otherwise `false`.
  public func isDigit(char : Char) : Bool {
    Prim.charToNat32(char) -% Prim.charToNat32('0') <= (9 : Nat32)
  };

  /// Returns whether `char` is a whitespace character.
  public let isWhitespace : (char : Char) -> Bool = Prim.charIsWhitespace;

  /// Returns whether `char` is a lowercase character.
  public let isLower : (char : Char) -> Bool = Prim.charIsLowercase;

  /// Returns whether `char` is an uppercase character.
  public let isUpper : (char : Char) -> Bool = Prim.charIsUppercase;

  /// Returns whether `char` is an alphanumeric character.
  public let isAlphabetic : (char : Char) -> Bool = Prim.charIsAlphabetic;

  /// Returns `a == b`.
  public func equal(a : Char, b : Char) : Bool { a == b };

  /// Returns `a != b`.
  public func notEqual(a : Char, b : Char) : Bool { a != b };

  /// Returns `a < b`.
  public func less(a : Char, b : Char) : Bool { a < b };

  /// Returns `a <= b`.
  public func lessOrEqual(a : Char, b : Char) : Bool { a <= b };

  /// Returns `a > b`.
  public func greater(a : Char, b : Char) : Bool { a > b };

  /// Returns `a >= b`.
  public func greaterOrEqual(a : Char, b : Char) : Bool { a >= b };

  /// Returns the order of `a` and `b`.
  public func compare(a : Char, b : Char) : Order.Order {
    if (a < b) { #less } else if (a == b) { #equal } else { #greater }
  };

}

---

(source_file
  (doc_comment)
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
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (func_typ
                (tup_typ
                  (typ_item
                    (identifier)
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (func_typ
                (tup_typ
                  (typ_item
                    (identifier)
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
      (doc_comment)
      (dec_field
        (vis)
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (func_typ
                (tup_typ
                  (typ_item
                    (identifier)
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
      (line_comment)
      (dec_field
        (vis)
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (func_typ
                (tup_typ
                  (typ_item
                    (identifier)
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
      (line_comment)
      (dec_field
        (vis)
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (func_typ
                (tup_typ
                  (typ_item
                    (identifier)
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
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
                (bin_exp_object
                  (bin_exp_object
                    (call_exp_object
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))
                      (par_exp
                        (var_exp
                          (identifier))))
                    (bin_op)
                    (call_exp_object
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))
                      (par_exp
                        (lit_exp
                          (char_literal)))))
                  (rel_op)
                  (par_exp
                    (annot_exp_object
                      (lit_exp
                        (int_literal))
                      (path_typ
                        (typ_path
                          (type_identifier)))))))))))
      (doc_comment)
      (dec_field
        (vis)
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (func_typ
                (tup_typ
                  (typ_item
                    (identifier)
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
      (doc_comment)
      (dec_field
        (vis)
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (func_typ
                (tup_typ
                  (typ_item
                    (identifier)
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
      (doc_comment)
      (dec_field
        (vis)
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (func_typ
                (tup_typ
                  (typ_item
                    (identifier)
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
      (doc_comment)
      (dec_field
        (vis)
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (func_typ
                (tup_typ
                  (typ_item
                    (identifier)
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
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
                    (block_exp
                      (exp_dec
                        (hash_exp
                          (identifier))))))))))))))
