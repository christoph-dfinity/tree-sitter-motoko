=========
CertifiedData.mo
=========

/// Certified data.
///
/// The Internet Computer allows canister smart contracts to store a small amount of data during
/// update method processing so that during query call processing, the canister can obtain
/// a certificate about that data.
///
/// This module provides a _low-level_ interface to this API, aimed at advanced
/// users and library implementors. See the Internet Computer Functional
/// Specification and corresponding documentation for how to use this to make query
/// calls to your canister tamperproof.

import Prim "mo:⛔";

module {

  /// Set the certified data.
  ///
  /// Must be called from an update method, else traps.
  /// Must be passed a blob of at most 32 bytes, else traps.
  ///
  /// Example:
  /// ```motoko no-repl
  /// import CertifiedData "mo:base/CertifiedData";
  /// import Blob "mo:base/Blob";
  ///
  /// // Must be in an update call
  ///
  /// let array : [Nat8] = [1, 2, 3];
  /// let blob = Blob.fromArray(array);
  /// CertifiedData.set(blob);
  /// ```
  ///
  /// See a full example on how to use certified variables here: https://github.com/dfinity/examples/tree/master/motoko/cert-var
  ///
  public let set : (data : Blob) -> () = Prim.setCertifiedData;

  /// Gets a certificate
  ///
  /// Returns `null` if no certificate is available, e.g. when processing an
  /// update call or inter-canister call. This returns a non-`null` value only
  /// when processing a query call.
  ///
  /// Example:
  /// ```motoko no-repl
  /// import CertifiedData "mo:base/CertifiedData";
  /// // Must be in a query call
  ///
  /// CertifiedData.getCertificate();
  /// ```
  /// See a full example on how to use certified variables here: https://github.com/dfinity/examples/tree/master/motoko/cert-var
  ///
  public let getCertificate : () -> ?Blob = Prim.getCertificate;

}

---

(source_file
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
                (tup_typ))))
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
                (tup_typ)
                (quest_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier)))))))
