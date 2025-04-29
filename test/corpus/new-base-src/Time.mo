=========
Time.mo
=========

/// System time utilities and timers.
///
/// The following example illustrates using the system time:
///
/// ```motoko
/// import Int = "mo:base/Int";
/// import Time = "mo:base/Time";
///
/// actor {
///   var lastTime = Time.now();
///   public func greet(name : Text) : async Text {
///     let now = Time.now();
///     let elapsedSeconds = (now - lastTime) / 1000_000_000;
///     lastTime := now;
///     return "Hello, " # name # "!" #
///       " I was last called " # Int.toText(elapsedSeconds) # " seconds ago";
///    };
/// };
/// ```
///
/// Note: If `moc` is invoked with `-no-timer`, the importing will fail.
/// Note: The resolution of the timers is in the order of the block rate,
///       so durations should be chosen well above that. For frequent
///       canister wake-ups the heartbeat mechanism should be considered.

import Types "Types";
import Nat "Nat";
import Prim "mo:⛔";

module {

  /// System time is represent as nanoseconds since 1970-01-01.
  public type Time = Types.Time;

  /// Quantity of time expressed in `#days`, `#hours`, `#minutes`, `#seconds`, `#milliseconds`, or `#nanoseconds`.
  public type Duration = Types.Duration;

  /// Current system time given as nanoseconds since 1970-01-01. The system guarantees that:
  ///
  /// * the time, as observed by the canister smart contract, is monotonically increasing, even across canister upgrades.
  /// * within an invocation of one entry point, the time is constant.
  ///
  /// The system times of different canisters are unrelated, and calls from one canister to another may appear to travel "backwards in time"
  ///
  /// Note: While an implementation will likely try to keep the system time close to the real time, this is not formally guaranteed.
  public let now : () -> Time = func() : Int = Prim.nat64ToNat(Prim.time());

  public type TimerId = Nat;

  public func toNanoseconds(duration : Duration) : Nat {
    switch duration {
      case (#days n) n * 86_400_000_000_000;
      case (#hours n) n * 3_600_000_000_000;
      case (#minutes n) n * 60_000_000_000;
      case (#seconds n) n * 1_000_000_000;
      case (#milliseconds n) n * 1_000_000;
      case (#nanoseconds n) n
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
              (type_identifier)))))
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
                (tup_typ)
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (func_exp
            (tup_pat)
            (typ_annot
              (path_typ
                (typ_path
                  (type_identifier))))
            (func_body
              (call_exp_object
                (dot_exp_object
                  (var_exp
                    (identifier))
                  (identifier))
                (par_exp
                  (call_exp_object
                    (dot_exp_object
                      (var_exp
                        (identifier))
                      (identifier))
                    (par_exp))))))))
      (dec_field
        (vis)
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier)))))
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
                        (identifier)
                        (var_pat
                          (identifier))))
                    (bin_exp_block
                      (var_exp
                        (identifier))
                      (bin_op)
                      (lit_exp
                        (int_literal))))
                  (case
                    (tup_pat
                      (tag_pat
                        (identifier)
                        (var_pat
                          (identifier))))
                    (bin_exp_block
                      (var_exp
                        (identifier))
                      (bin_op)
                      (lit_exp
                        (int_literal))))
                  (case
                    (tup_pat
                      (tag_pat
                        (identifier)
                        (var_pat
                          (identifier))))
                    (bin_exp_block
                      (var_exp
                        (identifier))
                      (bin_op)
                      (lit_exp
                        (int_literal))))
                  (case
                    (tup_pat
                      (tag_pat
                        (identifier)
                        (var_pat
                          (identifier))))
                    (bin_exp_block
                      (var_exp
                        (identifier))
                      (bin_op)
                      (lit_exp
                        (int_literal))))
                  (case
                    (tup_pat
                      (tag_pat
                        (identifier)
                        (var_pat
                          (identifier))))
                    (bin_exp_block
                      (var_exp
                        (identifier))
                      (bin_op)
                      (lit_exp
                        (int_literal))))
                  (case
                    (tup_pat
                      (tag_pat
                        (identifier)
                        (var_pat
                          (identifier))))
                    (var_exp
                      (identifier))))))))))))
