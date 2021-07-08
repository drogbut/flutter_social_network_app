# flutter_social_network_app

Social network app for iOS and Android with flutter_bloc to implement login and posting using Firebase.

## Features

- Sign up with name, surname, email and password
- Sign in with email and password
- sign out

## Getting Started

### iOS

1. Replace ./ios/Runner/GoogleService-Info.plist with your own
2. Update ./ios/Runner/info.plist
    - Paste the REVERSED_CLIENT_ID from GoogleService-Info.plist to key CFBundleURLSchemes in info.plist

### Android

1. Replace ./android/app/google-services.json with your own
2. Update ./android/app/build.gradle
    - Replace "com.example.flutter_firebase_login" with the package_name from google-services.json


## Run the Project 

1. flutter run

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
