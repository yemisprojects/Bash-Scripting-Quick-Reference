#Source: When to wrap quotes around a shell variable? (https://stackoverflow.com/questions/10067266/when-to-wrap-quotes-around-a-shell-variable)
Here is a three-point formula for quotes in general:

Double quotes
In contexts where we want to suppress word splitting and globbing. Also in contexts where we want the literal to be treated as a string, not a regex.

Single quotes
In string literals where we want to suppress interpolation and special treatment of backslashes. In other words, situations where using double quotes would be inappropriate.

No quotes
In contexts where we are absolutely sure that there are no word splitting or globbing issues or we do want word splitting and globbing.

Examples
=============
**Double quotes**
literal strings with whitespace ("StackOverflow rocks!", "Steve's Apple")
variable expansions ("$var", "${arr[@]}")
command substitutions ("$(ls)", "`ls`")
globs where directory path or file name part includes spaces ("/my dir/"*)
to protect single quotes ("single'quote'delimited'string")
Bash parameter expansion ("${filename##*/}")

**Single quotes**
command names and arguments that have whitespace in them
literal strings that need interpolation to be suppressed ( 'Really costs $$!', 'just a backslash followed by a t: \t')
to protect double quotes ('The "crux"')
regex literals that need interpolation to be suppressed
use shell quoting for literals involving special characters ($'\n\t')
use shell quoting where we need to protect several single and double quotes ($'{"table": "users", "where": "first_name"=\'Steve\'}')

**No quotes**
around standard numeric variables ($$, $?, $# etc.)
in arithmetic contexts like ((count++)), "${arr[idx]}", "${string:start:length}"
inside [[ ]] expression which is free from word splitting and globbing issues (this is a matter of style and opinions can vary widely)
where we want word splitting (for word in $words)
where we want globbing (for txtfile in *.txt; do ...)
where we want ~ to be interpreted as $HOME (~/"some dir" but not "~/some dir")
