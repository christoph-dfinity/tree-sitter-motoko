=========
internal/PRNG.mo
=========

/// Collection of pseudo-random number generators
///
/// The algorithms deliver deterministic statistical randomness,
/// not cryptographic randomness.
///
/// Algorithm 1: 128-bit Seiran PRNG
/// See: https://github.com/andanteyk/prng-seiran
///
/// Algorithm 2: SFC64 and SFC32 (Chris Doty-Humphrey’s Small Fast Chaotic PRNG)
/// See: https://numpy.org/doc/stable/reference/random/bit_generators/sfc64.html
///
/// Copyright: 2023 MR Research AG
/// Main author: react0r-com
/// Contributors: Timo Hanke (timohanke)
import Nat "../Nat";

module {
  /// Constructs an SFC 64-bit generator.
  /// The recommended constructor arguments are: 24, 11, 3.
  ///
  /// Example:
  /// ```motoko
  /// import Prng "mo:prng";
  /// let rng = Prng.SFC64(24, 11, 3);
  /// ```
  /// For convenience, the function `SFC64a()` returns a generator constructed
  /// with the recommended parameter set (24, 11, 3).
  public class SFC64(p : Nat64, q : Nat64, r : Nat64) {
    // state
    var a : Nat64 = 0;
    var b : Nat64 = 0;
    var c : Nat64 = 0;
    var d : Nat64 = 0;

    /// Initializes the PRNG state with a particular seed
    ///
    /// Example:
    /// ```motoko
    public func init(seed : Nat64) = init3(seed, seed, seed);

    /// Initializes the PRNG state with a hardcoded seed.
    /// No argument is required.
    ///
    /// Example:
    public func initPre() = init(0xcafef00dbeef5eed);

    /// Initializes the PRNG state with three state variables
    ///
    /// Example:
    public func init3(seed1 : Nat64, seed2 : Nat64, seed3 : Nat64) {
      a := seed1;
      b := seed2;
      c := seed3;
      d := 1;

      for (_ in Nat.range(0, 11)) ignore next()
    };

    /// Returns one output and advances the PRNG's state
    ///
    /// Example:
    public func next() : Nat64 {
      let tmp = a +% b +% d;
      a := b ^ (b >> q);
      b := c +% (c << r);
      c := (c <<> p) +% tmp;
      d +%= 1;
      tmp
    }
  };

  /// SFC64a is the same as numpy.
  /// See: [sfc64_next()](https:///github.com/numpy/numpy/blob/b6d372c25fab5033b828dd9de551eb0b7fa55800/numpy/random/src/sfc64/sfc64.h#L28)
  public func sfc64a() : SFC64 { SFC64(24, 11, 3) }
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
      (dec_field
        (vis)
        (class_dec
          (type_identifier)
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
                    (type_identifier)))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (class_body
            (obj_body
              (line_comment)
              (dec_field
                (var_dec
                  (var_pat
                    (identifier))
                  (typ_annot
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (lit_exp
                    (int_literal))))
              (dec_field
                (var_dec
                  (var_pat
                    (identifier))
                  (typ_annot
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (lit_exp
                    (int_literal))))
              (dec_field
                (var_dec
                  (var_pat
                    (identifier))
                  (typ_annot
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (lit_exp
                    (int_literal))))
              (dec_field
                (var_dec
                  (var_pat
                    (identifier))
                  (typ_annot
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (lit_exp
                    (int_literal))))
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
                    (call_exp_object
                      (var_exp
                        (identifier))
                      (par_exp
                        (var_exp
                          (identifier))
                        (var_exp
                          (identifier))
                        (var_exp
                          (identifier)))))))
              (doc_comment)
              (doc_comment)
              (doc_comment)
              (doc_comment)
              (dec_field
                (vis)
                (func_dec
                  (identifier)
                  (tup_pat)
                  (func_body
                    (call_exp_object
                      (var_exp
                        (identifier))
                      (par_exp
                        (lit_exp
                          (hex_literal)))))))
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
                            (type_identifier)))))
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
                  (func_body
                    (block_exp
                      (exp_dec
                        (assign_exp_object
                          (var_exp
                            (identifier))
                          (var_exp
                            (identifier))))
                      (exp_dec
                        (assign_exp_object
                          (var_exp
                            (identifier))
                          (var_exp
                            (identifier))))
                      (exp_dec
                        (assign_exp_object
                          (var_exp
                            (identifier))
                          (var_exp
                            (identifier))))
                      (exp_dec
                        (assign_exp_object
                          (var_exp
                            (identifier))
                          (lit_exp
                            (int_literal))))
                      (exp_dec
                        (for_exp
                          (wild_pat)
                          (call_exp_object
                            (dot_exp_object
                              (var_exp
                                (identifier))
                              (identifier))
                            (par_exp
                              (lit_exp
                                (int_literal))
                              (lit_exp
                                (int_literal))))
                          (ignore_exp
                            (call_exp_block
                              (var_exp
                                (identifier))
                              (par_exp)))))))))
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
                      (let_dec
                        (var_pat
                          (identifier))
                        (bin_exp_object
                          (bin_exp_object
                            (var_exp
                              (identifier))
                            (bin_op)
                            (var_exp
                              (identifier)))
                          (bin_op)
                          (var_exp
                            (identifier))))
                      (exp_dec
                        (assign_exp_object
                          (var_exp
                            (identifier))
                          (bin_exp_object
                            (var_exp
                              (identifier))
                            (bin_op)
                            (par_exp
                              (bin_exp_object
                                (var_exp
                                  (identifier))
                                (rel_op)
                                (var_exp
                                  (identifier)))))))
                      (exp_dec
                        (assign_exp_object
                          (var_exp
                            (identifier))
                          (bin_exp_object
                            (var_exp
                              (identifier))
                            (bin_op)
                            (par_exp
                              (bin_exp_object
                                (var_exp
                                  (identifier))
                                (rel_op)
                                (var_exp
                                  (identifier)))))))
                      (exp_dec
                        (assign_exp_object
                          (var_exp
                            (identifier))
                          (bin_exp_object
                            (par_exp
                              (bin_exp_object
                                (var_exp
                                  (identifier))
                                (rel_op)
                                (var_exp
                                  (identifier))))
                            (bin_op)
                            (var_exp
                              (identifier)))))
                      (exp_dec
                        (binassign_exp_object
                          (var_exp
                            (identifier))
                          (binassign_op)
                          (lit_exp
                            (int_literal))))
                      (exp_dec
                        (var_exp
                          (identifier)))))))))))
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
                  (var_exp
                    (identifier))
                  (par_exp
                    (lit_exp
                      (int_literal))
                    (lit_exp
                      (int_literal))
                    (lit_exp
                      (int_literal))))))))))))
