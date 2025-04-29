=========
refutable-import.mo
=========

import { why = 42 } = "nat-module";

//SKIP run
//SKIP run-ir
//SKIP run-low
//SKIP comp

---

(source_file
  (import
    (obj_pat
      (pat_field
        (identifier)
        (lit_pat
          (int_literal))))
    (text_literal))
  (line_comment)
  (line_comment)
  (line_comment)
  (line_comment))
