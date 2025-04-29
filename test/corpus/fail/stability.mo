=========
stability.mo
=========

actor {
   flexible let o = object {
      flexible let x = 1 //reject
   };
   stable type T = Int;  // reject
   flexible type U = Int; // reject
   flexible ignore 666; // reject
   flexible (); // reject

   stable var x : Int = 0; // accept
   stable var y : [var Int] = [var]; // accept
   stable let z = 1; // accept
   stable let z1 : Nat = 1; // accept
   stable let ((z2 : Nat)) = 1; // accept
   stable let (p,q) = (1,2); // reject (for now, maybe forever)
   stable let (r,s) = if true (1,2) else (2,1); // reject forever, I suspect, as RHS non-canonical
   stable let f = func(){}; // reject
   flexible var a : [var Int] = [var]; //accept
   //public stable shared func pub() {}; //what does this even mean, actually? reject?

   var w : Int = 0; // accept as flexible (could warn)
   let u : Int = 0; // ditto

   // reject hash collisions
   stable var foo = ();
   stable var nxnnbkddcv = (); // reject due to collision

   public func pub(){}; // accept as flexible (no warning)
   func priv(){}; // accept as flexible (no warning)
   private func priv1(){}; // accept as flexible (no warning)
   shared func priv2(){}; // accept as flexible (no warning)

   object o1 {}; // accept as flexible (could warn)
   flexible object o2 {}; // accept
   stable object o3 {}; // accept

   object o4 { public func f(){};}; // accept as flexible (could warn)
   flexible object o5 {public func f(){};}; // accept
   stable object o6 {public func f(){};}; // reject

   module m1 {}; // accept as flexible
   flexible module m2 {}; // accept
   stable module m3 {}; // reject

   class C1() {}; // accept as flexible
   flexible class C2(){}; // reject
   stable class C3(){}; // reject

   public shared func pub2(){}; // accept as flexible (no warning)
   stable let wrong = module {}; // reject

}

---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (stab)
        (let_dec
          (var_pat
            (identifier))
          (obj_dec
            (obj_sort)
            (obj_body
              (dec_field
                (stab)
                (let_dec
                  (var_pat
                    (identifier))
                  (lit_exp
                    (int_literal))))
              (line_comment)))))
      (dec_field
        (stab)
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier)))))
      (line_comment)
      (dec_field
        (stab)
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier)))))
      (line_comment)
      (dec_field
        (stab)
        (exp_dec
          (ignore_exp
            (lit_exp
              (int_literal)))))
      (line_comment)
      (dec_field
        (stab)
        (exp_dec
          (par_exp)))
      (line_comment)
      (dec_field
        (stab)
        (var_dec
          (var_pat
            (identifier))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (lit_exp
            (int_literal))))
      (line_comment)
      (dec_field
        (stab)
        (var_dec
          (var_pat
            (identifier))
          (typ_annot
            (array_typ
              (path_typ
                (typ_path
                  (type_identifier)))))
          (array_exp)))
      (line_comment)
      (dec_field
        (stab)
        (let_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))
      (line_comment)
      (dec_field
        (stab)
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (path_typ
                (typ_path
                  (type_identifier)))))
          (lit_exp
            (int_literal))))
      (line_comment)
      (dec_field
        (stab)
        (let_dec
          (tup_pat
            (tup_pat
              (annot_pat
                (var_pat
                  (identifier))
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (lit_exp
            (int_literal))))
      (line_comment)
      (dec_field
        (stab)
        (let_dec
          (tup_pat
            (var_pat
              (identifier))
            (var_pat
              (identifier)))
          (par_exp
            (lit_exp
              (int_literal))
            (lit_exp
              (int_literal)))))
      (line_comment)
      (dec_field
        (stab)
        (let_dec
          (tup_pat
            (var_pat
              (identifier))
            (var_pat
              (identifier)))
          (if_exp
            (lit_exp
              (bool_literal))
            (par_exp
              (lit_exp
                (int_literal))
              (lit_exp
                (int_literal)))
            (par_exp
              (lit_exp
                (int_literal))
              (lit_exp
                (int_literal))))))
      (line_comment)
      (dec_field
        (stab)
        (let_dec
          (var_pat
            (identifier))
          (func_exp
            (tup_pat)
            (func_body
              (block_exp)))))
      (line_comment)
      (dec_field
        (stab)
        (var_dec
          (var_pat
            (identifier))
          (typ_annot
            (array_typ
              (path_typ
                (typ_path
                  (type_identifier)))))
          (array_exp)))
      (line_comment)
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
      (line_comment)
      (dec_field
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (path_typ
                (typ_path
                  (type_identifier)))))
          (lit_exp
            (int_literal))))
      (line_comment)
      (line_comment)
      (dec_field
        (stab)
        (var_dec
          (var_pat
            (identifier))
          (par_exp)))
      (dec_field
        (stab)
        (var_dec
          (var_pat
            (identifier))
          (par_exp)))
      (line_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp))))
      (line_comment)
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp))))
      (line_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp))))
      (line_comment)
      (dec_field
        (func_dec
          (shared_pat)
          (identifier)
          (tup_pat)
          (func_body
            (block_exp))))
      (line_comment)
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body)))
      (line_comment)
      (dec_field
        (stab)
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body)))
      (line_comment)
      (dec_field
        (stab)
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body)))
      (line_comment)
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (vis)
              (func_dec
                (identifier)
                (tup_pat)
                (func_body
                  (block_exp)))))))
      (line_comment)
      (dec_field
        (stab)
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (vis)
              (func_dec
                (identifier)
                (tup_pat)
                (func_body
                  (block_exp)))))))
      (line_comment)
      (dec_field
        (stab)
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (vis)
              (func_dec
                (identifier)
                (tup_pat)
                (func_body
                  (block_exp)))))))
      (line_comment)
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body)))
      (line_comment)
      (dec_field
        (stab)
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body)))
      (line_comment)
      (dec_field
        (stab)
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body)))
      (line_comment)
      (dec_field
        (class_dec
          (type_identifier)
          (tup_pat)
          (class_body
            (obj_body))))
      (line_comment)
      (dec_field
        (stab)
        (class_dec
          (type_identifier)
          (tup_pat)
          (class_body
            (obj_body))))
      (line_comment)
      (dec_field
        (stab)
        (class_dec
          (type_identifier)
          (tup_pat)
          (class_body
            (obj_body))))
      (line_comment)
      (dec_field
        (vis)
        (func_dec
          (shared_pat)
          (identifier)
          (tup_pat)
          (func_body
            (block_exp))))
      (line_comment)
      (dec_field
        (stab)
        (let_dec
          (var_pat
            (identifier))
          (obj_dec
            (obj_sort)
            (obj_body))))
      (line_comment))))
