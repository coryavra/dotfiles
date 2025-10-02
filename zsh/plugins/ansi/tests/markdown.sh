#!/bin/zsh

lab_print_h2 "Markdown"
lab_print_body "Demonstration of the markdown-style print messages available in the lab"
lab_print_body "Includes headers and inline styles"

lab_print_hr

lab_print_h1 "Markdown H1 test"
lab_print_body "lorem ipsum dolor sit amet"

lab_print_h2 "Markdown H2 test"
lab_print_body "lorem ipsum dolor sit amet"

lab_print_h3 "Markdown H3 test"
lab_print_body "lorem ipsum dolor sit amet"

lab_print_h4 "Markdown H4 test"
lab_print_body "lorem ipsum dolor sit amet"

lab_print_h5 "Markdown H5 test"
lab_print_body "lorem ipsum dolor sit amet"

lab_print_h6 "Markdown H6 test"
lab_print_body "lorem ipsum dolor sit amet"

printf "\n"
lab_print_body "This is markdown body text, and here is text that is styled to look like a link (right-click > Open Link): $(lab_print_link 'https://www.google.com')"

lab_print_body "Here is some code $(lab_print_code 'echo "Hello, World"') interjected in the middle of a line"

lab_print_body "Here is a list of options:"
printf "\n"

lab_print_list_item "This is the first list item"
lab_print_list_item "This is the second list item"
lab_print_list_item "This is the third list item"

lab_print_hr