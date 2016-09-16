---
title: Angular Dart
date: 2014-05-10
tags: google, dart, angular
---



# @Controller @Decorator @Component

[ここをみて追加しておこう](https://angulardart.org/tutorial/06-ch04-directive.html)

How is a component different from a controller?

The key difference between components and controllers is that the inner structure of components are isolated from their surroundings and can be thought of as black boxes.

Components create their own scope hierarchy that is invisible from the outside world. They don’t have direct access to the app’s scope, nor does the app have direct access to a component’s scope.

Components isolate their views from their surroundings by creating a shadow DOM. Using a shadow DOM allows components to be used anywhere without suffering from things like CSS name collisions.

# custom Decorator

# コードでdom elementを追加するときの注意点


* angularがコントロールするelementは削除しないこと。


# ng directive

## ng-app

## ng-if

the expression is false, then the portion of the DOM underneath the if is removed. ng-if does not change the visibility of the DOM element. It removes it

ng-ifは表示を隠すよりDOM elementを削除する。

## ng-class

cssのclassをdynamicに利用するため

## ng-repeat

## ng-click
