=========
Debug.mo
=========

/// Utility functions for debugging.
///
/// Import from the base library to use this module.
/// ```motoko name=import
/// import Debug "mo:base/Debug";
/// ```

import Prim "mo:⛔";
import Runtime "Runtime";

module {

  /// Prints `text` to output stream.
  ///
  /// NOTE: When running on an ICP network, all output is written to the [canister log](https://internetcomputer.org/docs/current/developer-docs/smart-contracts/maintain/logs) with the exclusion of any output
  /// produced during the execution of non-replicated queries and composite queries.
  /// In other environments, like the interpreter and stand-alone wasm engines, the output is written to standard out.
  ///
  /// ```motoko include=import
  /// Debug.print "Hello New World!";
  /// Debug.print(debug_show(4)) // Often used with `debug_show` to convert values to Text
  /// ```
  public func print(text : Text) {
    Prim.debugPrint text
  };

  /// Not yet implemented
  ///
  /// Mark incomplete code with the `todo()` function.
  ///
  /// Each have calls are well-typed in all typing contexts, which
  /// trap in all execution contexts.
  public func todo() : None {
    Runtime.trap("Debug.todo()")
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
          (tup_pat)
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
                  (par_exp
                    (lit_exp
                      (text_literal))))))))))))
