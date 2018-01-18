# Githubのpull requestをローカルに

```sh
# Fetch the reference to the pull request based on its ID number, creating a new branch in the process.
# IDは PRの番号
# BRANCHNAMEはすきな名前で
git fetch origin pull/ID/head:BRANCHNAME

# Switch to the new branch that's based on this pull request:
git checkout BRANCHNAME
```


# References

+ [Checking out pull requests locally - Modifying an inactive pull request locally](https://help.github.com/articles/checking-out-pull-requests-locally/#modifying-an-inactive-pull-request-locally)