---
title: NPM script
date: 2016-01-29
tags: nodejs, npm, script, gulp, grunt 
---

# pre and post hook

<https://docs.npmjs.com/misc/scripts#description>

```json
{
  "name": "npm-scripts-example",
  "version": "1.0.0",
  "description": "npm scripts example",
  "scripts": {
    "prebuild": "echo I run before the build script",
    "build": "cross-env NODE_ENV=production webpack",
    "postbuild": "echo I run after the build script"
  }
}
```

# 複数 call

+ You can call multiple script serially on a single line usgin `&&`.

# stream

+ gulpを使う理由の一つがin-memory stream.
+ しかし, streaming has always been built into both Unix and Windows command lines
  + pipe(|) operator stream the output of one command to the input of another command
  + and redirection(>) operator redirects output to a file

# npm Scriptが cross platformでない？

解決方法として

**いかのoperationはcross-platform** 

+ && chain tasks (Run one task after another)
+ < input file contents to a command
+ > redirect command output to a file
+ | redirect command output to another command

**Use node packages **

For example, 

+ use rimraf instead of `rm -rf`
+ use cross-env instead of `env`

**Use shellJS**

<https://www.npmjs.com/package/shelljs>



# References

+ [Why I Left Gulp and Grunt for npm Scripts](https://medium.com/@housecor/why-i-left-gulp-and-grunt-for-npm-scripts-3d6853dd22b8#.g0osq2moj)
