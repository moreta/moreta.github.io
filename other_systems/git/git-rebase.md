Git Rebase
==============

# git rebase onto

複数のcommitを別のブランチに移動したい場合

`git rebase --onto a b f.`

+ Commit a is the new root destination of the group.
+ Commit b is the commit before the first commit of the group (exclusive).
+ Commit f is the last commit of the group (inclusive).


# References

## rebase onto

+ <http://weblog.avp-ptr.de/20120928/git-how-to-copy-a-range-of-commits-from-one-branch-to-another/>
+ <https://stackoverflow.com/questions/1670970/how-to-cherry-pick-multiple-commits>

