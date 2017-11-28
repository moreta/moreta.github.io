vue router
============

# Data Fetchingタイミングと vue lifecycle hook

vue routerを利用するときにdataをfetchするタイミングは以下の２つを考えられる

+ Fetching After Navigation
+ Fetching Before Navigation

## Fetching After Navigation

vue componentの `create` hookで処理する

### vue Instance Lifecycle hook

1. beforeCreate
2. created
3. beforeMount
4. mounted
5. beforeUpdate
6. updated
7. beforeDestroy
8. destroyed

## Fetching Before Navigation

vue-rotuerの in-component navigation guardsの`beforeRouteEnter`で処理する

### In-Component Navigation Guard

1. beforeRouteEnter
2. beforeRouteUpdate (added in 2.2)
3. beforeRouteLeave

# References

+ [vue router data fetching](https://router.vuejs.org/en/advanced/data-fetching.html)
+ [vue router navigation guard](https://router.vuejs.org/en/advanced/navigation-guards.html)