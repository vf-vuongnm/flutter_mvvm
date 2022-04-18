# mvvm
Flutter and MVVM

## Getting Started
`flutter pub get`

`flutter pub run build_runner build`

## Document
- MVVM:               https://www.raywenderlich.com/6373413-state-management-with-provider

- Statement Manager:  Provider (https://www.youtube.com/watch?v=d_m5csmrf7I)

## Assets
- For android -> need **1x**, **1.5x**(WVGA), **2x**(HD), **3x**(fullHD), **3.5x**(2K) folders
- For ios -> need **1x**, **2x**(Ipads, Iphone 6,7,8,XR), **3x**(Iphone X, XS...) folders

## Localizations
- Lib: https://pub.dev/packages/easy_localization
- Suggest settings: `useOnlyLangCode: true`
- IOS need add to **Info.plist**
  <key>CFBundleLocalizations</key>
  <array>
  <string>en</string>
  <string>ja</string>
  </array>
  
## Important Libraries
- auto_route:   declarative routing solution, automatically generated.
- provider:     statement Manager.
- get_it:       a service locator is an alternative to **dependency injection**

## Build and release
- Android:  https://docs.flutter.dev/deployment/android
- iOS:      https://docs.flutter.dev/deployment/ios
