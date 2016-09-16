---
title: React.js Context
date: 2016-01-11
tags: js, react, context
---


# 概要

Reactでのcontextについて

# props? context?


## propsの短所

+ React.jsのコンポーネント間で情報を渡すためには props を使うわけですが
+ しかし明示的に指定しないと行けない
+ child componentのdepthが深い場合には不向き
  + componentの結合度が高くなる
  
なので、contextをつかう

## context

+ material-ui (mui)でもよくつかわれる 

childContextTypes/getChildContext によって作られた Context は 
App モジュールの子孫にわたって引き継がれていくようで、
muiの各コンポーネントはこの Context から muiTheme を得て、そ
の見た目を決めていると思われます。


### <https://facebook.github.io/react/docs/context.html>から

+ Occasionally, you want to pass data through the component tree 
without having to pass the props down manually at every level. 
React's "context" feature lets you do this.

+ When not to use context
  + The best use cases for context are for implicitly passing down the logged-in user, the current language, or theme information
  + Do not use context to pass your data thorough components. !!!


### 利用方法

+ parentでchildContextTypes定義
+ childでcontextTypesを定義
+ this.contextで利用


### override

もし、grandparentとparentがいて、parentで、同じcontextを上書きしたらchildは上書きされてデータをもらう

<https://jsbin.com/fuxodipuho/edit?js,output>

## sample

from <https://github.com/moreta/study-reactjs/tree/master/frontend-boilerplate/client/containers/ContextTest>


Parent

```js
// http://y-ukatama.hateblo.jp/entry/2015/07/08/132847
// を書き換え
import React, {Component, PropTypes} from 'react'
import Content from './content'
import Child from './child'

export default class Parent extends Component {

  constructor(props) {
    super(props)
    this.state = { text: null }
  }


  getChildContext() {
    return {
      title: 'title1',
      text: this.state.text
    }
  }

  componentDidMount() {
    setTimeout(function() {
      console.log('call setState')
      this.setState({ text: 'some text' })
    }.bind(this), 1500)
  }

  tick = () => {
    console.log('call tick')
    this.setState({ text: 'some text2' })
  };


  render() {
    return (
      <Child>
        <Content onClick={this.tick} />
      </Child>
    )
  }
}

Parent.childContextTypes = {
  title: PropTypes.string,
  text: PropTypes.string
}

```

Child

```js
// http://y-ukatama.hateblo.jp/entry/2015/07/08/132847
// を書き換え
import React, {Component, PropTypes} from 'react'
import Content from './content'

export default class Child extends Component {

  render() {
    return (
      <div>{this.props.children}</div>
    )
  }
}

Child.childContextTypes = {
  title: PropTypes.string,
  text: PropTypes.string
}
```

Content

```js
import React, {Component, PropTypes} from 'react'

export default class Content extends Component {

  render() {
    return (
      <div onClick={this.props.onClick}>
        {this.context.title + ': ' + (this.context.text || 'no text')}
      </div>
    )
  }
}

Content.contextTypes = {
  title: PropTypes.string,
  text: PropTypes.string
}
```


# What should be in the context

React libraries

+ Fluxible adds getStore and executeAction to component context
+ React-router adds an router object to the context for routing
+ react-intl adds messages, formats objects and locales string|array to the context for translations and text formating.

For a library, context is a good way for sharing data/functionalities in react components without polluting the application business logic.
libarayでcontextはdataや機能を提供するためのいい方法の一つ(ビジネスロジックを汚染させずに)

ほか、

+ logged-in user
+ current language(react-intlと同じかな)
+ theme

などにも利用していい

## その他

### parent-based and owner-based context

React has officially said that parent-based context will be the future and owner-based context is deprecated

<https://gist.github.com/jimfb/0eb6e61f300a8c1b2ce7>

# References

+ [Official - Context](https://facebook.github.io/react/docs/context.html)
+ [Take a deeper look into context in React.js – Part 1](https://dlinau.wordpress.com/2015/07/19/take-a-deeper-look-into-context-in-react-js/)
+ [Take a deeper look into context in React.js – Part 2](https://dlinau.wordpress.com/2015/07/22/take-a-deeper-look-into-context-in-react-js-part-2/)
+ [React.jsのContext周りで嵌ったはなし (owner-based vs parent-based context)](http://y-ukatama.hateblo.jp/entry/2015/07/08/132847)
+ [React の Context を使って Flux を実装する](http://qiita.com/mizchi/items/ef3fe8a82ce0fb49b52d)
+ [introduction to contexts in reactjs](https://www.tildedave.com/2014/11/15/introduction-to-contexts-in-react-js.html)
