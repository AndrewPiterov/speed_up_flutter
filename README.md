# speed_up_flutter

This package will speed up your developing.

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

### getTextSize

Useful when need calculate AppBar's `height`

```dart
final Size textSize = getTextSize(
  'Discover Fantasian\'s\namazing world',
  headerTextStyle,
);
```

## Contributing

We accept the following contributions:

* Improving documentation
* Reporting issues
* Fixing bugs

## Maintainers

* [Andrew Piterov](mailto:piterov1990@gmail.com?subject=[GitHub]%20Source%20Dart%20speed_up_flutter)
