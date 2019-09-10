# Git

> My personal git reference

## Branching

List all branches
```
git branch -a
```

List only local branches
```
$ git branch
```

List only remote branches
```
$ git branch -r
```

List branches that haven't been merged
```
$ git checkout master
$ git branch --no-merged
```

List stale branches on origin (-n = dry run)
```
$ git remote prune origin -n
```

Remove stale branches on origin
```
$ git remote prune origin
$ git fetch -p
```

Remove local stale branches
```
$ git branch -d `git branch --merged | grep -v master | cut -f 1`
```
