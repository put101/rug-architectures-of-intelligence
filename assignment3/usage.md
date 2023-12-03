Create hard link for the file:
```
mv ~/Downloads/ACT-R/tutorial/unit4/zbrodoff-model.lisp ~/Downloads/ACT-R/tutorial/unit4/zbrodoff-model.lisp.old
ln $(pwd)/assignment3/zbrodoff-model.lisp ~/Downloads/ACT-R/tutorial/unit4/zbrodoff-model.lisp
```

Load zbrodoff.lisp (inside tutorial/lisp) and run this in the ACT-R console: 
```
(zbrodoff-compare 1)
(zbrodoff-compare 5)

(zbrodoff-set t)

(zbrodoff-problem "a" "2" "c" t)
```