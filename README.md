# mvvm
Flutter and MVVM

## Getting Started
`flutter pub get`
`flutter pub run build_runner build`

## Document
- MVVM: https://www.raywenderlich.com/6373413-state-management-with-provider
- Statement Manager: Provider - https://www.youtube.com/watch?v=d_m5csmrf7I

## Assets
- For only android -> need **1x**, **1.5x**(WVGA), **2x**(HD), **3x**(fullHD), **3.5x**(2K) folders
- For only ios -> need **1x**, **2x**(Ipads, Iphone 6,7,8,XR), **3x**(Iphone X, XS...) folders

  => For android and ios -> need **1x**, **1.5x**, **2x**, **3x**, **3.5x** folders

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
- auto_route: Declarative routing solution, automatically generated.
- provider: Statement Manager.
- get_it: A service locator is an alternative to **dependency injection**

## Build and release
- Android: https://docs.flutter.dev/deployment/android
- iOS: https://docs.flutter.dev/deployment/ios
