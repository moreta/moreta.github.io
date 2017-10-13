new setting with cask
========================

## 1. emacs インストール

### Homebrewでインストール
Emacs 24 is also available via homebrew. Just type the following incantation in your shell and you’re done:

```sh
brew update
brew install --japanese --cocoa --with-gnutls -v emacs
ln -s /usr/local/Cellar/emacs/24.x/Emacs.app /Applications
ln -s /usr/local/Cellar/emacs/24.4/Emacs.app /Applications

# (replace x by current subversions of Emacs 24) or

cp -r /usr/local/Cellar/emacs/24.x/Emacs.app /Applications/
cp -r /usr/local/Cellar/emacs/24.4/Emacs.app /Applications/
```

The second step is optional, but it’s recommended if you like to start Emacs from the launchpad or from Spotlight.

Chances are good you have an older version of Emacs installed by default with OS X. It's suggested you to remove that older Emacs version to avoid conflicts with the new one. Do this:

```sh
sudo rm /usr/bin/emacs
sudo rm -rf /usr/share/emacs
```

Or just create an alias in your shell and when you invoke 'emacs' it will run the newly installed version:

`$ alias emacs="/usr/local/Cellar/emacs/24.x/Emacs.app/Contents/MacOS/Emacs -nw"`
To make it permanent, if using bash, add that line to `~/.bash_profile.`

That’s all folks! You may now proceed to the configuration section.

## cask インストール

* <https://github.com/cask/cask>


Cask is a project management tool for Emacs that helps automate the package development cycle; development, dependencies, testing, building, packaging and more

`brew install cask`

#### Quickstart

Start by creating a file named Cask in the project root. Use cask init command to create a Cask-file automatically, containing boilerplate code:

```
cd ~/.emacs.d
cask init [--dev]
```
Use cask init --dev, if the project is for package development!

If you are using Cask for your Emacs configuration, add this to your `~/.emacs.d/init.el` file:

If you installed Cask via Homebrew:

```
(require 'cask)
(cask-initialize)

# これはだめ
# (require 'cask "/usr/local/share/emacs/site-lisp/cask.el")
# (cask-initialize)
```

#### To install all dependencies, run:

```
cd ~/.emacs.d
cask install
```

## Cask file

```
(source gnu)
(source melpa)

(depends-on "bind-key")
(depends-on "cask")
(depends-on "dash")
(depends-on "drag-stuff")
(depends-on "exec-path-from-shell")
(depends-on "expand-region")
(depends-on "f")
(depends-on "flycheck")
(depends-on "flycheck-cask")
(depends-on "htmlize")
(depends-on "idle-highlight-mode")
(depends-on "magit")
(depends-on "multiple-cursors")
(depends-on "nyan-mode")
(depends-on "pallet")
(depends-on "popwin")
(depends-on "prodigy")
(depends-on "projectile")
(depends-on "s")
(depends-on "smartparens")
(depends-on "smex")
(depends-on "use-package")
(depends-on "web-mode")
(depends-on "yasnippet") # auto-completeは、編集中に自動補完の候補を上げてくれます（参考）
# === ここまでintiによって defaultで入っている

# yaml editor
(depends-on "yaml-mode")
# yasnippetは、コードスニペット(code snip)を扱います。
(depends-on "auto-complete")


;; ruby
(depends-on "ruby-block")
(depends-on "ruby-compilation")
(depends-on "ruby-end")
(depends-on "ruby-interpolation")
(depends-on "ruby-mode")
(depends-on "ruby-test-mode")
(depends-on "ruby-tools")
```

## init.el file

```el
(require 'cask)
(cask-initialize)

;; load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; japaness (UTF-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-language-environment 'Japanese)
(set-default-coding-systems 'utf-8)

;; Command-Key and Option-Key
;(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; carbon emacs meta key (option key)
(setq mac-option-modifier 'meta)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)

;;現在行を強調する
(global-hl-line-mode)
(setq hl-line-face 'underline)
(hl-line-mode 1)

;; 括弧の対応をハイライト.
(show-paren-mode 1)

;; 列数表示
(column-number-mode 1)

;; C-x l で goto-line を実行
(define-key ctl-x-map "l" 'goto-line)

;; ediff setting
;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

;; Ruby
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(setq ruby-electric-expand-delimiters-list nil)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'ac-robe-setup)
```


# References

+ [GitHub - cask/cask: Project management tool for Emacs](http://cask.readthedocs.io/en/latest/)
+ [Emacs - 俺がCaskで入れたパッケージを1つ1つ解説していく](http://qiita.com/aKenjiKato/items/aa8a6d9c797a4f10d9f8)


## ほかemacs package管理 - el-get

+ [Caskはもう古い、これからはEl-Get - いまどきのEmacsパッケージ管理](http://tarao.hatenablog.com/entry/20150221/1424518030)
+ [Manage the external elisp bits and pieces upon which you depend! http://tapoueh.org/emacs/el-get.html](https://github.com/dimitri/el-get)