# speed_up_flutter

[![pub package](https://img.shields.io/pub/v/speed_up_flutter.svg?label=speed_up_flutter&color=blue)](https://pub.dev/packages/speed_up_flutter)
[![likes](https://badges.bar/speed_up_flutter/likes)](https://pub.dev/packages/speed_up_flutter/score)
[![codecov](https://codecov.io/gh/AndrewPiterov/speed_up_flutter/branch/main/graph/badge.svg?token=VM9LTJXGQS)](https://codecov.io/gh/AndrewPiterov/speed_up_flutter)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
[![Dart](https://github.com/AndrewPiterov/speed_up_flutter/actions/workflows/dart.yml/badge.svg)](https://github.com/AndrewPiterov/speed_up_flutter/actions/workflows/dart.yml)

Package to speed up your productivity in Flutter. For more productivity in pure `Dart`, please check out [speed_up](https://pub.dev/packages/speed_up) package.

## Usage

### Number extensions

```dart
20.h; // Add vertical spacing
20.w; // Add horizontal spacing
```

### Section

A section is a thematic grouping of content, typically with a heading

```dart
Section(
  [
    Text('Name Andrew'),
    10.h,
    Text('Age 18'),
  ],
  heading: Text('User info'),
)
```

### FirstLastItemInList

```dart
ListView.separated(
  // scrollDirection: Axis.horizontal,
  itemBuilder: (_, index) => FirstLastItemInList(
    child: ContactListItemView(
      ContactModel.fakeList.elementAt(index),
    ),
    index: index,
    total: ContactModel.fakeList.length,
    // scrollDirection: Axis.horizontal,
  ),
  separatorBuilder: (_, __) => 20.h,
  itemCount: ContactModel.fakeList.length,
),
```

### Side Padding

```dart
ListView().sidePadded(pad:, axis:);
```

### getTextSize

Useful when need calculate AppBar's `height`

```dart
final Size textSize = getTextSize(
  'Discover Fantasian\'s\namazing world',
  headerTextStyle,
);
```

## Builders

```dart
'Flutter'.asText(style:).inCenter(),
```

## Contributing

We accept the following contributions:

* Improving documentation
* [Reporting issues](https://github.com/AndrewPiterov/speed_up_flutter/issues/new)
* Fixing bugs

## Maintainers

* [Andrew Piterov](mailto:contact@andrewpiterov.com?subject=[GitHub]%20Source%20Dart%20speed_up_flutter)


<a href="https://www.buymeacoffee.com/devcraft.ninja" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>
