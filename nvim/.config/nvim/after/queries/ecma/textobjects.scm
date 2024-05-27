; extends
; entry
(array (_) @entry.inner ","? @_end (#make-range! "entry.outer" @entry.inner @_end))
(object (_) @entry.inner ","? @_end (#make-range! "entry.outer" @entry.inner @_end))

; string
(string (_) @string.inner) @string.outer
(template_string (_) @string.inner) @string.outer
