=========
lib/anon_class.mo
=========

actor class () {}; // import actor class must be named

---

(source_file
  (class_dec
    (obj_sort)
    (tup_pat)
    (class_body
      (obj_body)))
  (line_comment))
