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
