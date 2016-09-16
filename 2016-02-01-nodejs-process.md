---
title: Node.js process
date: 2016-02-01
tags: nodejs, process
---

+ The process object is a global object and can be accessed from anywhere. It is an instance of EventEmitter.


# Exit Codes 

<https://nodejs.org/api/process.html#process_exit_codes>


# Signal Events 

<https://nodejs.org/api/process.html#process_signal_events>

# process.env

<https://nodejs.org/api/process.html#process_process_env>

# process.exit([code])

<https://nodejs.org/api/process.html#process_process_exit_code>

+ codeが省略されたら'success'(0)

'failure' codeでexitしたい

```
process.exit(1);
```

# References

+ [docs](https://nodejs.org/api/process.html#process_process)
+ [jp docs](http://nodejs.jp/nodejs.org_ja/docs/v0.4/api/process.html#process)
