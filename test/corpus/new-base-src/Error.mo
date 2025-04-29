=========
Error.mo
=========

/// Error values and inspection.
///
/// The `Error` type is the argument to `throw`, parameter of `catch`.
/// The `Error` type is opaque.

import Prim "mo:⛔";

module {

  /// Error value resulting from  `async` computations
  public type Error = Prim.Types.Error;

  /// Error code to classify different kinds of user and system errors:
  /// ```motoko
  /// type ErrorCode = {
  ///   // Fatal error.
  ///   #system_fatal;
  ///   // Transient error.
  ///   #system_transient;
  ///   // Response unknown due to missed deadline.
  ///   #system_unknown;
  ///   // Destination invalid.
  ///   #destination_invalid;
  ///   // Explicit reject by canister code.
  ///   #canister_reject;
  ///   // Canister trapped.
  ///   #canister_error;
  ///   // Future error code (with unrecognized numeric code).
  ///   #future : Nat32;
  ///   // Error issuing inter-canister call
  ///   // (indicating destination queue full or freezing threshold crossed).
  ///   #call_error : { err_code :  Nat32 }
  /// };
  /// ```
  public type ErrorCode = Prim.ErrorCode;

  /// Create an error from the message with the code `#canister_reject`.
  ///
  /// Example:
  /// ```motoko
  /// import Error "mo:base/Error";
  ///
  /// Error.reject("Example error") // can be used as throw argument
  /// ```
  public let reject : (message : Text) -> Error = Prim.error;

  /// Returns the code of an error.
  ///
  /// Example:
  /// ```motoko
  /// import Error "mo:base/Error";
  ///
  /// let error = Error.reject("Example error");
  /// Error.code(error) // #canister_reject
  /// ```
  public let code : (error : Error) -> ErrorCode = Prim.errorCode;

  /// Returns the message of an error.
  ///
  /// Example:
  /// ```motoko
  /// import Error "mo:base/Error";
  ///
  /// let error = Error.reject("Example error");
  /// Error.message(error) // "Example error"
  /// ```
  public let message : (error : Error) -> Text = Prim.errorMessage;

  /// Returns whether retrying to send a message may result in success.
  ///
  /// Example:
  /// ```motoko
  /// import { message; isRetryPossible } "mo:base/Error";
  /// import { print } "mo:base/Debug";
  ///
  /// try await (with timeout = 3) Actor.call(arg)
  /// catch e { if (isRetryPossible e) print(message e) }
  /// ```
  public func isRetryPossible(error : Error) : Bool = switch (code error) {
    case (#system_unknown or #system_transient) true;
    case _ false
  };

}

---

(source_file
  (doc_comment)
  (doc_comment)
  (doc_comment)
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
              (identifier)
              (type_identifier)))))
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
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (identifier)
              (type_identifier)))))
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
      (doc_comment)
      (doc_comment)
      (doc_comment)
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
            (switch_exp
              (par_exp
                (call_exp_object
                  (var_exp
                    (identifier))
                  (var_exp
                    (identifier))))
              (case
                (tup_pat
                  (alt_pat
                    (tag_pat
                      (identifier))
                    (tag_pat
                      (identifier))))
                (lit_exp
                  (bool_literal)))
              (case
                (wild_pat)
                (lit_exp
                  (bool_literal))))))))))
