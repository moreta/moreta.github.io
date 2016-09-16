---
title: React.js
date: 2015-06-22
tags: js, react
---

# react.js

## Component

```js
var CommentBox = React.createClass({displayName: 'CommentBox',
  render: function() {
    return (
      React.createElement('div', {className: "commentBox"},
        "Hello, world! I am a CommentBox."
      )
    );
  }
});
React.render(
  React.createElement(CommentBox, null),
  document.getElementById('content')
);
```

renderでreturnされるreactのcomponentはHTMLとしてrenderされるが
ここでdivは actual domではなく、div componentである。
なので、XSSもdefaultで安全である。

## Composing component

### owner & ownee, parent & child

+ `Avatar` owns the `div`, `ProfilePic`, `ProfileLink`
+ `div` is the parent(but not owner) of the `ProfilePic`, `ProfileLink`

```js
var Avatar = React.createClass({
  render: function() {
    return (
      <div>
        <ProfilePic username={this.props.username} />
        <ProfileLink username={this.props.username} />
      </div>
    );
  }
});

var ProfilePic = React.createClass({
  render: function() {
    return (
      <img src={'https://graph.facebook.com/' + this.props.username + '/picture'} />
    );
  }
});

var ProfileLink = React.createClass({
  render: function() {
    return (
      <a href={'https://www.facebook.com/' + this.props.username}>
        {this.props.username}
      </a>
    );
  }
});

React.render(
  <Avatar username="pwh" />,
  document.getElementById('example')
);
```

## life cycle

+ <https://facebook.github.io/react/docs/component-specs.html>

*Reactのライフサイクルメソッド*

Reactコンポーネントの作成時のライフサイクルメソッドは次の順番で実行されます。



## State vs Props

+ なるべく componentをstatelessにする。
+ What should go in State?
  + State should contain data that a component's event handlers may change to trigger a UI update.
+ What shouldn't go in State?
  +

## JSX

### htmlをrenderする時、react componentをrenderするとき

*小文字で始まるタグを利用*
```jsx
var myDivElement = <div className="foo" />;
```

*大文字で始まるタグを利用*
```
var MyComponent = React.createClass({/*...*/});
var myElement = <MyComponent someProperty={true} />;
```

### spread attributes

+ <https://facebook.github.io/react/docs/jsx-spread.html>

複数のpropsをまとめて指定することができる。

```js
var props = {};
props.foo = x;
props.bar = y;
var component = <Component {...props} />;
```

これは ES6の [Spread Operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_operator)と同じ


# Top-Level API


+ <https://facebook.github.io/react/docs/top-level-api.html>


```js
class HelloMessage extends React.Component {
  render() {
    return <div>hello {this.props.name}</div>;
  }
}
React.render(<HelloMessage name="Sebastian" />, mountNode);
```


# Tips

## Styling

See : React.js Style

## getInitialStateでpropsを使うのはanit pattern

+ <https://facebook.github.io/react/tips/props-in-getInitialState-as-anti-pattern.html>

## Load Initial Data via AJAX

+ <https://facebook.github.io/react/tips/initial-ajax.html>

*isMounted*
bool isMounted()
isMounted() returns true if the component is rendered into the DOM, false otherwise. You can use this method to guard asynchronous calls to setState() or forceUpdate().

Note:
This method is not available on ES6 class components that extend React.Component. It may be removed entirely in a future version of React.


## Use React with Other Libraries / 他のLibrarisとReactを利用する

`componentDidMount`,`componentdidUpdate`は 他のlibrariesを入れるいい場所である。

+ <https://facebook.github.io/react/tips/use-react-with-other-libraries.html>


## .bind(this)を省略できる方法

このようにarrow functionを使うと行ける？

```js
handleActive = () => {
    console.log('Special one activated');
};
```

# Decorators

+ <http://qiita.com/popkirby/items/3564a336e6e67a8555d6>
+ <https://devbutze.com/p/128>
+ <https://github.com/kriasoft/react-starter-kit/blob/master/src/decorators/withStyles.js>
+ <https://github.com/bloodyowl/react-styled>

react-starter-kitでcssを指定するためこのように書くコードがある


```js
/*! React Starter Kit | MIT License | http://www.reactstarterkit.com/ */

import React, { PropTypes } from 'react';
import styles from './LoginPage.css';
import withStyles from '../../decorators/withStyles';

@withStyles(styles)
class LoginPage {
  ...
  render() {
    ...
  }

}

export default LoginPage;
```
ここで
`@withStyles`がdecoratorである。


# addon

addonを利用するためには

利用しない場合
```js
import React from 'react'
```

利用する場合
```js
import React from 'react/addons'
```

# mixin

## LinkedStateMixin

* react addon にはいっている

<http://facebook.github.io/react/docs/two-way-binding-helpers.html>

# ES6

## setStatusなどできない場合

es6を利用したreact componentでは auto bindingされないため

constructorにこのようにbindingしてあげる

```js
this.onChange = this.onChange.bind(this)
```

+ <https://github.com/goatslacker/alt/issues/283>
+ <https://medium.com/@goatslacker/react-0-13-x-and-autobinding-b4906189425d>

