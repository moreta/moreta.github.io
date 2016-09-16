---
title: Jquery validate
date: 2014-04-10
tags: jquery, js, validate
---

* <http://bassistance.de/jquery-plugins/jquery-plugin-validation/>
* <https://github.com/jzaefferer/jquery-validation>
* <http://kudakurage.hatenadiary.com/entry/20091211/1260521031>

## submitHandler

if using jquery validation

```
$('#submit_form').validate({

  submitHandler: function(form) {
    // .. do something before submit ..
    $.rails.handleRemote( $(form) );  // submit via xhr
    //form.submit();                  // don't use, it submits the form directly
  }

});
```