// // import 'dart:io';
// // import 'package:file_picker/file_picker.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_isolate/flutter_isolate.dart';
// //
// // FirebaseOptions firebaseOptions = const FirebaseOptions(
// //   apiKey: 'AIzaSyAXIrfc1nbJN8m5tRqqr5yRuHwo-gvvzb8',
// //   appId: '1:882145525830:ios:15fdce82b311ca772e8a47',
// //   messagingSenderId: '882145525830',
// //   projectId: 'trail-vault-d5ea8',
// //   storageBucket: 'trail-vault-d5ea8.appspot.com',
// //   iosBundleId: 'com.trailvault.trailVault',  // Specific for iOS
// // );
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp(options: firebaseOptions);
// //   (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
// //       ? '10.0.2.2'
// //       : 'localhost';
// //
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Firebase Upload Isolate Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: UploadPage(),
// //     );
// //   }
// // }
// //
// // class UploadPage extends StatefulWidget {
// //   @override
// //   _UploadPageState createState() => _UploadPageState();
// // }
// //
// // class _UploadPageState extends State<UploadPage> {
// //   FlutterIsolate? _isolate;
// //   String? _uploadStatus = "Waiting for upload...";
// //
// //   @override
// //   void dispose() {
// //     _isolate?.kill();
// //     super.dispose();
// //   }
// //
// //   Future<void> _pickAndUploadFile() async {
// //     FilePickerResult? result = await FilePicker.platform.pickFiles();
// //
// //     if (result != null && result.files.single.path != null) {
// //       String filePath = result.files.single.path!;
// //       setState(() {
// //         _uploadStatus = "Uploading...";
// //       });
// //       await uploadFileIsolate(filePath);
// //     } else {
// //       setState(() {
// //         _uploadStatus = "No file selected";
// //       });
// //     }
// //   }
// //
// //
// //   static Future<void> uploadFileIsolate(String filePath) async {
// //     try {
// //       // Initialize Firebase in isolate
// //       await Firebase.initializeApp(options: FirebaseOptions(
// //         apiKey: 'AIzaSyAXIrfc1nbJN8m5tRqqr5yRuHwo-gvvzb8',
// //         appId: '1:882145525830:ios:15fdce82b311ca772e8a47',
// //         messagingSenderId: '882145525830',
// //         projectId: 'trail-vault-d5ea8',
// //         storageBucket: 'trail-vault-d5ea8.appspot.com',
// //         iosBundleId: 'com.trailvault.trailVault',  // Specific for iOS
// //       ));
// //
// //       File file = File(filePath);
// //       String firestorePath = "/1111.pdf";
// //       Reference ref = FirebaseStorage.instance.ref().child(firestorePath);
// //
// //      var result=await ref.putFile(file);
// //       print("File uploaded successfully");
// //     } catch (e) {
// //       print("Error uploading file: $e");
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Upload File to Firebase'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             ElevatedButton(
// //               onPressed: _pickAndUploadFile,
// //               child: Text('Pick and Upload File'),
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               _uploadStatus ?? '',
// //               style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// /*
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_isolate/flutter_isolate.dart';
//
// FirebaseOptions firebaseOptions = const FirebaseOptions(
//   apiKey: 'AIzaSyAXIrfc1nbJN8m5tRqqr5yRuHwo-gvvzb8',
//   appId: '1:882145525830:ios:15fdce82b311ca772e8a47',
//   messagingSenderId: '882145525830',
//   projectId: 'trail-vault-d5ea8',
//   storageBucket: 'trail-vault-d5ea8.appspot.com',
//   iosBundleId: 'com.trailvault.trailVault',
// );
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: firebaseOptions);
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase Upload Isolate Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: UploadPage(),
//     );
//   }
// }
//
// class UploadPage extends StatefulWidget {
//   @override
//   _UploadPageState createState() => _UploadPageState();
// }
//
// class _UploadPageState extends State<UploadPage> {
//   FlutterIsolate? _isolate;
//   String _uploadStatus = "Waiting for upload...";
//
//   @override
//   void dispose() {
//     _isolate?.kill();
//     super.dispose();
//   }
//
//   Future<void> _pickAndUploadFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null && result.files.single.path != null) {
//       String filePath = result.files.single.path!;
//       setState(() {
//         _uploadStatus = "Uploading...";
//       });
//
//       // Pass the file path to the isolate
//       _isolate = await FlutterIsolate.spawn(uploadFileIsolate, filePath);
//
//       // Listen to the isolate for completion
//       // _isolate?.onExit.then((_) {
//       //   setState(() {
//       //     _uploadStatus = "Upload completed";
//       //   });
//       // }).catchError((e) {
//       //   setState(() {
//       //     _uploadStatus = "Error: $e";
//       //   });
//       // });
//     } else {
//       setState(() {
//         _uploadStatus = "No file selected";
//       });
//     }
//   }
//
//   // Use the Firebase instance from the main isolate
//   static Future<void> uploadFileIsolate(String filePath) async {
//     try {
//       // Ensure you have already initialized Firebase in the main isolate
//       // You cannot initialize Firebase here
//
//       File file = File(filePath);
//       String firestorePath = "uploads/${file.uri.pathSegments.last}";
//       Reference ref = FirebaseStorage.instance.ref().child(firestorePath);
//
//       UploadTask uploadTask = ref.putFile(file);
//       await uploadTask;
//
//       print("File uploaded successfully");
//     } catch (e) {
//       print("Error uploading file: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload File to Firebase'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _pickAndUploadFile,
//               child: Text('Pick and Upload File'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _uploadStatus,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// */
//
//
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart' as cfs;
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_isolate/flutter_isolate.dart';
//
// FirebaseOptions firebaseOptions = const FirebaseOptions(
//   appId: '1:22422496521:ios:f73724ea7e31817c201fd8',
//   apiKey: 'AIzaSyC3UmZIxCZZsaPdhOZ8NB8l_A5XrJ-S2Wg',
//   projectId: 'trail-vault',
//   messagingSenderId: '22422496521',
//   storageBucket: 'trail-vault.appspot.com',
//   iosBundleId: 'com.trailvault.trailVault',
//   databaseURL: 'https://trail-vault-default-rtdb.firebaseio.com',
// );
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: firebaseOptions);
//   // if (Firebase.apps.isEmpty) {
//   //   await Firebase.initializeApp();
//   // }
//   final emulatorHost =
//   (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
//       ? '10.0.2.2'
//       : 'localhost';
//
//   // await FirebaseStorage.instance.useStorageEmulator(emulatorHost, 9199);
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase Upload Isolate Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: UploadPage(),
//     );
//   }
// }
//
// class UploadPage extends StatefulWidget {
//   @override
//   _UploadPageState createState() => _UploadPageState();
// }
//
// class _UploadPageState extends State<UploadPage> {
//   FlutterIsolate? _isolate;
//   String? _uploadStatus = "Waiting for upload...";
//
//   @override
//   void dispose() {
//     _isolate?.kill();
//     super.dispose();
//   }
//
//   Future<void> _pickAndUploadFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null && result.files.single.path != null) {
//       String filePath = result.files.single.path!;
//       setState(() {
//         _uploadStatus = "Uploading...";
//       });
//       await uploadFileInIsolate(filePath);
//     } else {
//       setState(() {
//         _uploadStatus = "No file selected";
//       });
//     }
//   }
//
//   Future<void> uploadFileInIsolate(String filePath) async {
//     _isolate = await FlutterIsolate.spawn(uploadFileIsolate, filePath);}
//
//   // This function will run in the isolate
//   static Future<void> uploadFileIsolate(String filePath) async {
//     try {
//       // Initialize Firebase in isolate
//       await Firebase.initializeApp(options: FirebaseOptions(
//         appId: '1:22422496521:ios:f73724ea7e31817c201fd8',
//         apiKey: 'AIzaSyC3UmZIxCZZsaPdhOZ8NB8l_A5XrJ-S2Wg',
//         projectId: 'trail-vault',
//         messagingSenderId: '22422496521',
//         storageBucket: 'trail-vault.appspot.com',
//         iosBundleId: 'com.trailvault.trailVault',
//         databaseURL: 'https://trail-vault-default-rtdb.firebaseio.com',
//       ));
//
//       File file = File(filePath);
//       // String destination =
//       //     'uploads/${DateTime.now().millisecondsSinceEpoch}.pdf';
//       // FirebaseStorage storage = FirebaseStorage.instance;
//       //
//       // // Upload the file to Firebase Storage
//       // await storage.ref(destination).putFile(file);
//       String firestorePath = "/2222.pdf";
//       Reference ref = FirebaseStorage.instance.ref().child(firestorePath);
//
//       var result=await ref.putFile(file);
//       print("File uploaded successfully");
//     } catch (e) {
//       print("Error uploading file: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload File to Firebase'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _pickAndUploadFile,
//               child: Text('Pick and Upload File'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _uploadStatus ?? '',
//               style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'dart:isolate';
import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// Firebase Configuration Options
FirebaseOptions firebaseOptions = const FirebaseOptions(
  apiKey: 'AIzaSyAXIrfc1nbJN8m5tRqqr5yRuHwo-gvvzb8',
  appId: '1:882145525830:ios:15fdce82b311ca772e8a47',
  messagingSenderId: '882145525830',
  projectId: 'trail-vault-d5ea8',
  storageBucket: 'trail-vault-d5ea8.appspot.com',
  iosBundleId: 'com.trailvault.trailVault',  // Specific for iOS
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  await FlutterDownloader.initialize(debug: true);  // Initialize the downloader
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Upload with Background Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadPage(),
    );
  }
}

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String? _uploadStatus = "Waiting for upload...";
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    _getDownloadURL();
    IsolateNameServer.registerPortWithName(_port.sendPort, 'uploader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      setState(() {
        _uploadStatus = "Uploading: $progress%";
        if (status == DownloadTaskStatus.complete) {
          _uploadStatus = "Upload complete!";
        }
      });
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }
  String? _downloadURL;
  Future<void> _getDownloadURL() async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;

      // Get the reference to the file you want to download.
      // This could be any file path you've previously used during upload
      Reference ref = storage.ref().child("uploads/test.pdf");

      // Fetch the download URL
      String downloadURL = await ref.getDownloadURL();

      setState(() {
        _downloadURL = downloadURL;
      });
    } catch (e) {
      setState(() {
        _downloadURL = "Error occurred: $e";
      });
    }
  }
  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('uploader_send_port');
    super.dispose();
  }

  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName('uploader_send_port');
    send?.send([id, status, progress]);
  }


  Future<void> _pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      String filePath = result.files.single.path!;
      setState(() {
        _uploadStatus = "Uploading...";
      });

      await _startUpload(filePath);
    } else {
      setState(() {
        _uploadStatus = "No file selected";
      });
    }
  }

  Future<void> _startUpload(String filePath) async {
    // Simulate the upload by saving the file in Firebase Storage
    File file = File(filePath);
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("uploads/${file.uri.pathSegments.last}");

      // Get the app's document directory for storing files locally.
      final dir = await getApplicationDocumentsDirectory();

      // Requesting the permissions
      final status = await Permission.storage.request();
      if (status.isGranted) {
        // Upload logic goes here
        await FlutterDownloader.enqueue(
          url: 'https://firebase.storage/upload',  // URL is required by flutter_downloader, although it will not be used for upload here
          savedDir: dir.path,  // Saved directory path
          showNotification: true,  // show upload status notification
          openFileFromNotification: false,  // Disable file open after upload
        );

        // Actual Firebase upload
        await ref.putFile(file);

        setState(() {
          _uploadStatus = "File uploaded successfully!";
        });
      } else {
        print('Permission not granted');
      }
    } catch (e) {
      print("Error uploading file: $e");
      setState(() {
        _uploadStatus = "Upload failed";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload File to Firebase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickAndUploadFile,
              child: Text('Pick and Upload File'),
            ),
            SizedBox(height: 20),
            Text(
              _uploadStatus ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                if (_downloadURL != null) {
                  downloadFile();
                }
              },
              child: Text('Download File'),
            ),
          ],
        ),
      ),
    );
  }
  // Future<void> downloadFile(String url) async {
  //   Dio dio = Dio();
  //   try {
  //     var dir = await getApplicationDocumentsDirectory();
  //     String savePath = "${dir.path}/my_document.pdf";
  //     await dio.download(url, savePath);
  //     print("File downloaded to: $savePath");
  //   } catch (e) {
  //     print("Download failed: $e");
  //   }
  // }

  Future<void> downloadFile() async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("uploads/my_document.pdf");

      // Get the download URL from Firebase
      String downloadUrl = await ref.getDownloadURL();

      // Requesting storage permission
      final status = await Permission.storage.request();
      if (status.isGranted) {
        // Get the application documents directory
        final dir = await getApplicationDocumentsDirectory();
        String savedDir = dir.path;
        // Enqueue the download task
        await FlutterDownloader.enqueue(
          url: downloadUrl,
          savedDir: savedDir,
          fileName: "my_document.pdf",
          showNotification: true, // show download progress in the status bar (for Android)
          openFileFromNotification: true, // click on notification to open the file
        );
        File downloadedFile = File('$savedDir/my_document.pdf');
        bool fileExists = await downloadedFile.exists();
        if (fileExists) {
          print('File downloaded successfully at: ${downloadedFile.path}');
        } else {
          print('File download failed or not found.');
        }
      } else {
        print('Storage permission not granted');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

}

