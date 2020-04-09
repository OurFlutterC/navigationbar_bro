# navigationbar_bro

A Flutter package for easy implementation of navigation bar with infinity of pages.

## Author: [CHAHBOUN Mohammed](https://github.com/ourflutter), [CHAHBOUN Ismail](https://github.com/zakatknowledge)


[![Pub](https://img.shields.io/pub/v/navigationbar_bro.svg)](https://pub.dartlang.org/packages/navigationbar_bro)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Gif](https://github.com/ourflutter/navigationbar_bro/blob/master/bottom_bar.gif "bottom position")
![Gif](https://github.com/ourflutter/navigationbar_bro/blob/master/left_bar.gif "left position")
## Getting Started

In your flutter project, add the dependency to your `pubspec.yaml`

```yaml
dependencies:
  ...
  navigationbar_bro: ^0.0.1
```

## Usage
```dart
NavigationBarBro(
    children:<Widget>[
        //here your pages
    ],
    btnsBar:<BtnBar>[
        BtnBar(
        title:"Home"
        icon:Icons.home,
        ),
        //add more if you need it.
    ],
    position:PositionBar.top, //PositionBar.left, PositionBar.bottom or PositionBar.right (choose the position of navigation bar)
    colorSelectBtn: Colors.white, //Color of select button
    colorAllBtn:Colors.grey, //Colors of others button
    opacityBar:0.5, //oppacity of buttons bar (0.0 to 1.0)
    btnBarRadius:BorderRadius.only(bottomLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)), //Radius of buttons bar
)
```
# License
    MIT License
    
    Copyright (c) 2020 CHAHBOUN Mohammed
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
