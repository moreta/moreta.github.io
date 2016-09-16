---
title: Publishing npm packages
date: 2016-05-24
tags: npm, javascript
---

# What is a package

<https://docs.npmjs.com/misc/developers>

A package is:

+ a) a folder containing a program described by a package.json file
+ b) a gzipped tarball containing (a)
+ c) a url that resolves to (b)
+ d) a <name>@<version> that is published on the registry with (c)
+ e) a <name>@<tag> that points to (d)
+ f) a <name> that has a "latest" tag satisfying (e)
+ g) a git url that, when cloned, results in (a).

# Publishing npm packages

<https://docs.npmjs.com/getting-started/publishing-npm-packages>


## Creating User or Login User

```
➜  ~ npm login
Username: your_username
Password:
Email: (this IS public) your@email.com
Logged in as your_username on https://registry.npmjs.org/.
➜  ~
➜  ~
➜  ~
➜  ~ npm config ls
; cli configs
user-agent = "npm/3.6.0 node/v5.5.0 darwin x64"

; node bin location = /your_nvm_path/.nvm/versions/node/v5.5.0/bin/node
; cwd = /xxx/xxx/
; HOME = /xxx/xxx
; "npm config ls -l" to show all defaults.
```

## Credentialが保存されていることなどを確認 : `npm config ls`

## Publishing the package : `npm publish`

+ `npm publish`でpublish
+ すべてのlocalファイルが対象だが`.gitignore`や`.npmignore`でignoreできる

## Updating the package : `npm version <update_type>`

+ `npm version <update_type>`で versionを変更
+ https://npmjs.com/package/<package>で確認
+ READMEは versionが変更されないと更新されない


# References

+ [Publishing npm packages](https://docs.npmjs.com/getting-started/publishing-npm-packages)
+ [npm-developers Developer Guide](https://docs.npmjs.com/misc/developers)
