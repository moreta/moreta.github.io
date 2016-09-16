---
title: Redux
date: 2015-12-21
tags: reactjs, redux
---

# reduxの特徴

+ 全ての state を redux オブジェクトが管理する
+ StoreやActionCreatorがただの関数
+ hot reloadやundo, redoが簡単に実装できる

## 全ての state を redux オブジェクトが管理する

どういう意味？

Storeが生成する状態をreduxに持たせ
このstoreをcomponentが利用できるようにする。


## git repository

<https://github.com/rackt/react-redux>

The connect() function lets you specify which exact state from the Redux store your component wants to track. This lets you subscribe on any level of granularity.

### example

#### Inject just dispatch and don't listen to store

```js
export default connect()(TodoApp);
```
これをしないと`this.context`を使えない

# Basics

## Actions

actionのロジックが入ってはない。
(Actions describe the fact that something happened, but don’t specify how the application’s state changes in response. This is the job of a reducer.)
どんな動きをするかdescribeするだけ。

describeするだけなので`const`で定義する

actions.js
```js
// sample
export const FETCH_USER = 'FETCH_USER'
export const FETCH_REPO = 'FETCH_REPO'
```

## ActionCreators

Action creators are exactly that functions that create actions. 
It's easy to conflate the terms “action” and “action creator,” so do your best to use the proper term.

つまり、actionを作るfunctionが`ActionCreators`である

- <http://rackt.org/redux/docs/basics/Actions.html>
- <http://rackt.org/redux/docs/api/bindActionCreators.html>

## Reducer

Specify how the application's state change in response.
reduxではすべてのapplicationのstateはsingle objectとして保存される。

## Store

+ Key Concept: A store is not a model. A store contains models.
+ Key concept: A store is the only thing in your application that knows how to update data. This is the most important part of Flux. The event we dispatched doesn't know how to add or remove items

reduxでは storeは reducerに含まれている

## Store enhancer

- A Store enhancer is a higher-order function that composes a store creator to return new, enhanced store creator.
- This is similar to middleware in that it allows you to after the store interface in a composable way.

- [store enhancer](http://rackt.org/redux/docs/Glossary.html#store-enhancer)


# Todo App

## 1. reduxの生成とstoreセット

음..
storeをセットするための物？

`Root.js`

+ Provider로 root component를 감싼다.(wrap the root component)
+ Provider는 Reduxとreactjs를 연결해 주는 역할
+ 이걸 함으로써 store인스턴스를 이용할 수 있게함


```js
import React from 'react';
import { createStore } from 'redux';
import { Provider } from 'react-redux';
import App from './containers/App';
import todoApp from './reducers';

let store = createStore(todoApp);

let rootElement = document.getElementById('root');
React.render(
  // The child must be wrapped in a function
  // to work around an issue in React 0.13.
  <Provider store={store}>
    {() => <App />}
  </Provider>,
  rootElement
);

```

### 2.

# Store

<http://rackt.github.io/redux/docs/basics/Store.html>

+ store를 만들기 위해서는 아래와 같이 작성. reducer를 전달해 주면 됨
+ reducer = store로 생각해도 괜찮음...(코드작성에는 큰 영향 없음?)

```js
import { createStore } from 'redux';
import todoApp from './reducers';

let store = createStore(todoApp);
```

옵션으로 initial status를 전달할 수 도 있다.

```js
let store = createStore(todoApp, window.STATE_FROM_SERVER)
```

# higer-order component

<https://medium.com/@dan_abramov/mixins-are-dead-long-live-higher-order-components-94a0d2f9e750>

# async action & multi action

+ <https://github.com/rackt/redux/issues/544>
+ [Dispatch multiple actions from one action creator](https://github.com/ashaffer/redux-multi)
+ [Virtual DOM for effects and impurities. You write pure functions, redux-effects handles the rest](https://github.com/redux-effects/redux-effects)
+ [Declarative data fetching for redux](https://github.com/redux-effects/redux-effects-fetch)

## effect? impurities??とはなんだ？

# Middleware

+ [redux docs api - applyMiddleware(...middlewares)](https://github.com/rackt/redux/blob/master/docs/api/applyMiddleware.md)
+ [redux-thunk](https://github.com/gaearon/redux-thunk)
+ [redux-promise](https://github.com/acdlite/redux-promise)
+ [redux-multi](https://github.com/ashaffer/redux-multi)

## multi action

* 一つのfunctionで２つ以上のactionをdispatchする。
* actionはasynchronous的に呼ばれる。

以下のように設定し、利用する

```js
import multi from 'redux-multi'
import {createStore, applyMiddleware} from 'redux'
 
applyMiddleware(multi)(createStore)
```

```js
function signupUser () {
  return [
    createUserIsLoading(),
    createUser()
  ]
}
```


# code snip

## mapDispatchToPropsで複数のactionCreatorをbindingする

redux-multi-action-creator.js

<https://gist.github.com/moreta/195cdc8e98f22d9a9646>

## Best async serverside loading technique?

<https://github.com/rackt/redux/issues/99>


<<<<<<< HEAD
=======
# Dev tool

<https://github.com/zalmoxisus/redux-devtools-extension>

>>>>>>> bfbea1c3cc75e7d99ddc34dcdadb736374654ec8
# Reference

+ <http://blog.andrewray.me/flux-for-stupid-people/>
+ <https://medium.com/@dan_abramov/mixins-are-dead-long-live-higher-order-components-94a0d2f9e750>

## video

+ [Getting Started with Redux](https://egghead.io/series/getting-started-with-redux)

## source

+ <https://github.com/liviuignat/es6-templates>


## Check for later

+ [rethinking redux demo](https://github.com/kadira-samples/rethinking-redux-demo)
+ [redux simple router](https://github.com/rackt/redux-simple-router)
+ [ducs-modular-redux](https://github.com/erikras/ducks-modular-redux)
