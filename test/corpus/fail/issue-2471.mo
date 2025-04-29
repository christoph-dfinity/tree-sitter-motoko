=========
issue-2471.mo
=========

import Self "../fail/issue-2471";

module {}

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (obj_dec
    (obj_sort)
    (obj_body)))
