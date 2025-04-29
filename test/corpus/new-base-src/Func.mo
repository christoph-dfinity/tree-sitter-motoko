=========
Func.mo
=========

/// Functions on functions, creating functions from simpler inputs.
///
/// (Most commonly used when programming in functional style using higher-order
/// functions.)

module {
  /// Import from the base library to use this module.
  ///
  /// ```motoko name=import
  /// import { compose; const; identity } = "mo:base/Func";
  /// import Text = "mo:base/Text";
  /// import Char = "mo:base/Char";
  /// ```

  /// The composition of two functions `f` and `g` is a function that applies `g` and then `f`.
  ///
  /// Example:
  /// ```motoko include=import
  /// let textFromNat32 = compose(Text.fromChar, Char.fromNat32);
  /// assert textFromNat32(65) == "A";
  /// ```
  public func compose<A, B, C>(f : B -> C, g : A -> B) : A -> C {
    func(x : A) : C {
      f(g(x))
    }
  };

  /// The `identity` function returns its argument.
  /// Example:
  /// ```motoko include=import
  /// assert identity(10) == 10;
  /// assert identity(true) == true;
  /// ```
  public func identity<A>(x : A) : A = x;

  /// The const function is a _curried_ function that accepts an argument `x`,
  /// and then returns a function that discards its argument and always returns
  /// the `x`.
  ///
  /// Example:
  /// ```motoko include=import
  /// assert const<Nat, Text>(10)("hello") == 10;
  /// assert const(true)(20) == true;
  /// ```
  public func const<A, B>(x : A) : B -> A = func _ = x
}

---

(source_file
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (obj_dec
    (obj_sort)
    (obj_body
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier))
            (typ_bind
              (type_identifier))
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (func_typ
              (path_typ
                (typ_path
                  (type_identifier)))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (exp_dec
                (func_exp
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
                        (call_exp_object
                          (var_exp
                            (identifier))
                          (par_exp
                            (call_exp_object
                              (var_exp
                                (identifier))
                              (par_exp
                                (var_exp
                                  (identifier)))))))))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
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
            (var_exp
              (identifier)))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier))
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (typ_annot
            (func_typ
              (path_typ
                (typ_path
                  (type_identifier)))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (func_exp
              (wild_pat)
              (func_body
                (var_exp
                  (identifier))))))))))
