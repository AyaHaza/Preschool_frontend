import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../../Model/File.dart';
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


  void open(i){
    launchInBrowser(Uri.parse(controller.Files.values.elementAt(i)!.path!));
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
