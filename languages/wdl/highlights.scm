(version) @keyword

(version
    identifier: (float) @number)

(comment) @comment

(placeholder) @variable
(option_key) @attribute

(string) @string
(simple_string) @string

(identifier) @variable

(struct_field
    name: (identifier) @attribute)

(field_expression
    name: (identifier) @attribute)

(meta_attribute
    name: (identifier) @attribute)

(runtime_attribute
    name: (identifier) @attribute)

(dec_int) @number
(float) @number

(user_type
    name: (identifier) @type)
(file_type) @type.builtin
(int_type) @type.builtin
(float_type) @type.builtin
(string_type) @type.builtin
(object_type) @type.builtin

[
    "Array"
    "Map"
    "Pair"
] @type.builtin

(apply_expression
    name: (identifier) @function.builtin
    (#any-of? @function.builtin
        "floor" "ceil" "round" "min" "max"
        "sub" "basename" "glob" "size" "stdout" "stderr"
        "read_string" "read_int" "read_float" "read_boolean" "read_lines" "write_lines"
        "read_tsv" "write_tsv" "read_map" "write_map" "read_json" "write_json"
        "read_object" "read_objects" "write_object" "write_objects"
        "prefix" "suffix" "quote" "squote" "sep" "length" "range" "transpose" "cross" "zip"
        "unzip" "flatten" "select_first" "select_all" "as_pairs" "as_map" "keys" "collect_by_key"
        "defined"))

[
    "["
    "]"
    "{"
    "}"
    "("
    ")"
] @punctuation.bracket

[
    "."
    ","
    ":"
] @punctuation

[
    "-"
    "!"
    "?"
    "=="
    "!="
    "||"
    "&&"
    "+"
    "*"
    "/"
    "%"
    ">"
    ">="
    "<"
    "<="
    "="
] @operator

[
    "if"
    "then"
    "else"
    "version"
    "import"
    "as"
    "alias"
    "struct"
    "workflow"
    "task"
    "input"
    "output"
    "call"
    "scatter"
    "in"
    "command"
    "runtime"
    "meta"
    "parameter_meta"
] @keyword


