=========
unused.mo
=========

//MOC-FLAG --package pkg pkg
import _Unused1 "mo:pkg/unused1"; // don't report package imports usage warning
import _Unused2 "./pkg/unused2"; // do report relative imports usage warning

func rec1() { rec1() }; // accepted, but reject as unused?

func rec() { }; //reject ok

do {let unused = 1 };

func g(x : ()) {};

//let unused = 1;
let _ok = 1;
let hmm = _ok; // should we warn about the use of a silenced identifier? OCaml doens't actually, so perhaps not

do { func f() { g() ; }; //both f and g are only used recursively accept or reject?
     func g() { f() };
};

// switches
switch (?1) {
  case (?u) {}; //unused u
  case o {}; //unused 0
};

// types

do { type Unused = Int; }; // do we want to warn?


let r = object {private let f = 0; public let x = 0};

---

(source_file
  (line_comment)
  (import
    (var_pat
      (identifier))
    (text_literal))
  (line_comment)
  (import
    (var_pat
      (identifier))
    (text_literal))
  (line_comment)
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (exp_dec
          (call_exp_object
            (var_exp
              (identifier))
            (par_exp))))))
  (line_comment)
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp)))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))))
  (func_dec
    (identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (tup_typ))))
    (func_body
      (block_exp)))
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (lit_exp
      (int_literal)))
  (let_dec
    (var_pat
      (identifier))
    (var_exp
      (identifier)))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp
              (exp_dec
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp))))))
        (line_comment)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp
              (exp_dec
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp)))))))))
  (line_comment)
  (exp_dec
    (switch_exp
      (par_exp
        (quest_exp
          (lit_exp
            (int_literal))))
      (case
        (tup_pat
          (quest_pat
            (var_pat
              (identifier))))
        (block_exp))
      (line_comment)
      (case
        (var_pat
          (identifier))
        (block_exp))
      (line_comment)))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier)))))))
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (obj_dec
      (obj_sort)
      (obj_body
        (dec_field
          (vis)
          (let_dec
            (var_pat
              (identifier))
            (lit_exp
              (int_literal))))
        (dec_field
          (vis)
          (let_dec
            (var_pat
              (identifier))
            (lit_exp
              (int_literal))))))))
