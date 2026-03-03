# QMLProject — Qt (QML + C++) timer assignment

## Requirements covered
- Fixed window size: 1024×768
- Navigation using `StackView` (MenuScreen -> Screen1)
- Shared top MenuBar visible on all screens
  - Back button hidden on MenuScreen, visible on Screen1
  - Center buttons a/b/c visible on all screens
- Timer implemented in C++ (`TimerBackend`)
  - Updates every 500 ms
  - `Btn1` (checkable): start/pause
  - `Btn2`: reset to 0
- QML UI split into separate files (screens/components)

## Project structure
- `src/` : C++ backend and app entry point
- `qml/` : QML UI (Main, screens, components)

## Qt Modules Used

- QtQuick
- QtQuick.Controls
- QtQuick.Layouts
- QtQuick.Effects (for shadow rendering)

## Build & run (Qt Creator)
1. Open `CMakeLists.txt` in Qt Creator
2. Configure kit: Desktop Qt 6.10.2 MinGW 64-bit (or any Desktop Qt6 kit)
3. Build and Run

## Notes
- UI uses QML Layouts (GridLayout/RowLayout/ColumnLayout) to match the provided mockups.
- Timer logic is owned by C++ and exposed to QML via `qmlRegisterType`.