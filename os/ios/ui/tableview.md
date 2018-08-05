# navigation barのcustomiseでのポイント

## navigationBar.setBackgroundImage, shadowImageを UIImage()にした場合

`tableview.contentInsetAdjustmentBehavior = .naver`にする必要がある
これは default .alwaysなので、.naverにしないと navigationBarの高さがそのまま維持される