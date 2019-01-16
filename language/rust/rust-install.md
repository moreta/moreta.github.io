# rust install

## install by rustup


```
curl https://sh.rustup.rs -sSf | sh
```

```
info: downloading installer

Welcome to Rust!

This will download and install the official compiler for the Rust programming
language, and its package manager, Cargo.

It will add the cargo, rustc, rustup and other commands to Cargo's bin
directory, located at:

  /Users/your_home/.cargo/bin

This path will then be added to your PATH environment variable by modifying the
profile files located at:

  /Users/your_home/.profile
  /Users/your_home/.bash_profile

You can uninstall at any time with rustup self uninstall and these changes will
be reverted.

Current installation options:

   default host triple: x86_64-apple-darwin
     default toolchain: stable
  modify PATH variable: yes

1) Proceed with installation (default)
2) Customize installation
3) Cancel installation

>1

info: syncing channel updates for 'stable-x86_64-apple-darwin'
info: latest update on 2018-11-08, rust version 1.30.1 (1433507eb 2018-11-07)
info: downloading component 'rustc'
 61.5 MiB /  61.5 MiB (100 %)  33.2 MiB/s ETA:   0 s
info: downloading component 'rust-std'
 47.3 MiB /  47.3 MiB (100 %)  32.2 MiB/s ETA:   0 s
info: downloading component 'cargo'
info: downloading component 'rust-docs'
info: installing component 'rustc'
info: installing component 'rust-std'
info: installing component 'cargo'
info: installing component 'rust-docs'
info: default toolchain set to 'stable'

  stable installed - rustc 1.30.1 (1433507eb 2018-11-07)


Rust is installed now. Great!

To get started you need Cargo's bin directory ($HOME/.cargo/bin) in your PATH
environment variable. Next time you log in this will be done automatically.

To configure your current shell run source $HOME/.cargo/env
```

* cargo
* rustup
* rustc

がinstall

## fish shellには 自動でsetupが入らないので自分で入れる

sourceで cargo envをload

```
# fish
source ~/.cargo/env
# set -x PATH $HOME/.cargo/bin $PATH

# bash
# export PATH="$HOME/.cargo/bin:$PATH"
```


# rustc version確認

```
⋊> ~ rustc --version
rustc 1.30.1 (1433507eb 2018-11-07)
```

# rust update

```
rustup update
```
