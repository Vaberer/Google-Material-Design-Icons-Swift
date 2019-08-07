
# Deprecated

Deprecated in favour of [HS-Font-Icons](https://github.com/ConfusedVorlon/HS-Font-Icons)
HSFontIcons supports Google material design icons as well as FontAwesome
You can easily add new icon families too

Code is similar:

```Swift
    buttonName.setGMDIcon(.gmdPublic)

    //or if you want to set an icon size and/or specify the state, use:
    buttonName.setGMDIcon(.gmdPublic, forState: .highlighted, iconSize: 30)

    buttonName.setTitleColor(UIColor.redColor(), forState: .normal)
```

becomes


```Swift
    buttonName.setIcon(GMDIcon.public)

    //or if you want to set an icon size and/or specify the state, use:
    buttonName.setIcon(GMDIcon.public, forState: .highlighted, iconSize: 30)

    buttonName.setTitleColor(UIColor.redColor(), forState: .normal)
```


# Google Material Design Icons

Forked from original project by [@vaberer](https://twitter.com/vaberer)

Google Material Design Icons Swift library for iOS.
It uses font glyphs rather than images, so they can be displayed perfectly at any size & resolution. [Google Design Material Icons](https://www.google.com/design/icons/).


<p align="center">
  <img height="480" src="https://raw.githubusercontent.com/ConfusedVorlon/HS-Google-Material-Design-Icons/master/resources/image1.png"/>
</p>

## Requirements

- iOS 8.0+
- Xcode 10

## Installation

Please switch to [HS-Font-Icons](https://github.com/ConfusedVorlon/HS-Font-Icons)

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

Google Material Design Icons is available under the MIT license. See the LICENSE file for more info.


