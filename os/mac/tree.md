# tree

mac install

```
brew install tree
```

## man page

<http://mama.indstate.edu/users/ice/tree/tree.1.html>

#### LISTING OPTIONS

| options |                desc                |
|---------|------------------------------------|
| -a      | all file(include hidden file)      |
| -d      | directories only                   |
| -L      | Max display depth of the directory |
| -N      | 日本語が化けるときに                  |

```sh
# 1レベルのdirectoryを日本語文字化けしないで表示
tree -LN 1
```

#### FILE OPTIONS

| options |                         desc                         |
|---------|------------------------------------------------------|
| -u      | print the username                                   |
| -g      | print the groupname                                  |
| -h      | print the size of file in a more human readable way, |
|         |                                                      |

#### SORTING OPTIONS

| options |                         desc                         |
|---------|------------------------------------------------------|

#### GRAPHICS OPTIONS

| options |                         desc                         |
|---------|------------------------------------------------------|
