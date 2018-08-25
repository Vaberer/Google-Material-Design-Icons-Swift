# Google Material Design Icons Swift

Forked from original project by [@vaberer](https://twitter.com/vaberer)

Code is somewhat rewritten to make updating icons much easier - but it is almost completely compatible with the original.

Updated for Swift 4.
The code now lists many more icons from the 3.0.1 release, and includes the updated font file

Note - I will update to Swift 4.2 as soon as that is released to avoid the dependency on EnumCollection.

At that point, I'll release a new pod with a new name.


If you want a new icon, you just have to find and update the codepoint.
See instructions in the demo project UpdatingNotes.txt on how to do that.


Various convenience methods have been updated to make them even more convenient.


Google Material Design Icons Swift library for iOS. It uses font glyphs rather than images, so they can be displayed perfectly at any size & resolution. [Google Design Material Icons](https://www.google.com/design/icons/).


<p align="center">
  <img height="480" src="https://github.com/Vaberer/Google-Material-Design-Icons-Swift/blob/master/resources/image1.png"/>
</p>

## Requirements

- iOS 8.0+
- Xcode 7

## Installation

### CocoaPods


```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Google-Material-Design-Icons-Swift', git: "https://github.com/ConfusedVorlon/Google-Material-Design-Icons-Swift"
```

Do not forget to import to your swift files where you want to use this library:
```swift
import Google_Material_Design_Icons_Swift
```


## Usage


### UILabel
```Swift
    labelName.GMDIcon = .gmdPublic

    labelName.textColor = UIColor.redColor()
```

### UIButton
```Swift
    buttonName.setGMDIcon(.gmdPublic)

    //or if you want to set an icon size and/or specify the state, use:
    buttonName.setGMDIcon(.gmdPublic, forState: .highlighted, iconSize: 30)

    buttonName.setTitleColor(UIColor.redColor(), forState: .normal)
```

### UIBarButtonItem
```Swift
    //Standard font size
    barName.GMDIcon = .gmdPublic

    //Custom font size
    barName.setGMDIcon(.gmdPublic, iconSize: 35)

    barName.tintColor = UIColor.redColor()
```




## Original Author

Patrik Vaberer, patrik.vaberer@gmail.com

- [LinkedIn](https://sk.linkedin.com/in/vaberer)
- [@vaberer](https://twitter.com/vaberer)
- [Blog](http://vaberer.me)

### Licence

Google Material Design Icons Swift is available under the MIT license. See the LICENSE file for more info.


