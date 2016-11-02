Java JCE (Java Cryptography Extension)
===================================


# Download

JCE（Java Cryptography Extension）の無制限強度の管轄ポリシーファイルをダウンロード

バージョンによってファイルも変わるので注意。

| バージョン | ダウンロード元                                     | ファイル名                 |
|:-----------|:---------------------------------------------------|:---------------------------|
| JDK1.6     | JCE Unlimited Strength Jurisdiction Policy Files 6 | jce_policy-6.zip           |
| JDK1.7     | JCE Unlimited Strength Jurisdiction Policy Files 7 | UnlimitedJCEPolicyJDK7.zip |
| JDK1.8     | JCE Unlimited Strength Jurisdiction Policy Files 8 | jce_policy-8.zip           |


# Install

downloadしたファイルを展開し、以下のfolderへ格納

from README.txt

```
Here are the installation instructions:

1)  Download the unlimited strength JCE policy files.

2)  Uncompress and extract the downloaded file.

    This will create a subdirectory called jce.
    This directory contains the following files:

        README.txt                   This file
        local_policy.jar             Unlimited strength local policy file
        US_export_policy.jar         Unlimited strength US export policy file

3)  Install the unlimited strength policy JAR files.

    In case you later decide to revert to the original "strong" but
    limited policy versions, first make a copy of the original JCE
    policy files (US_export_policy.jar and local_policy.jar). Then
    replace the strong policy files with the unlimited strength
    versions extracted in the previous step.

    The standard place for JCE jurisdiction policy JAR files is:

        <java-home>/lib/security           [Unix]
        <java-home>\lib\security           [Windows]
```

# References

+ [JavaSE(JDK)をインストールしたら必ずやっておきたい設定](http://qiita.com/tool-taro/items/1d3787e786c6d2ebfedd)
+ [JavaでAES256を使用できるようにする](http://qiita.com/mizuki_takahashi/items/cc26a7fd51aa04396e92)
