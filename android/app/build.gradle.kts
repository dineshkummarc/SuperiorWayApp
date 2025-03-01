plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.superior_way"
    compileSdk = 34 // Set to the latest compileSdkVersion (or use flutter.compileSdkVersion if defined in flutter.gradle)

    // Explicitly set the NDK version to 27.0.12077973
    ndkVersion = "28.0.13004108"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.superior_way"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 21 // Set to the minimum SDK version supported by your app (or use flutter.minSdkVersion)
        //noinspection OldTargetApi
        targetSdk = 34 // Set to the latest targetSdkVersion (or use flutter.targetSdkVersion)
        versionCode = 1 // Set your app's version code
        versionName = "1.0" // Set your app's version name
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
//android {
//    ndkVersion = "27.0.12077973" // Add this line
//    compileSdkVersion 34 // Ensure this matches your project's compileSdkVersion
//
//    defaultConfig {
//        applicationId "com.example.superiorway_transport" // Replace with your app's package name
//        minSdkVersion 21
//        targetSdkVersion 34
//        versionCode 1
//        versionName "1.0"
//    }
//
//    buildTypes {
//        release {
//            minifyEnabled false
//            proguardFiles getDefaultProguardFile("proguard-android-optimize.txt") , 'proguard-rules.pro'
//        }
//    }
//}