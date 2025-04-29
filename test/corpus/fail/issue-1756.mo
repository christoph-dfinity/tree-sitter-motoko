=========
issue-1756.mo
=========

func C (){};

class C() {

};

---

(source_file
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp)))
  (class_dec
    (type_identifier)
    (tup_pat)
    (class_body
      (obj_body))))
