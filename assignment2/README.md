This doesn't work:
(load-act-r-model "~/Documents/technical/git/rug-architectures-of-intelligence/tutorial/lisp/subitize.lisp")

This works: 
(load-act-r-model "ACT-R:tutorial;lisp;subitize.lisp")

Create hard link for the file:
ln $(pwd)/assignment2/subitize.lisp ~/Downloads/linux_standalone/ACT-R/tutorial/unit3/subitize-model.lisp  