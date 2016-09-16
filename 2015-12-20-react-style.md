---
title: React.js Style
date: 2015-12-20
tags: react, style
---

React.js Style
================

## Inline Style

+ <http://survivejs.com/webpack_react/styling_react/>

cssスタイルを指定するときに必ずcss形式にする必要はない。
以下のようにstyleをobjectで渡すことができる。

```js
var divStyle = {
  color: 'white',
  backgroundImage: 'url(' + imgUrl + ')',
  WebkitTransition: 'all', // note the capital 'W' here
  msTransition: 'all' // 'ms' is the only lowercase vendor prefix
};

React.render(<div style={divStyle}>Hello World!</div>, mountNode);
```

### 基本的な Inline style対応できないことは他のlibraryを利用 

+ Autoprefixing - e.g., for border, animation, flex.
+ Pseudo classes - e.g., :hover, :active.
+ Media queries - e.g., @media (max-width: 200px).
+ Styles as Object Literals - See the example above.
+ CSS style extraction - It is useful to be able to extract separate CSS files as that helps with the initial loading of the page. This will avoid a flash of unstyled content (FOUC).

#### radium
 
+ [radium - react.js inline style](http://stack.formidable.com/radium/)

## CSS Modules

+ [the-end-of-global-css](https://medium.com/seek-ui-engineering/the-end-of-global-css-90d2a4a06284#.kksvce3fi)
+ [css-modules](https://github.com/css-modules/css-modules)
+ [CSS Modules Webpack Demo](http://survivejs.com/webpack_react/styling_react/)
+ [react-css-modules](https://github.com/gajus/react-css-modules)
  + gajus/react-css-modules makes it even more convenient to use CSS Modules with React. Using it, you don't need to refer to the styles object anymore, and you are not forced to use camelCase for naming.


### example 1

``style.css``

```css
.primary {
  background: 'green';
}

.warning {
  background: 'yellow';
}

.button {
  padding: 1em;
}

@media (max-width: 200px) {
  .button {
    width: 100%;
  }
}

```

``button.jsx``

```js
import classNames from 'classnames';
import styles from './style.css';

...

<button className={classNames(
  styles.button, styles.primary
)}>Confirm</button>
```

### example 2 

```js
import React from 'react';
import styles from './table.css';

export default class Table extends React.Component {
    render () {
        return <div className={styles.table}>
            <div className={styles.row}>
                <div className={styles.cell}>A0</div>
                <div className={styles.cell}>B0</div>
            </div>
        </div>;
    }
}
```

renderingされたのは以下。

classがprefixがついているし、cssファイルも変換されている

```html
<div class="table__table___32osj">
    <div class="table__row___2w27N">
        <div class="table__cell___2w27N">A0</div>
        <div class="table__cell___1oVw5">B0</div>
    </div>
</div>
```



# references

<http://survivejs.com/webpack_react/styling_react/>
