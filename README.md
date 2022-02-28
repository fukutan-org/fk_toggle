<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## fk_toggle v0.1.4

This is simple flutter toggle button widget.

Supports show text labels and icons, Possible set multiple value to toggle ui, not only 2 values.

Also you can customize size and colors as you like.


## Screenshot of [SampleApp](https://github.com/fukutan-org/fk_toggle/tree/master/example)
![fk_toggle_image](https://user-images.githubusercontent.com/51870919/155354687-a01ddfb5-74d7-49da-80fd-9384fb0bdf32.png)

## Features

- Toggle Items
  - Provide toggle change event.
- Show texts
- Show icons
- Customization of Size, And colors when toggle on/off.

## How to install

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  fk_toggle: ^0.1.1
```

You can install packages from the command line with Flutter:
```shell
$ flutter pub get
```

Import in your project:
```dart
import 'package:fk_toggle/fk_toggle.dart';
```

## Usage

```dart
Scaffold(
  appBar: AppBar(title: const Text('Sample Toggle Switches')),
  body: Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FkToggle(
            width: 50,
            height: 30,
            labels: const ['1', '2']
          ),
        )
      )
    ),
  ),
);
```

## Parameter descriptions

|Property name|description|default value|required|
|---|---|:-:|:-:|
|width|length of a toogle :warning: not full length of widget|:u7121:|:heavy_check_mark:|
|height|height of widget|:u7121:|:heavy_check_mark:|
|labels|toggle button texts. Allow empty text|:u7121:|:heavy_check_mark:|
|cornerRadius|size of corner radius|10||
|backgroundColor|unselected toggle color|Colors.black26||
|selectedColor|selected toggle color|Colors.blue||
|disabledElementColor|unselected label color|Colors.black54||
|enabledElementColor|selected label color|Colors.white||
|fontSize|font size of labels|16.0||
|icons|Allow null value in lists,You can set an icon for any Toggle|:u7121:||
|onSelected|provide toggle change event, Provide index and instance|:u7121:||

## Future schedule

- Implement animation feature
- Improve class paramters to about like auto calulate width and height.
- you can post some issues.

## Contacts

Feel free to send message.<br>
Welcome to work consultation or everything.<br>
Twitter:[@fukutan_org](https://twitter.com/fukutan_org)<br>
github:[fukutan-org](https://github.com/fukutan-org)
