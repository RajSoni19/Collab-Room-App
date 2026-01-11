import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // Replace with your actual Firebase configuration
    return const FirebaseOptions(
      apiKey: 'AIzaSyAZELk_6R2P6VbtbensZEkVguKH_7JXNgs',
      appId: '1:903055783241:android:d4688e7c161e9012c01698',
      messagingSenderId: '903055783241',
      projectId: 'colab-room-app',
      storageBucket: 'colab-room-app.firebasestorage.app',
    );
  }
}