=========
class.mo
=========

// Correct annotations
class B() : {x : Int} = {
  public let x : Nat = 0
};

type T<A, B> = {x : Int; f : A -> B};

class C<A>(y : Nat) : T<A, A> {
  public let x = y;
  public let z = 1;
  public func f(x : A) : A { x };
  public func g() {};
};

let c = C<Bool>(7);
let _ = c.x + c.z;
if (c.f(true)) { c.g() };

class D<A, B>() : C<B> {
  public let x = 0;
  public let z = 1;
  public func f(x : B) : B { x };
  public func g() {};
  public func h(x : A) {};
};


type A = actor {m : () -> ()};

actor class AA() : async A {
  public func m() {};
};


object o { public type T = Nat };
class E() : {a : o.T} = o {
  public let a = 0;
  public type T = Bool;
};


// Incorrect annotations
class D1() : {x : Int} {};
class D2() : {x : Nat} {
  public let x = -3;
};

class D3() : actor {} = {};
actor class D4() : actor {} = {};

object x { public type T = Nat };
class D5(x : {}) : {a : x.T} = {
  public let a = 0;
};

---

(source_file
  (line_comment)
  (class_dec
    (type_identifier)
    (tup_pat)
    (typ_annot
      (obj_typ
        (val_tf
          (identifier)
          (path_typ
            (typ_path
              (type_identifier))))))
    (class_body
      (obj_body
        (dec_field
          (vis)
          (let_dec
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier)))))
            (lit_exp
              (int_literal)))))))
  (typ_dec
    (type_identifier)
    (typ_params
      (typ_bind
        (type_identifier))
      (typ_bind
        (type_identifier)))
    (obj_typ
      (val_tf
        (identifier)
        (path_typ
          (typ_path
            (type_identifier))))
      (val_tf
        (identifier)
        (func_typ
          (path_typ
            (typ_path
              (type_identifier)))
          (path_typ
            (typ_path
              (type_identifier)))))))
  (class_dec
    (type_identifier)
    (typ_params
      (typ_bind
        (type_identifier)))
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
          (type_identifier))
        (path_typ
          (typ_path
            (type_identifier)))
        (path_typ
          (typ_path
            (type_identifier)))))
    (class_body
      (obj_body
        (dec_field
          (vis)
          (let_dec
            (var_pat
              (identifier))
            (var_exp
              (identifier))))
        (dec_field
          (vis)
          (let_dec
            (var_pat
              (identifier))
            (lit_exp
              (int_literal))))
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
                  (var_exp
                    (identifier)))))))
        (dec_field
          (vis)
          (func_dec
            (identifier)
            (tup_pat)
            (func_body
              (block_exp)))))))
  (let_dec
    (var_pat
      (identifier))
    (call_exp_object
      (var_exp
        (identifier))
      (inst
        (path_typ
          (typ_path
            (type_identifier))))
      (par_exp
        (lit_exp
          (int_literal)))))
  (let_dec
    (wild_pat)
    (bin_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (bin_op)
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))))
  (exp_dec
    (if_exp
      (par_exp
        (call_exp_object
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))
          (par_exp
            (lit_exp
              (bool_literal)))))
      (block_exp
        (exp_dec
          (call_exp_object
            (dot_exp_object
              (var_exp
                (identifier))
              (identifier))
            (par_exp))))))
  (class_dec
    (type_identifier)
    (typ_params
      (typ_bind
        (type_identifier))
      (typ_bind
        (type_identifier)))
    (tup_pat)
    (typ_annot
      (path_typ
        (typ_path
          (type_identifier))
        (path_typ
          (typ_path
            (type_identifier)))))
    (class_body
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
              (int_literal))))
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
                  (var_exp
                    (identifier)))))))
        (dec_field
          (vis)
          (func_dec
            (identifier)
            (tup_pat)
            (func_body
              (block_exp))))
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
              (block_exp)))))))
  (typ_dec
    (type_identifier)
    (obj_sort_typ
      (obj_typ
        (val_tf
          (identifier)
          (func_typ
            (tup_typ)
            (tup_typ))))))
  (class_dec
    (obj_sort)
    (type_identifier)
    (tup_pat)
    (typ_annot
      (async_typ
        (path_typ
          (typ_path
            (type_identifier)))))
    (class_body
      (obj_body
        (dec_field
          (vis)
          (func_dec
            (identifier)
            (tup_pat)
            (func_body
              (block_exp)))))))
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (vis)
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier)))))))
  (class_dec
    (type_identifier)
    (tup_pat)
    (typ_annot
      (obj_typ
        (val_tf
          (identifier)
          (path_typ
            (typ_path
              (identifier)
              (type_identifier))))))
    (class_body
      (identifier)
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
          (typ_dec
            (type_identifier)
            (path_typ
              (typ_path
                (type_identifier))))))))
  (line_comment)
  (class_dec
    (type_identifier)
    (tup_pat)
    (typ_annot
      (obj_typ
        (val_tf
          (identifier)
          (path_typ
            (typ_path
              (type_identifier))))))
    (class_body
      (obj_body)))
  (class_dec
    (type_identifier)
    (tup_pat)
    (typ_annot
      (obj_typ
        (val_tf
          (identifier)
          (path_typ
            (typ_path
              (type_identifier))))))
    (class_body
      (obj_body
        (dec_field
          (vis)
          (let_dec
            (var_pat
              (identifier))
            (lit_exp
              (int_literal)))))))
  (class_dec
    (type_identifier)
    (tup_pat)
    (typ_annot
      (obj_sort_typ
        (obj_typ)))
    (class_body
      (obj_body)))
  (class_dec
    (obj_sort)
    (type_identifier)
    (tup_pat)
    (typ_annot
      (obj_sort_typ
        (obj_typ)))
    (class_body
      (obj_body)))
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (vis)
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier)))))))
  (class_dec
    (type_identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (obj_typ))))
    (typ_annot
      (obj_typ
        (val_tf
          (identifier)
          (path_typ
            (typ_path
              (identifier)
              (type_identifier))))))
    (class_body
      (obj_body
        (dec_field
          (vis)
          (let_dec
            (var_pat
              (identifier))
            (lit_exp
              (int_literal))))))))
