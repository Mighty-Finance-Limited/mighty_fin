# author:
* - Musweu Munyima [Github Link](https://github.com/Musweu10)

* version:1.0.0+1
 
# mighty_fin

## Welcome to the Official Documentation for the Mighty Finance Zambia Mobile Application.


## Getting Started

# This Project uses the Flutter Framework for Development along side some third party plugins that will be covered in this doc.

### Lets walk through the steps that you need to get started with this project.

### Step ONE
* Firstly you must have Flutter (Channel stable, 3.22.1, on Microsoft Windows [Version 10.0.22631.3958]/Mac) or higher to run this project, here is a link to the official Flutter site [online documentation](https://docs.flutter.dev/)

* Run Flutter doctor usng this command in your terminal: 

```shell
flutter doctor
``` 
* And ensure you get specs similar or higher to these:

*  [✓] Flutter (Channel stable, 3.22.1, on Microsoft Windows [Version 10.0.22631.3958], locale en-ZM)
*  [✓] Windows Version (Installed version of Windows is version 10 or higher)
*  [✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
*  [✓] Chrome - develop for the web
*  [✓] Visual Studio - develop Windows apps (Visual Studio Community 2022 17.10.1)
*  [✓] Android Studio (version 2023.3)
*  [✓] IntelliJ IDEA Community Edition (version 2024.1)
*  [✓] IntelliJ IDEA Ultimate Edition (version 2024.1)
*  [✓] VS Code (version 1.91.1)
*  [✓] Connected device (4 available)
*  [✓] Network resources

### Step Two 
* Open Android Studio and select the get from version control option 
* Then paste the github link - https://github.com/Musweu10/mighty_fin.git to clone the project
* Once the project has opened and has been indexed, create a .env file in the project root directory
### Paste the API ENDPOINT
* Paste the API Endpoint in the env file as follows:
```shell
ENDPOINT=***********************
ENDPOINT2=**********************
```
### Step Three
* Run the following command in your terminal:
```shell
flutter pub get 
```
* Alternatively you can use the pub get command found at the top right side of the editor window when you are in the pubspec.yaml file.
* The following are the packages found in the pubspec file:
*   cupertino_icons: ^1.0.6
*   flutter_bloc: ^8.1.6
*   provider: ^6.1.2
*   http: ^1.2.2
*   lottie: ^3.1.2
*   flutter_svg: ^2.0.10+1
*   google_fonts: ^6.2.1
*   shared_preferences: ^2.2.3
*   flutter_secure_storage: ^9.2.2
*   url_launcher: ^6.3.0
*   intl: ^0.19.0
*   image_picker: ^1.1.2
*   cached_network_image: ^3.3.1
*   persistent_bottom_nav_bar: ^6.2.1
*   flutter_native_splash: ^2.4.1
*   flutter_dotenv: ^5.1.0

### More packages to be added to the above list in future 
### Step Four 
* Ensure that you have a device that you can test the application on such as:
* Android (Physical Device)
* Android Emulator (Virtual Device)
* IOS (Physical Device)
* IOS Simulator (Virtual Device)
* Windows (Windows Application) Optional

### Step Five Run The App
* There after it should launch and display as expected - Happy Codding ;)


# Default Flutter MD Text
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
