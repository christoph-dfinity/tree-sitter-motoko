=========
ho-variant.mo
=========


type Term = {
 #id : Text;
 #lit : Int;
 #lam : (Text, Term);
 #app : (Term, Term);
 #pair : (Term, Term);
 #fst : Term;
};

type Val = {
 #int : Int;
 #fun : Val -> Val; // no parens required
 #pair : (Val,Val);
 #wrong
};

let p = (1,2);
let a = [0];
let ap = [p];
let x0 = #int 1;
let x1 = #int (p.1);
let x2 = #int (ap[0].1);

let y : Val = #fun (func v = v);
let z = #wrong;

func eval (env : Text -> Val, e:Term) : Val {
 switch e {
   case (#id x) env(x);
   case (#lit i) #int i;
   case (#lam (x,e)) #fun (func v { eval(func y { if (y == x)  v else env y }, e)});
   case (#app (e1, e2)) {
     switch (eval(env,e1), eval (env,e2)) {
       case (#fun f,v) f(v);
       case _ #wrong;
     };
   };
   case (#pair (e1, e2)) #pair (eval(env, e1), eval(env, e2));
   case (#fst e) {
     switch (eval(env, e)) {
       case (#pair (v1,_)) v1;
       case _ #wrong;
     };
   }
 };
};


---

(source_file
  (typ_dec
    (type_identifier)
    (variant_typ
      (typ_tag
        (identifier)
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier)))))
      (typ_tag
        (identifier)
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier)))))
      (typ_tag
        (identifier)
        (typ_annot
          (tup_typ
            (typ_item
              (path_typ
                (typ_path
                  (type_identifier))))
            (typ_item
              (path_typ
                (typ_path
                  (type_identifier)))))))
      (typ_tag
        (identifier)
        (typ_annot
          (tup_typ
            (typ_item
              (path_typ
                (typ_path
                  (type_identifier))))
            (typ_item
              (path_typ
                (typ_path
                  (type_identifier)))))))
      (typ_tag
        (identifier)
        (typ_annot
          (tup_typ
            (typ_item
              (path_typ
                (typ_path
                  (type_identifier))))
            (typ_item
              (path_typ
                (typ_path
                  (type_identifier)))))))
      (typ_tag
        (identifier)
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier)))))))
  (typ_dec
    (type_identifier)
    (variant_typ
      (typ_tag
        (identifier)
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier)))))
      (typ_tag
        (identifier)
        (typ_annot
          (func_typ
            (path_typ
              (typ_path
                (type_identifier)))
            (path_typ
              (typ_path
                (type_identifier))))))
      (line_comment)
      (typ_tag
        (identifier)
        (typ_annot
          (tup_typ
            (typ_item
              (path_typ
                (typ_path
                  (type_identifier))))
            (typ_item
              (path_typ
                (typ_path
                  (type_identifier)))))))
      (typ_tag
        (identifier))))
  (let_dec
    (var_pat
      (identifier))
    (par_exp
      (lit_exp
        (int_literal))
      (lit_exp
        (int_literal))))
  (let_dec
    (var_pat
      (identifier))
    (array_exp
      (lit_exp
        (int_literal))))
  (let_dec
    (var_pat
      (identifier))
    (array_exp
      (var_exp
        (identifier))))
  (let_dec
    (var_pat
      (identifier))
    (hash_exp
      (identifier)
      (lit_exp
        (int_literal))))
  (let_dec
    (var_pat
      (identifier))
    (hash_exp
      (identifier)
      (par_exp
        (proj_exp_object
          (var_exp
            (identifier))
          (int_literal)))))
  (let_dec
    (var_pat
      (identifier))
    (hash_exp
      (identifier)
      (par_exp
        (proj_exp_object
          (array_idx_exp_object
            (var_exp
              (identifier))
            (lit_exp
              (int_literal)))
          (int_literal)))))
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (path_typ
          (typ_path
            (type_identifier)))))
    (hash_exp
      (identifier)
      (par_exp
        (func_exp
          (var_pat
            (identifier))
          (func_body
            (var_exp
              (identifier)))))))
  (let_dec
    (var_pat
      (identifier))
    (hash_exp
      (identifier)))
  (func_dec
    (identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (func_typ
            (path_typ
              (typ_path
                (type_identifier)))
            (path_typ
              (typ_path
                (type_identifier))))))
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
              (call_exp_block
                (var_exp
                  (identifier))
                (par_exp
                  (var_exp
                    (identifier)))))
            (case
              (tup_pat
                (tag_pat
                  (identifier)
                  (var_pat
                    (identifier))))
              (hash_exp
                (identifier)
                (var_exp
                  (identifier))))
            (case
              (tup_pat
                (tag_pat
                  (identifier)
                  (tup_pat
                    (var_pat
                      (identifier))
                    (var_pat
                      (identifier)))))
              (hash_exp
                (identifier)
                (par_exp
                  (func_exp
                    (var_pat
                      (identifier))
                    (func_body
                      (block_exp
                        (exp_dec
                          (call_exp_object
                            (var_exp
                              (identifier))
                            (par_exp
                              (func_exp
                                (var_pat
                                  (identifier))
                                (func_body
                                  (block_exp
                                    (exp_dec
                                      (if_exp
                                        (par_exp
                                          (bin_exp_object
                                            (var_exp
                                              (identifier))
                                            (rel_op)
                                            (var_exp
                                              (identifier))))
                                        (var_exp
                                          (identifier))
                                        (call_exp_block
                                          (var_exp
                                            (identifier))
                                          (var_exp
                                            (identifier))))))))
                              (var_exp
                                (identifier)))))))))))
            (case
              (tup_pat
                (tag_pat
                  (identifier)
                  (tup_pat
                    (var_pat
                      (identifier))
                    (var_pat
                      (identifier)))))
              (block_exp
                (exp_dec
                  (switch_exp
                    (par_exp
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (par_exp
                          (var_exp
                            (identifier))
                          (var_exp
                            (identifier))))
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (par_exp
                          (var_exp
                            (identifier))
                          (var_exp
                            (identifier)))))
                    (case
                      (tup_pat
                        (tag_pat
                          (identifier)
                          (var_pat
                            (identifier)))
                        (var_pat
                          (identifier)))
                      (call_exp_block
                        (var_exp
                          (identifier))
                        (par_exp
                          (var_exp
                            (identifier)))))
                    (case
                      (wild_pat)
                      (hash_exp
                        (identifier)))))))
            (case
              (tup_pat
                (tag_pat
                  (identifier)
                  (tup_pat
                    (var_pat
                      (identifier))
                    (var_pat
                      (identifier)))))
              (hash_exp
                (identifier)
                (par_exp
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))
                      (var_exp
                        (identifier))))
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))
                      (var_exp
                        (identifier)))))))
            (case
              (tup_pat
                (tag_pat
                  (identifier)
                  (var_pat
                    (identifier))))
              (block_exp
                (exp_dec
                  (switch_exp
                    (par_exp
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (par_exp
                          (var_exp
                            (identifier))
                          (var_exp
                            (identifier)))))
                    (case
                      (tup_pat
                        (tag_pat
                          (identifier)
                          (tup_pat
                            (var_pat
                              (identifier))
                            (wild_pat))))
                      (var_exp
                        (identifier)))
                    (case
                      (wild_pat)
                      (hash_exp
                        (identifier)))))))))))))
