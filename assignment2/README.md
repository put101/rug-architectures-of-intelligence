This doesn't work:
(load-act-r-model "~/Documents/technical/git/rug-architectures-of-intelligence/tutorial/lisp/subitize.lisp")

This works: 
(load-act-r-model "ACT-R:tutorial;lisp;subitize.lisp")

Create hard link for the file:
mv ~/Downloads/ACT-R/tutorial/unit3/subitize-model.lisp ~/Downloads/ACT-R/tutorial/unit3/subitize-model.lisp.old
ln $(pwd)/assignment2/subitize-model.lisp ~/Downloads/ACT-R/tutorial/unit3/subitize-model.lisp  

Alternatively, change the path in `tutorial/subitize.lisp` to our path. See: https://github.com/donghee/wde-usability_archive/blob/8a2bbe50ba7bbf47c29a68633cb896bb4ae632a9/actr7.x/usability/1.0/task/simple_arm_movement_task.lisp#L19
