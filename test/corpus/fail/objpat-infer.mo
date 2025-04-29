=========
objpat-infer.mo
=========

import Prim "mo:⛔";

// checks

ignore (switch (object {}) { case {a} 42 });

// checks

for ({} in [object {}].values()) { Prim.debugPrint "hey" };

// infers

func foo({}) : Int = 42;

// infers

shared func baz(a : actor {}) : async Int { 42 };

// call it

ignore (foo({}));
ignore (foo(object {}));
ignore (foo(actor {}));

let a = actor { public func bar({}) : async Nat = async 25 };
ignore (foo a);


ignore (baz({}));
ignore (baz(object {}));
ignore (baz(actor {}));

ignore (a.bar({}));
ignore (a.bar(object {}));
ignore (a.bar(actor {}));

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (line_comment)
  (exp_dec
    (ignore_exp
      (par_exp
        (switch_exp
          (par_exp
            (obj_dec
              (obj_sort)
              (obj_body)))
          (case
            (obj_pat
              (pat_field
                (identifier)))
            (lit_exp
              (int_literal)))))))
  (line_comment)
  (exp_dec
    (for_exp
      (obj_pat)
      (call_exp_object
        (dot_exp_object
          (array_exp
            (obj_dec
              (obj_sort)
              (obj_body)))
          (identifier))
        (par_exp))
      (block_exp
        (exp_dec
          (call_exp_object
            (dot_exp_object
              (var_exp
                (identifier))
              (identifier))
            (lit_exp
              (text_literal)))))))
  (line_comment)
  (func_dec
    (identifier)
    (tup_pat
      (obj_pat))
    (typ_annot
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (lit_exp
        (int_literal))))
  (line_comment)
  (func_dec
    (shared_pat)
    (identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (obj_sort_typ
            (obj_typ)))))
    (typ_annot
      (async_typ
        (path_typ
          (typ_path
            (type_identifier)))))
    (func_body
      (block_exp
        (exp_dec
          (lit_exp
            (int_literal))))))
  (line_comment)
  (exp_dec
    (ignore_exp
      (par_exp
        (call_exp_object
          (var_exp
            (identifier))
          (par_exp
            (object_exp))))))
  (exp_dec
    (ignore_exp
      (par_exp
        (call_exp_object
          (var_exp
            (identifier))
          (par_exp
            (obj_dec
              (obj_sort)
              (obj_body)))))))
  (exp_dec
    (ignore_exp
      (par_exp
        (call_exp_object
          (var_exp
            (identifier))
          (par_exp
            (obj_dec
              (obj_sort)
              (obj_body)))))))
  (let_dec
    (var_pat
      (identifier))
    (obj_dec
      (obj_sort)
      (obj_body
        (dec_field
          (vis)
          (func_dec
            (identifier)
            (tup_pat
              (obj_pat))
            (typ_annot
              (async_typ
                (path_typ
                  (typ_path
                    (type_identifier)))))
            (func_body
              (async_exp
                (lit_exp
                  (int_literal)))))))))
  (exp_dec
    (ignore_exp
      (par_exp
        (call_exp_object
          (var_exp
            (identifier))
          (var_exp
            (identifier))))))
  (exp_dec
    (ignore_exp
      (par_exp
        (call_exp_object
          (var_exp
            (identifier))
          (par_exp
            (object_exp))))))
  (exp_dec
    (ignore_exp
      (par_exp
        (call_exp_object
          (var_exp
            (identifier))
          (par_exp
            (obj_dec
              (obj_sort)
              (obj_body)))))))
  (exp_dec
    (ignore_exp
      (par_exp
        (call_exp_object
          (var_exp
            (identifier))
          (par_exp
            (obj_dec
              (obj_sort)
              (obj_body)))))))
  (exp_dec
    (ignore_exp
      (par_exp
        (call_exp_object
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))
          (par_exp
            (object_exp))))))
  (exp_dec
    (ignore_exp
      (par_exp
        (call_exp_object
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))
          (par_exp
            (obj_dec
              (obj_sort)
              (obj_body)))))))
  (exp_dec
    (ignore_exp
      (par_exp
        (call_exp_object
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))
          (par_exp
            (obj_dec
              (obj_sort)
              (obj_body))))))))
