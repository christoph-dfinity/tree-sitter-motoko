=========
oneways.mo
=========

// check explicit oneway declarations

actor a {

 public func ok1() {};
 public func ok2() = ignore ((async ()) : async ());

 public func wrong1() = ();
 public func wrong2() = ignore async ();
};

shared func ok1() {};
shared func ok2() = ignore ((async ()) : async ()) ;
shared func ok3() = ignore ((async return) : async ()) ;
shared func wrong1() = ();
shared func wrong2() = ignore async ();


---

(source_file
  (line_comment)
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
            (block_exp))))
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (ignore_exp
              (par_exp
                (annot_exp_object
                  (par_exp
                    (async_exp
                      (par_exp)))
                  (async_typ
                    (tup_typ))))))))
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (par_exp))))
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (ignore_exp
              (async_exp
                (par_exp))))))))
  (func_dec
    (shared_pat)
    (identifier)
    (tup_pat)
    (func_body
      (block_exp)))
  (func_dec
    (shared_pat)
    (identifier)
    (tup_pat)
    (func_body
      (ignore_exp
        (par_exp
          (annot_exp_object
            (par_exp
              (async_exp
                (par_exp)))
            (async_typ
              (tup_typ)))))))
  (func_dec
    (shared_pat)
    (identifier)
    (tup_pat)
    (func_body
      (ignore_exp
        (par_exp
          (annot_exp_object
            (par_exp
              (async_exp
                (return_exp)))
            (async_typ
              (tup_typ)))))))
  (func_dec
    (shared_pat)
    (identifier)
    (tup_pat)
    (func_body
      (par_exp)))
  (func_dec
    (shared_pat)
    (identifier)
    (tup_pat)
    (func_body
      (ignore_exp
        (async_exp
          (par_exp))))))
