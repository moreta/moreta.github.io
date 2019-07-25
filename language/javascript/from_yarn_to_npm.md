# もうYarnを使う理由がなくなって来た。

https://iamturns.com/yarn-vs-npm-2018/

# まだ、yarnを使う理由

- npm still doesn't have a cache
- npm still has unnecessarily verbose output
- npm install updating the lock file - what's the point of having a lock
file, if it's not used to lock down the versions unless you 
specifically tell npm to upgrade? I've never seen a yarn.lock file 
change unless I changed dependencies.
- "npm link" is inferior to yarn's link. It should simply create a symbolic link that just works. That's it.
- (a minor thing) npm help is useless. Just try running "npm help config", like npm suggests itself and let me know what you learned from it... (I'm on v6.4.1)