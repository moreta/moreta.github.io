

# Use a Vue.js Render Prop

+ [Use a Vue.js Render Prop!](https://vuejsdevelopers.com/2018/01/15/vue-js-render-props/?jsdojo_id=vjn_rep)
  + renderという名のpropを利用してrender functionを活用するidea
  + jsxなどを子componentへ渡すことで、react likeなコードがかける
  + [Vue scoped slot example](https://codesandbox.io/s/5vxn0nzj0l?from-embed)
  + [Vue JSX Render Prop](https://codesandbox.io/s/q9zm2j1jr9?from-embed)

## Some advantages to scoped slots are that:

* Custom parent-child template injection without a render function or jsx.
* You can specify default content easily. In the above example, I pass in a specified slot, that defines a custom message, but when I don’t specify a slot, it will fallback to the default slot. A default slot also gives users of the component a “component api” so that you don’t have to guess what you might need to render.
* Uses destructuring similar to jsx render callback
* Parent content to be rendered with child data is “inline” with the template
* You will probably never be able to inline a jsx function in your template (https://github.com/vuejs/vue/issues/7439)