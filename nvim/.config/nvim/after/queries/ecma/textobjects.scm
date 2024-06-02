; extends
; entry => e represents an item in anything that is list like
; array 
(array ((_) @entry.inner ","?) @entry_outer) 

; quotations => q represents anything wrapped in " or ' or `
(string (["'" "\""] . (_) @_start (_)? @_end . ["'" "\""])(#make-range! "custom_quotation.inner" @_start @_end)) @custom_quotation.outer
(template_string ("`" . (_) @_start (_)? @_end . "`")(#make-range! "custom_quotation.inner" @_start @_end)) @custom_quotation.outer
