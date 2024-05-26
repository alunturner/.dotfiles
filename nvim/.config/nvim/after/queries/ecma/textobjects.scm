(expression_statement
  [(object (_) @entry.outer) (array (_) @entry.outer)])

(variable_declarator
  name: (_)
  value: ([(array (_) @entry.inner) (object (_) @entry.inner)]))
