=========
pat-inconsistent.mo
=========

// Okay joins
/*let _ = func(1 or 2) {};
let _ = func(1 or -1) {};
let _ = func(1 or (_ : Int)) {};
let _ = func((1 : Int) or 2) {};
let _ = func({a = _ : Int} or {a = _ : Nat}) {};
let _ = func((_ : Int -> Int) or (_ : Nat -> Nat)) {};
let _ = func((-1, 2) or (2, -1)) {};
let _ = func(#A or #A) {};
let _ = func(#A or #A()) {};
let _ = func(#A or #A(_ : ())) {};
let _ = func(#A(5) or #A(_ : Int)) {};
let _ = func(#A or #B(_ : Nat)) {};

// Bogus joins
do { let _ = func(1 or 1.0) {} };
do { let _ = func(1 or "") {} };
do { let _ = func(true or "") {} };
do { let _ = func(1 or ()) {} };
do { let _ = func(1 or {}) {} };
do { let _ = func(1 or (_ : Text)) {} };
do { let _ = func({a = _ : Int} or {b = _ : Nat}) {} };
do { let _ = func((_ : Int8) or (_ : Nat8)) {} };
do { let _ = func(("", 1) or ("", 1.0)) {} };
do { let _ = func((_ : Int16, "") or (_ : Nat16, "")) {} };
do { let _ = func(#A or #A("")) {}; };
do { let _ = func(#A(0) or #A("")) {}; };

do { let _ = func(1 or (_ : Any)) {} };
do { let _ = func((_ : Any) or 1.4) {} };
do { let _ = func(() or (_ : Any)) {} };
do { let _ = func<A>("" or (_ : A)) {} };
do { let _ = func((_ : Any) or (_ : [Nat])) {} };
do { let _ = func((_ : Any) or (_ : () -> ())) {} };
do { let _ = func(("", 1) or ("", _ : Any)) {} };
do { let _ = func(#A or #A(_ : Any)) {}; };
do { let _ = func(#A(5) or #A(_ : Any)) {}; };*/

// No coverage check for ill-typed cases
switch (#A : {#A}) {
  case (#A) {};
  case ({B = _}) {};
  case _ {};
  case _ {};
};

switch (true : Bool) {
  case true {};
  case 1 {};
  case false {};
};

switch (true : Bool) {
  case (#geese) {};
};

// Coverage check for disjoint variants
switch (#sparrows : { #sparrows }) {
  case (#geese) {};
};

func absurd(birds : {#}) =
  switch birds {
    case (#geese) {};
  };

---

(source_file
  (line_comment)
  (block_comment
    (comment_text
      (line_comment)))
  (line_comment)
  (exp_dec
    (switch_exp
      (par_exp
        (annot_exp_object
          (hash_exp
            (identifier))
          (variant_typ
            (typ_tag
              (identifier)))))
      (case
        (tup_pat
          (tag_pat
            (identifier)))
        (block_exp))
      (case
        (tup_pat
          (obj_pat
            (pat_field
              (identifier)
              (wild_pat))))
        (block_exp))
      (case
        (wild_pat)
        (block_exp))
      (case
        (wild_pat)
        (block_exp))))
  (exp_dec
    (switch_exp
      (par_exp
        (annot_exp_object
          (lit_exp
            (bool_literal))
          (path_typ
            (typ_path
              (type_identifier)))))
      (case
        (lit_pat
          (bool_literal))
        (block_exp))
      (case
        (lit_pat
          (int_literal))
        (block_exp))
      (case
        (lit_pat
          (bool_literal))
        (block_exp))))
  (exp_dec
    (switch_exp
      (par_exp
        (annot_exp_object
          (lit_exp
            (bool_literal))
          (path_typ
            (typ_path
              (type_identifier)))))
      (case
        (tup_pat
          (tag_pat
            (identifier)))
        (block_exp))))
  (line_comment)
  (exp_dec
    (switch_exp
      (par_exp
        (annot_exp_object
          (hash_exp
            (identifier))
          (variant_typ
            (typ_tag
              (identifier)))))
      (case
        (tup_pat
          (tag_pat
            (identifier)))
        (block_exp))))
  (func_dec
    (identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (variant_typ))))
    (func_body
      (switch_exp
        (var_exp
          (identifier))
        (case
          (tup_pat
            (tag_pat
              (identifier)))
          (block_exp))))))
