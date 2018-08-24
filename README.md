# Google Material Design Icons Swift

Forked from original project by @vaberer

Updated for Swift 4 and rewritten to simplify the code and make it easier to update

The code now lists all icons for the 3.0.1 release, and includes the updated font file

However - updating the code points is a manual process - so most new icons are still commented out.
If you want a new icon, you just have to find and update the codepoint. See instructions in the demo project UpdatingNotes.txt on how to do that.



Various convenience methods have been updated to make them even more convenient.

![Font Awesome Swift](https://github.com/Vaberer/Font-Awesome-Swift/blob/master/resources/opensource_matters.png)

Originally by: [@vaberer](https://twitter.com/vaberer)

I like &#9733;. Do not forget to &#9733; this super convenient library.



#There is also a very popular [Font Awesome](https://github.com/Vaberer/Font-Awesome-Swift) library which you will love!



Google Material Design Icons Swift library for iOS. No image icons any more. Using Google Material Design Icons Swift library is very easy to use. Look at the demo app which shows all icons and their names or just visit [Google Design Material Icons](https://www.google.com/design/icons/).


<p align="center">
  <img height="480" src="https://github.com/Vaberer/Google-Material-Design-Icons-Swift/blob/master/resources/image1.png"/>
</p>

## Requirements

- iOS 8.0+
- Xcode 7

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Google Material Design Icons Swift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Google-Material-Design-Icons-Swift', '~> 1.0.1'
```

Then, run the following command:

```bash
$ pod install
```
Do not forget to import to your swift files where you want to use this library:
```swift
import Google_Material_Design_Icons_Swift
```


### Manually

1. Copy `GMDIcon.swift` and `GMDIcons.ttf` files into your project
2. Check to import `GMDIcons.ttf` in project, "Project" > "Target" > "Copy Bundle Resources"



## Usage

Super easy way how to add an icon.
<p align="center">
  <img height="200" src="https://github.com/Vaberer/Google-Material-Design-Icons-Swift/blob/master/resources/helper.png"/>
</p>


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




## Author

Patrik Vaberer, patrik.vaberer@gmail.com

- [LinkedIn](https://sk.linkedin.com/in/vaberer)
- [@vaberer](https://twitter.com/vaberer)
- [Blog](http://vaberer.me)

### Licence

Google Material Design Icons Swift is available under the MIT license. See the LICENSE file for more info.


