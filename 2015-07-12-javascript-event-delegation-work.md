---
title: How JavaScript Event Delegation Works
date: 2015-07-12
tags: js,event,delegation
---


dynamicに作られてなくなるelementにはeventを付けづらい。
なので親にeventをつける方法でeventをdelegationする

```js
// Get the element, add a click listener...
document.getElementById("parent-list").addEventListener("click", function(e) {
	// e.target is the clicked element!
	// If it was a list item
	if(e.target && e.target.nodeName == "LI") {
		// List item found!  Output the ID!
		console.log("List item ", e.target.id.replace("post-"), " was clicked!");
	}
});
```

もうちょっと複雑な例

parent DIVは複数のchildをもっていて
そのなかで `A`tagの`classA`のcss classを持つものを対象にする

```js
// Get the parent DIV, add click listener...
document.getElementById("myDiv").addEventListener("click",function(e) {
	// e.target was the clicked element
	if(e.target && e.target.nodeName == "A") {
		// Get the CSS classes
		var classes = e.target.className.split(" ");
		// Search for the CSS class!
		if(classes) {
			// For every CSS class the element has...
			for(var x = 0; x < classes.length; x++) {
				// If it has the CSS class we want...
				if(classes[x] == "classA") {
					// Bingo!
					console.log("Anchor element clicked!");


					// Now do something here....



				}
			}
		}

	}
});
```

# references

+ <http://davidwalsh.name/event-delegate>
