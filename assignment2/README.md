This doesn't work:
(load-act-r-model "~/Documents/technical/git/rug-architectures-of-intelligence/tutorial/lisp/subitize.lisp")

This works: 
(load-act-r-model "ACT-R:tutorial;lisp;subitize.lisp")

Create hard link for the file:
mv ~/Downloads/ACT-R/tutorial/unit3/subitize-model.lisp ~/Downloads/ACT-R/tutorial/unit3/subitize-model.lisp.old
ln $(pwd)/assignment2/subitize-model.lisp ~/Downloads/ACT-R/tutorial/unit3/subitize-model.lisp  