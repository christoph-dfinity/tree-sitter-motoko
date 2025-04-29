=========
unused-top-level-identifiers.mo
=========

let unusedVariable = 0;
var unusedVariable2 = 1;

let (unusedVariable3, unusedVariable4) = (1, 2);

func unusedFunction() {

};

object UnusedObject {

};

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (lit_exp
      (int_literal)))
  (var_dec
    (var_pat
      (identifier))
    (lit_exp
      (int_literal)))
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
        (int_literal))))
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp)))
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body)))
