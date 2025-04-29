=========
FromIters.bench.mo
=========

import Bench "mo:bench";
import Fuzz "mo:fuzz";

import Array "../src/Array";
import Iter "../src/Iter";
import Nat "../src/Nat";
import List "../src/pure/List";
import Runtime "../src/Runtime";

module {
  public func init() : Bench.Bench {
    let bench = Bench.Bench();

    bench.name("Benchmarking the fromIter functions");
    bench.description("Columns describe the number of elements in the input iter.");

    bench.rows([
      "Array.fromIter",
      "List.fromIter",
      "List.fromIter . Iter.reverse"
    ]);
    bench.cols([
      "100",
      "10_000",
      "100_000"
    ]);

    let fuzz = Fuzz.fromSeed(27850937); // fix seed for reproducibility

    func input(n : Nat) : [Nat] = fuzz.array.randomArray(n, fuzz.nat.random);

    let array1 = input(100);
    let array2 = input(10_000);
    let array3 = input(100_000);

    bench.runner(
      func(row, col) {
        let array = switch col {
          case "100" array1;
          case "10_000" array2;
          case "100_000" array3;
          case _ Runtime.unreachable()
        };
        switch row {
          case "List.fromIter" ignore List.fromIter(array.vals());
          case "List.fromIter . Iter.reverse" ignore List.fromIter(Iter.reverse(array.vals()));
          case "Array.fromIter" ignore Array.fromIter(array.vals());
          case _ Runtime.unreachable()
        }
      }
    );

    bench
  }
}

---

(source_file
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
  (import
    (var_pat
      (identifier))
    (text_literal))
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (path_typ
              (typ_path
                (identifier)
                (type_identifier))))
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp)))
              (exp_dec
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (lit_exp
                      (text_literal)))))
              (exp_dec
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (lit_exp
                      (text_literal)))))
              (exp_dec
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (array_exp
                      (lit_exp
                        (text_literal))
                      (lit_exp
                        (text_literal))
                      (lit_exp
                        (text_literal))))))
              (exp_dec
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (array_exp
                      (lit_exp
                        (text_literal))
                      (lit_exp
                        (text_literal))
                      (lit_exp
                        (text_literal))))))
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (lit_exp
                      (int_literal)))))
              (line_comment)
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
                  (array_typ
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (func_body
                  (call_exp_object
                    (dot_exp_object
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))
                      (dot_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (identifier))))))
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp
                    (lit_exp
                      (int_literal)))))
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp
                    (lit_exp
                      (int_literal)))))
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp
                    (lit_exp
                      (int_literal)))))
              (exp_dec
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (func_exp
                      (tup_pat
                        (var_pat
                          (identifier))
                        (var_pat
                          (identifier)))
                      (func_body
                        (block_exp
                          (let_dec
                            (var_pat
                              (identifier))
                            (switch_exp
                              (var_exp
                                (identifier))
                              (case
                                (lit_pat
                                  (text_literal))
                                (var_exp
                                  (identifier)))
                              (case
                                (lit_pat
                                  (text_literal))
                                (var_exp
                                  (identifier)))
                              (case
                                (lit_pat
                                  (text_literal))
                                (var_exp
                                  (identifier)))
                              (case
                                (wild_pat)
                                (call_exp_block
                                  (dot_exp_block
                                    (var_exp
                                      (identifier))
                                    (identifier))
                                  (par_exp)))))
                          (exp_dec
                            (switch_exp
                              (var_exp
                                (identifier))
                              (case
                                (lit_pat
                                  (text_literal))
                                (ignore_exp
                                  (call_exp_block
                                    (dot_exp_block
                                      (var_exp
                                        (identifier))
                                      (identifier))
                                    (par_exp
                                      (call_exp_object
                                        (dot_exp_object
                                          (var_exp
                                            (identifier))
                                          (identifier))
                                        (par_exp))))))
                              (case
                                (lit_pat
                                  (text_literal))
                                (ignore_exp
                                  (call_exp_block
                                    (dot_exp_block
                                      (var_exp
                                        (identifier))
                                      (identifier))
                                    (par_exp
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
                              (case
                                (lit_pat
                                  (text_literal))
                                (ignore_exp
                                  (call_exp_block
                                    (dot_exp_block
                                      (var_exp
                                        (identifier))
                                      (identifier))
                                    (par_exp
                                      (call_exp_object
                                        (dot_exp_object
                                          (var_exp
                                            (identifier))
                                          (identifier))
                                        (par_exp))))))
                              (case
                                (wild_pat)
                                (call_exp_block
                                  (dot_exp_block
                                    (var_exp
                                      (identifier))
                                    (identifier))
                                  (par_exp)))))))))))
              (exp_dec
                (var_exp
                  (identifier))))))))))
