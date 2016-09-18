---

title: "github page with Octopress"
date: 2013-10-02 01:36
comments: true
tags: octopress, github
---


# 参照

* <http://tokkonopapa.github.io/blog/2011/12/30/octopress-on-github-and-bitbucket/>
* <http://octopress.org/>

# Octopress

## basic command

~~~ sh
rake generate   # Generates posts and pages into the public directory
rake watch      # Watches source/ and sass/ for changes and regenerates
rake preview    # Watches, and mounts a webserver at http://localhost:4000
rake deploy

rake gen_deploy # generate + deploy
~~~




## Writing new posts and Publishing

~~~ sh
rake new_post["title your post"]
git add .
git commit -m 'your message'
git push origin source

rake gen_deploy
~~~



