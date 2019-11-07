# mapreduce()

For this function, there are three versions available - `tmapreduce`, which parallelises only the mapping part (only function `f`), `maptreduce`, which parallelises only the reduction part (only function `op`) and `tmaptreduce`, which parallelises both.

```@docs
tmapreduce
maptreduce
tmaptreduce
```
