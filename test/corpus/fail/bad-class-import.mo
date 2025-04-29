=========
bad-class-import.mo
=========

import C "lib/anon_class"; // bad actor class import

actor {
};

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (line_comment)
  (obj_dec
    (obj_sort)
    (obj_body)))
