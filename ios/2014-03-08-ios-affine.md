---
title: iOS Affine
date: 2014-03-08
tags: ios, affine
---

# アフィン変換使うときには Use Autolayoutのチェックを外すこと




# アフィン変換の作成

| CGAffineTransformMakeTranslation | 移動用のアフィン変換を作成する      |
| CGAffineTransformMakeRotation    | 回転用のアフィン変換を作成する      |
| CGAffineTransformMakeScale       | 拡大・縮小用のアフィン変換を作成する |
| CGAffineTransformMake            | アフィン行列指定して作成する        |



# アフィン変換の追加


| CGAffineTransformTranslate | ビューを移動する             |
| CGAffineTransformRotate    | ビューを回転する             |
| CGAffineTransformScale     | ビューを拡大・縮小するこ      |
| CGAffineTransformInvert    | 現在のアフィン変換を反転させる |
| CGAffineTransformConcat    | 2つのアフィン変換を組み合わせる|
