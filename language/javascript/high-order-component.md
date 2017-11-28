High Order Component
======================

# React High Order Component

+ コードの再利用、ロジックやブートストラップの抽象化
+ Render Hijacking(レンダリング・ハイジャック)
+ Stateの抽象化と操作
+ Propsの操作


```js
function ppHOC(WrappedComponent) {
  return class PP extends React.Component {
    render() {
      return <WrappedComponent {...this.props}/>
    }
  }
}

<WrappedComponent {...this.props}/>
// これは以下と等しい
React.createElement(WrappedComponent, this.props, null)
```


# References

+ [React Higher Order Components in depth
](https://medium.com/@franleplant/react-higher-order-components-in-depth-cf9032ee6c3e#.fqb6zn5rp)
  + [ReactのHigher Order Components詳解 : 実装の2つのパターンと、親Componentとの比較](http://postd.cc/react-higher-order-components-in-depth/)
  + [franleplant/react-hoc-examples](https://github.com/franleplant/react-hoc-examples)
