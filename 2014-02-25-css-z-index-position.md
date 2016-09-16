---
title: css position & z-index
date: 2014-02-25
tags: css, position, z-index
---



## Stacking Order

<http://mytory.net/archives/10997>

opacityは Stacking Orderに影響する

<http://codepen.io/anon/pen/LaErK>

position 속성을 요소들에 사용할 때, position 속성이 있는 모든 요소(와 그 자식 요소)는 position 속성이 없는 요소들 앞에 나타난다.
(position 속성이 있다는 말은 static이 아닌 position 속성이 있다는 것이다. 예컨대,relative, absolute 같은 것들.)

* positionを使ったときにはpositionがない要素の前に出る。
* position 속성이 있는 요소에서만 작동한다. position 속성이 지정되지 않은 요소에 z-index를 매겨 보면, 아무 일도 안 일어날 것이다.
* z-index 값은 쌓임 맥락(stacking contexts)을 만들 수 있다


## Stacking Contexts

<https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Understanding_z_index/The_stacking_context>

* 모바일 웹킷과 크롬 22 이상에서, position: fixed는 무조건 새로운 쌓임 맥락을 만든다. z-index가 "auto"여도 말이다


### z-index가 있는 경우

요소에 z-index 속성이 지정되면 그 요소는 기본 레이어를 벗어나 새로운 레이어에서 쌓이게 됩니다.
그리고 이 새로운 레이어는 z-index의 값에 따라 순서가 정해집니다.
z-index의 값이 양수(+)면 기본 레이어의 위에, 음수(-)면 아래에 위치하게 되며,
지정하는 값이 클수록 위쪽. 즉, 사용자에게 가까운 쪽으로 배치됩니다.

*z-index는 position 속성이 설정된 요소(position : absolute, relative, fixed)에 대해서만 쓸 수 있습니다.*

따라서 z-index를 사용하려면 요소에 position 속성과 z-index 속성을 같이 지정해야 합니다.

<http://codeflow.co.kr/question/987/z-index-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0/>