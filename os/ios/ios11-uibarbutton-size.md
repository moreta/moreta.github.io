
+ <https://skyebook.net/blog/2017/09/uibarbuttonitem-sizing-in-ios-11/>
+ <https://stackoverflow.com/questions/44442573/navigation-bar-rightbaritem-image-button-bug-ios-11>

```swift
if #available(iOS 11.0, *)
{
   button.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
   button.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
}else
{
   var frame = button.frame
   frame.size.width = 32.0
   frame.size.height = 32.0
   button.frame = frame
}
```