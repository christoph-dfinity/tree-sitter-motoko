=========
Runtime.mo
=========

// Runtime utilities.

import Prim "mo:⛔";

module {

  /// `trap(t)` traps execution with a user-provided diagnostic message.
  ///
  /// The caller of a future whose execution called `trap(t)` will
  /// observe the trap as an `Error` value, thrown at `await`, with code
  /// `#canister_error` and message `m`. Here `m` is a more descriptive `Text`
  /// message derived from the provided `t`. See example for more details.
  ///
  /// NOTE: Other execution environments that cannot handle traps may only
  /// propagate the trap and terminate execution, with or without some
  /// descriptive message.
  ///
  /// ```motoko
  /// import Debug "mo:base/Debug";
  /// import Error "mo:base/Error";
  ///
  /// actor {
  ///   func fail() : async () {
  ///     Debug.trap("user provided error message");
  ///   };
  ///
  ///   public func foo() : async () {
  ///     try {
  ///       await fail();
  ///     } catch e {
  ///       let code = Error.code(e); // evaluates to #canister_error
  ///       let message = Error.message(e); // contains user provided error message
  ///     }
  ///   };
  /// }
  /// ```
  public func trap(errorMessage : Text) : None {
    Prim.trap errorMessage
  };

  public func unreachable() : None {
    trap("Runtime.unreachable()")
  };

}

---

(source_file
  (line_comment)
  (import
    (var_pat
      (identifier))
    (text_literal))
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
      (doc_comment)
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
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (var_exp
                    (identifier))))))))
      (dec_field
        (vis)
        (func_dec
          (identifier)
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
                  (par_exp
                    (lit_exp
                      (text_literal))))))))))))
