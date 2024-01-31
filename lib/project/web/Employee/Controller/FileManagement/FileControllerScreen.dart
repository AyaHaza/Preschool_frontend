import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../../Model/File.dart';
import '../../view/FileManagement/file.dart' as filescreen;
import 'FileController.dart';
import 'package:url_launcher/url_launcher.dart';
class FileControllerScreen extends GetxController {

  FileController controller = Get.find();
  List<File> files=[];
  var isLoading = false;
  static FirebaseStorage storage = FirebaseStorage.instance;
  @override
  void onInit() async {

    super.onInit();

  }

  void updateload(bool isload){
    isLoading=isload;
    update();
  }
  Future<void> Store() async {
    isLoading = true;
    update();

    files.forEach((element) async {
      element.status="unavailable";
//storage file ref with path
      final ref = storage.ref().child(
          '/Files/${element!.name} _${DateTime.now().millisecondsSinceEpoch}.${element.extention}');

// //uploading file

      await ref.putData(
          element.uploadfile!, SettableMetadata(contentType: 'application/${element.extention}'));

      await ref.getDownloadURL().then((value) {
        element!.path = value;
      });

      await controller.Store(element!);
    });


    isLoading = false;
    update();
  }

  // Future<void>getfiles() async {
  //   files.clear();
  //   final storageRef = storage.ref().child("/Files");
  //   final listResult = await storageRef.listAll();
  //   int i=0;
  //   // await c
  //   //////////get
  //   for (var item in listResult.items) {
  //   // await item.getDownloadURL().then((value) =>files.addAll({i:File(path:value )}));
  //   i++;
  //   }
  // }
  void open(i){
    // print( files[i]!.path!);
    // Get.to(filescreen.File( content:
    // Expanded(
    //   child: SizedBox(
    //     width: 500.w,
    //     height: 500.h,
    //     child: SfPdfViewer.network(
    //        files[i]!.path!,
    //       canShowScrollHead: true,
    //         enableDoubleTapZooming: true
    //     ),
    //   ),
    // )
    // )
    // );
    //
    launchInBrowser(Uri.parse(controller.Files.values.elementAt(i)!.path!));
    // Get.to(filescreen.File(content: FutureBuilder(
    //   future:  launchInBrowser(Uri.parse(files[i]!.path!)),
    //   builder: (ctx, authResultSnapshot) =>
    //   authResultSnapshot.connectionState ==
    //       ConnectionState.waiting
    //       ? const Center(child: CircularProgressIndicator())
    //       : Text('')
    // )
    // ));
  }
  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
