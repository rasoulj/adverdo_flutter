# Advedro

This is a Internet advertising management application which has been implemented using Clean Architecture alongside 
**Clean Architecture** , this app contains a lot of technology such as [Dio][1] and [image_picker][14] combination. We used [video Player][10] for media playback,
The [video Player][10] provides additional support for streaming (HLS, DASH, etc.) and full HD (1080p +) ,
and we used [Get Storage][3] to save data in the local storage .

## Build gradle
--------------------------------------------------
| Title | Version |
| ------ | ------ |
| compileSdkVersion | 33 |
| buildToolsVersion | 30.0.3 |
| applicationId | com.noordeo.advedro|
| minSdkVersion | 21 |
| targetSdkVersion | JavaVersion.VERSION_1_8 |

#### Build Script Dependencies

* Gradle
    ```sh 
        classpath 'com.android.tools.build:gradle:7.1.2'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    ```

## Building
--------------------------------------
Work from Android Studio 4.2.1
Visual Studio Code ( insider )

### Clean architecture
-------------
![Clean architecture](https://raw.githubusercontent.com/android10/Sample-Data/master/Android-CleanArchitecture/clean_architecture.png)


### Data Layer
- Data Source
- Model
- Implementation Repository

### Domain Layer
- Repository interface
- Contains UseCase

### Presentation Layer
- Controller
- Binding ( dependency injection)
- Validate/Submit data input from view via UseCase
- View ( GetView - stateLessWidget ) Adapt data to view


## Module
----------------------------------------

## AndroidManifest
---------------------------------------------

## Libraries used
---------------------------------
  * [dio: ^4.0.6][1]
  * [get: ^4.6.5][2]
  * [get_storage: ^2.0.3][3]
  * [dartz: ^0.10.1][4]
  * [equatable: ^2.0.3][5]
  * [path_provider: ^2.0.14][6]
  * [flutter_image_compress: ^1.1.3][7]
  * [image_picker: ^0.8.7+2][8]
  * [permission_handler: ^10.1.0][9]
  * [video_player: ^2.6.1][10]
  * [fl_chart: ^0.61.0][11]
  * [flutter_native_splash: ^2.2.19][12]
  * [hive: ^2.2.3][13]
  * [image_cropper: ^3.0.2][14]
  * [flutter_local_notifications: ^13.0.0][15]

  
[1]: https://pub.dev/packages/dio
[2]: https://pub.dev/packages/get
[3]: https://pub.dev/packages/get_storage
[4]: https://pub.dev/packages/dartz
[5]: https://pub.dev/packages/equatable
[6]: https://pub.dev/packages/path_provider
[7]: https://pub.dev/packages/flutter_image_compress
[8]: https://pub.dev/packages/image_picker
[9]: https://pub.dev/packages/permission_handler
[10]: https://pub.dev/packages/video_player
[11]: https://pub.dev/packages/fl_chart
[12]: https://pub.dev/packages/flutter_native_splash
[13]: https://pub.dev/packages/hive
[14]: https://pub.dev/packages/image_cropper
[15]: https://pub.dev/packages/flutter_local_notifications
