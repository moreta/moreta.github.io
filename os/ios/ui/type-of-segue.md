# Type of segue

* show
* show detail
* present modally
* present as popover

ほか

* push, modal, popover, replaceはdeprecated from iOS8

## show

* the content is pushed on top of the current view controller stack
* back buttonが表示される

## show detail

* showと同じ感じ
* view controllerが現在のtop controller stackをreplaceする点が違う

## present modally

* contentをmodallyに見せる
* animate up from bottom
* いい例は apple calendar appの Add(+)機能

## present as popover

* present the content as a popover anchored to an existing view.
* Commonly found in iPad apps
