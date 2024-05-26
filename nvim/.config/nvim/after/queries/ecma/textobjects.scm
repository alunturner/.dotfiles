; extends

; entry
(array (_) @entry.outer)
(object (pair
    key: (_) @entry.lhs
    value: (_) @entry.rhs) @entry.outer)

; string
(string (_) @string.inner) @string.outer
(template_string (_) @string.inner) @string.outer
