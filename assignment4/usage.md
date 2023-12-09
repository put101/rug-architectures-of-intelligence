Create hard link for the file:
```
mv ~/Downloads/ACT-R/tutorial/unit5/1hit-blackjack-model.lisp ~/Downloads/ACT-R/tutorial/unit5/1hit-blackjack-model.lisp.old
ln $(pwd)/assignment4/1hit-blackjack-model.lisp ~/Downloads/ACT-R/tutorial/unit5/1hit-blackjack-model.lisp
```

Load onehit.lisp (inside tutorial/lisp) and run this in the ACT-R console: 
```
(actr-load "ACT-R:tutorial;lisp;onehit.lisp")
```

Usage: 
```
(onehit-hands count)
(onehit-hands 5)

(onehit-blocks block_count hands_per_block)
(onehit-blocks 2 5)

(onehit-learning game_count show_graph)
(onehit-learning 50)
```