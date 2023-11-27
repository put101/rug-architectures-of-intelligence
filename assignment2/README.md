This doesn't work:
(load-act-r-model "~/Documents/technical/git/rug-architectures-of-intelligence/tutorial/lisp/subitize.lisp")

This works: 
(load-act-r-model "ACT-R:tutorial;lisp;subitize.lisp")

Create hard link for the file:
mv ~/Downloads/ACT-R/tutorial/unit3/subitize-model.lisp ~/Downloads/ACT-R/tutorial/unit3/subitize-model.lisp.old
ln $(pwd)/assignment2/subitize-model.lisp ~/Downloads/ACT-R/tutorial/unit3/subitize-model.lisp  

Alternatively, change the path in `tutorial/subitize.lisp` to our path. See: https://github.com/donghee/wde-usability_archive/blob/8a2bbe50ba7bbf47c29a68633cb896bb4ae632a9/actr7.x/usability/1.0/task/simple_arm_movement_task.lisp#L19

(subitize-trial 3)


---

## Results

```
? (subitize-experiment)
CORRELATION:  0.980
MEAN DEVIATION:  0.201
Items    Current Participant   Original Experiment
  1         0.54  (T  )               0.60
  2         0.72  (T  )               0.65
  3         0.90  (T  )               0.70
  4         1.09  (T  )               0.86
  5         1.27  (T  )               1.12
  6         1.46  (T  )               1.50
  7         1.64  (T  )               1.79
  8         1.83  (T  )               2.13
  9         2.02  (T  )               2.15
 10         2.20  (T  )               2.58

```


# Submittion


 tar -c submittion > submittion.zip
 