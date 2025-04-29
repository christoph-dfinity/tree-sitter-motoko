=========
bad-import.mo
=========

import C "lib/actor"; // bad actor import

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
