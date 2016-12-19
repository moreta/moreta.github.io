---
title: iOS UITextField
date: 2014-03-03
tags: ios, UITextField
---

## 入力したタイミングで再計算する。

Connection inspectorで

Sent Eventの中で[Editing Changed]


# validation

婚外は`CCValidatedTextField`を使おう

* <https://github.com/ChrisChares/CCValidatedTextField>
* <https://github.com/tomkowz/TSValidatedTextField>
* <https://github.com/benzguo/BZGFormField>


# password

Attribute InspectorのText Fieldで Return Keyの下にあるSecure にチェック

まだは

```
UITextField *textField = (UITextField *)[self.view viewWithTag:1000];
// YESに設定することでパスワードは見えなくなる
textField.secureTextEntry = YES;
[textField setSecureTextEntry:YES];
```

# 他参照

<http://dev.classmethod.jp/references/ios-7-uikit-control-text-field/>