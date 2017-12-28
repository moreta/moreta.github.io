---
title: "foundation"
date: 2013-11-28
tags: middleman, foundation5, compass, css
---


## rails with foundation5

<http://foundation.zurb.com/docs/applications.html>

<https://github.com/zurb/foundation-rails>



``` ruby
gem 'foundation-rails'
bundle
```

### Manual Installation

#### application.css

```
*= require foundation
```

#### application.js

``` js
//= require foundation
$(document).foundation();
```

#### add modernizr

`<%= javascript_include_tag "vendor/modernizr" %>`

#### Set viewport width

`<meta name="viewport" content="width=device-width, initial-scale=1.0" />`



## middleman with foundation5

### sassで利用

<http://foundation.zurb.com/docs/sass.html>
<http://tropism.me/blog/2012/10/13/static-site-development-with-middleman-and-foundation/>

```
npm install -g bower grunt-cli
gem install foundation
foundation new MY_PROJECT
```

cp -R tmp_foundation_site/images/* my_super_awesome_site/source/images/
cp -R tmp_foundation_site/sass/* my_super_awesome_site/source/stylesheets/
cp -R tmp_foundation_site/javascripts/* my_super_awesome_site/source/javascripts/lib/

でも、この方法を使わなかった。

### cssダウンロードしファイルをcopy

foundation5 をダウンロードして、cssをcopyして利用している。

## abide valiation

custom pattern

``` html
<script>
  $(document)
    .foundation()
    .foundation('abide', {
      patterns: {
        password: /^\w{3,14}$/,
      }
    });


$(document)
  .foundation()
  .foundation('abide', {
    patterns: {
      dashes_only: /^[0-9-]*$/,
      ip_address: /^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/
    }
  });
</script>
```

公式には上記の例が書いてあるが、

*overrideするときには以下のようにしないと聞かない*

```
<script>
Foundation.libs.abide.settings.patterns.password = /^\w{3,14}$/;
$(document).foundation();
</script>
```